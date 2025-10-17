package com.medecineApp.service;

import com.medecineApp.model.Patient;
import com.medecineApp.repository.PatientRepository;
import java.util.List;

public class PatientService {

    private final PatientRepository repo;

    public PatientService(PatientRepository repo) {
        this.repo = repo;
    }

    // Constructeur par défaut pour la production
    public PatientService() {
        this.repo = new PatientRepository();
    }

    public List<Patient> getAllPatients() {
        return repo.findAll();
    }

    public void savePatient(Patient p) {
        repo.save(p);
    }

    public Patient getPatient(Long id) {
        return repo.findById(id);
    }

    public void deletePatient(Long id) {
        repo.delete(id);
    }
}