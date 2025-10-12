package com.medecineApp.controller;

import com.medecineApp.model.Patient;
import com.medecineApp.model.SignesVitaux;
import com.medecineApp.service.PatientService;
import com.medecineApp.service.SignesVitauxService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/signes-vitaux")
public class SignesVitauxController extends HttpServlet {

    private final SignesVitauxService signesVitauxService = new SignesVitauxService();
    private final PatientService patientService = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        Long patientId = Long.parseLong(req.getParameter("patientId"));
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.setAttribute("patientId", patientId);
                req.getRequestDispatcher("/pages/dashboard-infermier.jsp").forward(req, res);
                break;
            case "edit":
                Long id = Long.parseLong(req.getParameter("id"));
                req.setAttribute("signesVitaux", signesVitauxService.getSignesVitaux(id));
                req.setAttribute("patientId", patientId);
                req.getRequestDispatcher("/signes-vitaux/form.jsp").forward(req, res);
                break;
            case "delete":
                signesVitauxService.deleteSignesVitaux(Long.parseLong(req.getParameter("id")));
                res.sendRedirect("signes-vitaux?patientId=" + patientId);
                break;
            default:
                req.setAttribute("signesVitauxList", signesVitauxService.getAllSignesVitauxByPatientId(patientId));
                req.setAttribute("patient", patientService.getPatient(patientId));
                req.getRequestDispatcher("/pages/dashboard-infermier.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String idStr = req.getParameter("id");
        Long patientId = Long.parseLong(req.getParameter("patientId"));

        SignesVitaux s = new SignesVitaux();
        if (idStr != null && !idStr.isEmpty())
            s.setId(Long.parseLong(idStr));

        s.setTension(req.getParameter("tension"));
        s.setFrequenceCardiaque(Integer.parseInt(req.getParameter("frequenceCardiaque")));
        s.setTemperature(Double.parseDouble(req.getParameter("temperature")));
        s.setFrequenceRespiratoire(Integer.parseInt(req.getParameter("frequenceRespiratoire")));
        s.setPoids(Double.parseDouble(req.getParameter("poids")));
        s.setTaille(Double.parseDouble(req.getParameter("taille")));
        s.setDateMesure(LocalDate.parse(req.getParameter("dateMesure")));
        s.setPatient(patientService.getPatient(patientId));

        signesVitauxService.saveSignesVitaux(s);
        res.sendRedirect("signes-vitaux?patientId=" + patientId);
    }
}