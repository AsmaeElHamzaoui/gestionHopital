package com.medecineApp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.medecineApp.model.User;
import com.medecineApp.service.CreneauJournalierService;
import com.medecineApp.model.CreneauJournalier;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard-specialiste")
public class DashboardSpecialisteController extends HttpServlet {
    private final CreneauJournalierService creneauService = new CreneauJournalierService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().toString().equals("SPECIALISTE")) {
            resp.sendRedirect("login");
            return;
        }

        // Fetch the time slots for the connected specialist
        List<CreneauJournalier> creneaux = creneauService.getCreneauxBySpecialiste(user.getId());

        // Pass the user and time slots to the JSP
        req.setAttribute("user", user);
        req.setAttribute("creneaux", creneaux);
        req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, resp);
    }
}