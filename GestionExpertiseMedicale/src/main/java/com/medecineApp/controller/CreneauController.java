package com.medecineApp.controller;

import com.medecineApp.model.Creneau;
import com.medecineApp.model.User;
import com.medecineApp.service.CreneauService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalTime;
import java.util.List;

@WebServlet("/creneaux")
public class CreneauController extends HttpServlet {

    private final CreneauService service = new CreneauService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Vérification session
        if (user == null || !"SPECIALISTE".equals(user.getRole().toString())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        // Suppression
        if ("delete".equals(action) && idParam != null && !idParam.isEmpty()) {
            service.deleteCreneau(Long.parseLong(idParam));
            response.sendRedirect(request.getContextPath() + "/creneaux?action=list");
            return;
        }

        // Affichage des créneaux
        List<Creneau> creneaux = service.getCreneauxBySpecialiste(user.getId());
        request.setAttribute("creneaux", creneaux);

        // Forward vers JSP
        request.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"SPECIALISTE".equals(user.getRole().toString())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String heureDebut = request.getParameter("heureDebut");
        String heureFin = request.getParameter("heureFin");
        String disponibleParam = request.getParameter("disponible");
        String dateJour = request.getParameter("dateJourActuelle");

        try {
            Creneau creneau = new Creneau();
            creneau.setHeureDebut(LocalTime.parse(heureDebut));
            creneau.setHeureFin(LocalTime.parse(heureFin));
            creneau.setDisponible(disponibleParam != null && disponibleParam.equals("on"));
            creneau.setIdSpecialiste(user.getId());
            creneau.setDateJourActuelle(java.time.LocalDate.parse(dateJour));

            if ("edit".equals(action) && idParam != null && !idParam.isEmpty()) {
                creneau.setId(Long.parseLong(idParam));
            }

            service.saveCreneau(creneau);

            // Redirection vers la liste des créneaux après ajout/modif
            response.sendRedirect(request.getContextPath() + "/creneaux?action=list");

        } catch (Exception e) {
            // En cas d'erreur, on renvoie sur la page avec message d'erreur
            request.setAttribute("error", "Erreur : " + e.getMessage());
            List<Creneau> creneaux = service.getCreneauxBySpecialiste(user.getId());
            request.setAttribute("creneaux", creneaux);
            request.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(request, response);
        }
    }
}
