package com.medecineApp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.medecineApp.model.User;

import java.io.IOException;

@WebServlet("/dashboard-specialiste")
public class DashboardSpecialisteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().toString().equals("SPECIALISTE")) {
            resp.sendRedirect("login");
            return;
        }

        // Passer l'utilisateur à la JSP
        req.setAttribute("user", user);
        req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, resp);
    }
}