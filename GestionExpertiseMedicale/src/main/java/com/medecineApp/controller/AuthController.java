package com.medecineApp.controller;

import com.medecineApp.model.User;
import com.medecineApp.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/auth")
public class AuthController extends HttpServlet {

    private final UserService service = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // 🔍 Debug: afficher les valeurs reçues
        System.out.println("=== AUTH DEBUG ===");
        System.out.println("Email reçu : " + email);
        System.out.println("Mot de passe reçu : " + password);

        User user = service.authenticate(email, password);

        // 🔍 Debug: afficher le résultat de l'authentification
        if (user != null) {
            System.out.println("Utilisateur authentifié : " + user.getEmail());
            System.out.println("Rôle : " + user.getRole());

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userRole", user.getRole().name());

            res.sendRedirect(req.getContextPath() + "/dashboard");
        } else {
            System.out.println("⚠️ Authentification échouée : utilisateur non trouvé ou mot de passe incorrect");

            req.setAttribute("error", "Email ou mot de passe incorrect");
            req.getRequestDispatcher("/pages/home.jsp").forward(req, res);
        }
    }
}
