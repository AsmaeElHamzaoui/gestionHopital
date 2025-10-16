package com.medecineApp.controller;

import com.medecineApp.enums.Role;
import com.medecineApp.model.Patient;
import com.medecineApp.model.SignesVitaux;
import com.medecineApp.model.User;
import com.medecineApp.service.PatientService;
import com.medecineApp.service.SignesVitauxService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet("/dashboard-infermier")
public class DashboardInfermierController extends HttpServlet {

    private final PatientService patientService = new PatientService();
    private final SignesVitauxService signesVitauxService = new SignesVitauxService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // Vérification du rôle avec enum
        if (user == null || user.getRole() != Role.INFIRMIER) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Charger tous les patients
        List<Patient> patients = patientService.getAllPatients();

        //  Charger les signes vitaux pour chaque patient
        Map<Long, List<SignesVitaux>> signesVitauxMap = new HashMap<>();
        for (Patient p : patients) {
            List<SignesVitaux> signesList = signesVitauxService.getAllSignesVitauxByPatientId(p.getId());
            signesVitauxMap.put(p.getId(), signesList);
        }

        // Passer les données à la JSP
        req.setAttribute("patients", patients);
        req.setAttribute("signesVitauxMap", signesVitauxMap);

        // Forward vers la page JSP
        req.getRequestDispatcher("/pages/dashboard-infermier.jsp").forward(req, res);

    }
}
