package com.medecineApp.controller;

import com.medecineApp.model.Consultation;
import com.medecineApp.model.Patient;
import com.medecineApp.enums.StatutConsultation;
import com.medecineApp.service.ConsultationService;
import com.medecineApp.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/consultations")
public class ConsultationController extends HttpServlet {

    private final ConsultationService consultationService = new ConsultationService();
    private final PatientService patientService = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        Long patientId = Long.parseLong(req.getParameter("patientId"));
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.setAttribute("patientId", patientId);
                req.getRequestDispatcher("/consultations/form.jsp").forward(req, res);
                break;
            case "edit":
                Long id = Long.parseLong(req.getParameter("id"));
                req.setAttribute("consultation", consultationService.getConsultation(id));
                req.setAttribute("patientId", patientId);
                req.getRequestDispatcher("/consultations/form.jsp").forward(req, res);
                break;
            case "delete":
                consultationService.deleteConsultation(Long.parseLong(req.getParameter("id")));
                res.sendRedirect("consultations?patientId=" + patientId);
                break;
            default:
                req.setAttribute("consultations", consultationService.getAllConsultationsByPatientId(patientId));
                req.setAttribute("patient", patientService.getPatient(patientId));
                req.getRequestDispatcher("/consultations/list.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String idStr = req.getParameter("id");
        Long patientId = Long.parseLong(req.getParameter("patientId"));

        Consultation c = new Consultation();
        if (idStr != null && !idStr.isEmpty())
            c.setId(Long.parseLong(idStr));

        c.setDateConsultation(LocalDate.parse(req.getParameter("dateConsultation")));
        c.setMotif(req.getParameter("motif"));
        c.setObservations(req.getParameter("observations"));
        c.setDiagnostic(req.getParameter("diagnostic"));
        c.setStatut(StatutConsultation.valueOf(req.getParameter("statut")));
        c.setCoutFixe(Double.parseDouble(req.getParameter("coutFixe")));
        c.setPatient(patientService.getPatient(patientId));

        consultationService.saveConsultation(c);
        res.sendRedirect("consultations?patientId=" + patientId);
    }
}