package com.medecineApp.servlet;

import com.medecineApp.model.ActeTechnique;
import com.medecineApp.model.Consultation;
import com.medecineApp.enums.TypeActeTechnique;
import com.medecineApp.service.ActeTechniqueService;
import com.medecineApp.service.ConsultationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/actes")
public class ActeController extends HttpServlet {
    private ActeTechniqueService acteService = new ActeTechniqueService();
    private ConsultationService consultationService = new ConsultationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long consultationId = Long.parseLong(req.getParameter("consultationId"));
        String acteTechniqueType = req.getParameter("typeActe");
        Double cout = Double.parseDouble(req.getParameter("cout"));

        Consultation consultation = consultationService.getConsultation(consultationId);

        // Créer l'acte technique
        ActeTechnique acte = new ActeTechnique();
        acte.setType(TypeActeTechnique.valueOf(acteTechniqueType));
        acte.setCout(cout);
        acte.setConsultation(consultation);

        // Sauvegarder dans la base de données
        acteService.saveOrUpdateActe(acte);

        // Redirection
        resp.sendRedirect("consultations?patientId=" + consultation.getPatient().getId());
    }
}