package com.medecineApp.controller;

import com.medecineApp.model.User;
import com.medecineApp.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/users") //uri
public class UserController extends HttpServlet {

    private final UserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "new":
                req.getRequestDispatcher("/users/form.jsp").forward(req, res);
                break;
            case "edit":
                Long id = Long.parseLong(req.getParameter("id"));
                req.setAttribute("user", service.getUser(id));
                req.getRequestDispatcher("/users/form.jsp").forward(req, res);
                break;

            case "delete":
                service.deleteUser(Long.parseLong(req.getParameter("id")));
                res.sendRedirect("users");
                break;

            default:
                req.setAttribute("users", service.getAllUsers());
                req.getRequestDispatcher("/users/list.jsp").forward(req, res);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String idStr = req.getParameter("id");

        User u = new User();
        if (idStr != null && !idStr.isEmpty()) {
            u.setId(Long.parseLong(idStr));
        }

        u.setNom(req.getParameter("nom"));
        u.setPrenom(req.getParameter("prenom"));
        u.setEmail(req.getParameter("email"));
        u.setRole(com.medecineApp.enums.Role.valueOf(req.getParameter("role")));

        String password = req.getParameter("password");
        if (password != null && !password.isEmpty()) {
            u.setPassword(password); // sera hashé par le service
        } else if (u.getId() != null) {
            // si le champ est vide lors de la modification : on garde l’ancien mot de passe
            User existing = service.getUser(u.getId());
            if (existing != null) {
                u.setPassword(existing.getPassword());
            }
        }

        service.saveUser(u);
        res.sendRedirect("users");
    }
}
