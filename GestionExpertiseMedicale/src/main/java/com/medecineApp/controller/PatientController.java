package com.medecineApp.controller;

import com.medecineApp.model.Patient;
import com.medecineApp.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/patients")
public class PatientController extends HttpServlet {

    private final PatientService service = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "new":
                req.getRequestDispatcher("/pages/dashboard-infermier.jsp").forward(req, res);
                break;
            case "edit":
                Long id = Long.parseLong(req.getParameter("id"));
                req.setAttribute("patient", service.getPatient(id));
                req.getRequestDispatcher("/patients/form.jsp").forward(req, res);
                break;
            case "delete":
                service.deletePatient(Long.parseLong(req.getParameter("id")));
                res.sendRedirect("patients");
                break;
            default:
                req.setAttribute("patients", service.getAllPatients());
                req.getRequestDispatcher("/pages/dashboard-infermier.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String idStr = req.getParameter("id");

        Patient p = new Patient();
        if (idStr != null && !idStr.isEmpty())
            p.setId(Long.parseLong(idStr));

        p.setNom(req.getParameter("nom"));
        p.setPrenom(req.getParameter("prenom"));
        p.setDateNaissance(LocalDate.parse(req.getParameter("dateNaissance")));
        p.setNumSecu(req.getParameter("numSecu"));
        p.setTelephone(req.getParameter("telephone"));
        p.setAdresse(req.getParameter("adresse"));
        p.setDateEnregistrement(LocalDate.parse(req.getParameter("dateEnregistrement")));
        p.setStatut(req.getParameter("statut"));

        service.savePatient(p);
        res.sendRedirect("patients");
    }
}