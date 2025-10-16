package com.medecineApp.controller;

import com.medecineApp.model.Creneau;
import com.medecineApp.model.DemandeExpertise;
import com.medecineApp.service.CreneauService;
import com.medecineApp.service.DemandeExpertiseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.medecineApp.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard-specialiste")
public class DashboardSpecialisteController extends HttpServlet {
    private final CreneauService creneauService = new CreneauService();
    private final DemandeExpertiseService demandeExpertise=new DemandeExpertiseService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().toString().equals("SPECIALISTE")) {
            resp.sendRedirect("login");
            return;
        }

        System.out.println("hi");
        // Fetch the time slots for the connected specialist
        List<Creneau> creneaux = creneauService.getCreneauxBySpecialiste(user.getId());
        List<DemandeExpertise> demandes=demandeExpertise.getNowDemandesBySpecialisteId(user.getId());
        Long total= demandeExpertise.totalDemandeSpecialiste(user.getId());
        double revenu=demandeExpertise.revenuSpecialiste(user.getId());
        // Pass the user and time slots to the JSP
        req.setAttribute("user", user);
        req.setAttribute("creneaux", creneaux);
        req.setAttribute("demandes",demandes);
        req.setAttribute("total",total);
        req.setAttribute("revenu",revenu);
        req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, resp);
    }
}