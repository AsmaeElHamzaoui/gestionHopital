package com.medecineApp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Récupération de la session existante (sans en créer une nouvelle)
        HttpSession session = req.getSession(false);

        if (session != null) {
            session.invalidate(); // Invalide la session pour déconnecter l'utilisateur
            System.out.println("Session utilisateur détruite, déconnexion réussie.");
        } else {
            System.out.println("Aucune session trouvée, l'utilisateur était déjà déconnecté.");
        }

        // Redirection vers la page de login ou d'accueil
        res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
    }

    // Optionnel : si tu veux aussi gérer POST pour logout
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}
