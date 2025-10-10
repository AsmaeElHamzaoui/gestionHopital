package com.medecineApp.controller;

import com.medecineApp.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Vérifier si l'utilisateur est connecté
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Passer les informations utilisateur à la JSP
        req.setAttribute("user", user);
        req.setAttribute("role", user.getRole().name());

        req.getRequestDispatcher("/pages/dashboard.jsp").forward(req, res);
    }
}