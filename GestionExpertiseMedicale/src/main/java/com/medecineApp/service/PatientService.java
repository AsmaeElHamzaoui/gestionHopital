package com.medecineApp.service;

import com.medecineApp.model.Patient;
import com.medecineApp.repository.PatientRepository;
import java.util.List;

public class PatientService {
    private final PatientRepository repo = new PatientRepository();

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