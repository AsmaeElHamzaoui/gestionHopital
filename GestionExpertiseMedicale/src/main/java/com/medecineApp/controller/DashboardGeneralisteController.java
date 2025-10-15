package com.medecineApp.controller;

import com.medecineApp.model.*;
import com.medecineApp.service.*;
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
    private final CreneauService creneauService=new CreneauService();
    private final DemandeExpertiseService demandeExpertise=new DemandeExpertiseService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetch all patients
        List<Patient> patients = patientService.getAllPatients();
        List<Consultation>  consultations=consultationService.getAllConsultations();
        List<User> specialistes=userService.getAllSpecialiste();
        List<Creneau> creneaux=creneauService.getCrenauxIndisponible();
        List<DemandeExpertise> demandes=demandeExpertise.getAllDemandes();
        req.setAttribute("patients", patients);
        req.setAttribute("consultations", consultations);
        req.setAttribute("specialistes",specialistes);
        req.setAttribute("creneaux",creneaux);
        req.setAttribute("demandes",demandes);
       req.getRequestDispatcher("/pages/dashboard-generaliste.jsp").forward(req, resp);
    }
}