package com.medecineApp.controller;

import com.medecineApp.model.Consultation;
import com.medecineApp.model.CreneauJournalier;
import com.medecineApp.model.Patient;
import com.medecineApp.model.User;
import com.medecineApp.service.ConsultationService;
import com.medecineApp.service.CreneauJournalierService;
import com.medecineApp.service.PatientService;
import com.medecineApp.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard-generaliste")
public class DashboardGeneralisteController extends HttpServlet {
    private final PatientService patientService = new PatientService();
    private final ConsultationService consultationService= new ConsultationService();
    private final UserService userService=new UserService();
    private final CreneauJournalierService creneauJourService=new CreneauJournalierService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetch all patients
        List<Patient> patients = patientService.getAllPatients();
        List<Consultation>  consultations=consultationService.getAllConsultations();
        List<User> specialistes=userService.getAllSpecialiste();
        List<CreneauJournalier> creneaux=creneauJourService.getCreneauxSpecialisteNonActif();
        req.setAttribute("patients", patients);
        req.setAttribute("consultations", consultations);
        req.setAttribute("specialistes",specialistes);
        req.setAttribute("creneaux",creneaux);


        // Forward to the JSP
        req.getRequestDispatcher("/pages/dashboard-generaliste.jsp").forward(req, resp);
    }
}