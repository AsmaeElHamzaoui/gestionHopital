package com.medecineApp.controller;

import com.medecineApp.model.CreneauJournalier;
import com.medecineApp.model.User;
import com.medecineApp.enums.JourSemaine;
import com.medecineApp.service.CreneauJournalierService;
import com.medecineApp.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/creneaux")
public class CreneauJournalierController extends HttpServlet {

    private final CreneauJournalierService creneauService = new CreneauJournalierService();
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().toString().equals("SPECIALISTE")) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "delete":
                Long deleteId = Long.parseLong(req.getParameter("id"));
                CreneauJournalier creneauToDelete = creneauService.getCreneau(deleteId);
                if (creneauToDelete != null && creneauToDelete.getSpecialiste().getId().equals(user.getId())) {
                    creneauService.deleteCreneau(deleteId);
                }
                res.sendRedirect("dashboard-specialiste");
                break;

            case "semaine":
                req.setAttribute("joursSemaine", JourSemaine.values());
                req.setAttribute("creneaux", creneauService.getCreneauxBySpecialiste(user.getId()));
                req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, res);
                break;

            default:
                req.setAttribute("creneaux", creneauService.getCreneauxBySpecialiste(user.getId()));
                req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().toString().equals("SPECIALISTE")) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");

        if ("semaine".equals(action)) {
            // Gestion de la saisie de la semaine complète
            traiterSemaineComplete(req, res, user);
        } else {
            // Gestion d'un créneau individuel (add or edit)
            traiterCreneauIndividuel(req, res, user);
        }
    }

    private void traiterCreneauIndividuel(HttpServletRequest req, HttpServletResponse res, User user) throws IOException, ServletException {
        String idStr = req.getParameter("id");

        CreneauJournalier creneau = new CreneauJournalier();
        if (idStr != null && !idStr.isEmpty()) {
            creneau.setId(Long.parseLong(idStr));
        }

        creneau.setSpecialiste(user);
        creneau.setJourSemaine(JourSemaine.valueOf(req.getParameter("jourSemaine")));
        creneau.setHeureDebut(LocalTime.parse(req.getParameter("heureDebut")));
        creneau.setHeureFin(LocalTime.parse(req.getParameter("heureFin")));
        creneau.setDureeConsultationMinutes(Integer.parseInt(req.getParameter("dureeConsultationMinutes")));
        creneau.setActif(req.getParameter("actif") != null);

        try {
            creneauService.saveCreneau(creneau);
            res.sendRedirect("dashboard-specialiste");
        } catch (IllegalArgumentException e) {
            req.setAttribute("error", e.getMessage());
            req.setAttribute("creneaux", creneauService.getCreneauxBySpecialiste(user.getId()));
            req.getRequestDispatcher("/pages/dashboard-specialiste.jsp").forward(req, res);
        }
    }

    private void traiterSemaineComplete(HttpServletRequest req, HttpServletResponse res, User user) throws IOException {
        List<CreneauJournalier> creneaux = new ArrayList<>();

        for (JourSemaine jour : JourSemaine.values()) {
            String heureDebutStr = req.getParameter("heureDebut_" + jour);
            String heureFinStr = req.getParameter("heureFin_" + jour);
            String dureeStr = req.getParameter("duree_" + jour);
            String actifStr = req.getParameter("actif_" + jour);

            if (heureDebutStr != null && !heureDebutStr.isEmpty() &&
                    heureFinStr != null && !heureFinStr.isEmpty() &&
                    dureeStr != null && !dureeStr.isEmpty()) {

                CreneauJournalier creneau = new CreneauJournalier();
                creneau.setSpecialiste(user);
                creneau.setJourSemaine(jour);
                creneau.setHeureDebut(LocalTime.parse(heureDebutStr));
                creneau.setHeureFin(LocalTime.parse(heureFinStr));
                creneau.setDureeConsultationMinutes(Integer.parseInt(dureeStr));
                creneau.setActif(actifStr != null);

                creneaux.add(creneau);
            }
        }

        try {
            creneauService.saveCreneauxSemaine(user.getId(), creneaux);
            res.sendRedirect("dashboard-specialiste?success=true");
        } catch (Exception e) {
            res.sendRedirect("dashboard-specialiste?error=" + e.getMessage());
        }
    }
}