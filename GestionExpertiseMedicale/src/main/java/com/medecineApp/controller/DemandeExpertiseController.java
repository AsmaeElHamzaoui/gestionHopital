package com.medecineApp.controller;

import com.medecineApp.enums.Specialiste;
import com.medecineApp.enums.StatutExpertise;
import com.medecineApp.model.Consultation;
import com.medecineApp.model.DemandeExpertise;
import com.medecineApp.model.User;
import com.medecineApp.service.ConsultationService;
import com.medecineApp.service.DemandeExpertiseService;
import com.medecineApp.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/demande-expertise")
public class DemandeExpertiseController extends HttpServlet {
    private final DemandeExpertiseService demandeService = new DemandeExpertiseService();
    private final ConsultationService consultationService = new ConsultationService();
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            // Afficher le formulaire de modification
            Long id = Long.parseLong(req.getParameter("id"));
            DemandeExpertise demande = demandeService.getDemande(id);
            req.setAttribute("demande", demande);
            req.setAttribute("consultations", consultationService.getAllConsultations());
            req.setAttribute("specialistes", userService.getAllSpecialiste());
            req.getRequestDispatcher("/pages/edit-demande-expertise.jsp").forward(req, resp);
        } else {
            // Afficher la liste des demandes d'expertise
            List<DemandeExpertise> demandes = demandeService.getAllDemandes();
            req.setAttribute("demandes", demandes);
            req.getRequestDispatcher("/pages/dashboard-generaliste.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        // Formatter pour la date + heure envoyée depuis le formulaire
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        if ("add".equals(action)) {
            Long consultationId = Long.parseLong(req.getParameter("consultation"));
            String question = req.getParameter("question");
            Integer priorite = Integer.parseInt(req.getParameter("priorite"));
            String specialiteStr = req.getParameter("specialite");
            String specialisteIdStr = req.getParameter("specialiste");
            String dateDemandeStr = req.getParameter("dateDemande");
            String tarifStr = req.getParameter("tarif");

            Consultation consultation = consultationService.getConsultation(consultationId);
            Specialiste specialite = Specialiste.valueOf(specialiteStr);
            User specialiste = specialisteIdStr.isEmpty() ? null : userService.getUser(Long.parseLong(specialisteIdStr));
            LocalDateTime dateDemande = dateDemandeStr.isEmpty()
                    ? LocalDateTime.now()
                    : LocalDateTime.parse(dateDemandeStr, formatter);
            Double tarif = tarifStr.isEmpty() ? null : Double.parseDouble(tarifStr);

            DemandeExpertise demande = new DemandeExpertise(dateDemande, question, priorite, StatutExpertise.EN_ATTENTE, consultation, specialite);
            demande.setSpecialiste(specialiste);
            demande.setTarif(tarif);

            demandeService.saveDemande(demande);
            resp.sendRedirect("dashboard-generaliste#expertise-section");

        } else if ("update".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            Long consultationId = Long.parseLong(req.getParameter("consultation"));
            String question = req.getParameter("question");
            Integer priorite = Integer.parseInt(req.getParameter("priorite"));
            String specialiteStr = req.getParameter("specialite");
            String specialisteIdStr = req.getParameter("specialiste");
            String dateDemandeStr = req.getParameter("dateDemande");
            String tarifStr = req.getParameter("tarif");

            DemandeExpertise demande = demandeService.getDemande(id);
            demande.setConsultation(consultationService.getConsultation(consultationId));
            demande.setQuestion(question);
            demande.setPriorite(priorite);
            demande.setSpecialite(Specialiste.valueOf(specialiteStr));
            demande.setSpecialiste(specialisteIdStr.isEmpty() ? null : userService.getUser(Long.parseLong(specialisteIdStr)));
            demande.setDateDemande(dateDemandeStr.isEmpty()
                    ? LocalDateTime.now()
                    : LocalDateTime.parse(dateDemandeStr, formatter));
            demande.setTarif(tarifStr.isEmpty() ? null : Double.parseDouble(tarifStr));

            demandeService.saveDemande(demande);
            resp.sendRedirect("dashboard-generaliste#expertise-section");

        } else if ("delete".equals(action)) {
            Long id = Long.parseLong(req.getParameter("id"));
            demandeService.deleteDemande(id);
            resp.sendRedirect("dashboard-generaliste#expertise-section");
        }
    }
}