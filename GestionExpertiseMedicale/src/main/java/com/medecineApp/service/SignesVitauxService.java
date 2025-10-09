package com.medecineApp.service;

import com.medecineApp.model.SignesVitaux;
import com.medecineApp.repository.SignesVitauxRepository;
import java.util.List;

public class SignesVitauxService {
    private final SignesVitauxRepository repo = new SignesVitauxRepository();

    public List<SignesVitaux> getAllSignesVitauxByPatientId(Long patientId) {
        return repo.findAllByPatientId(patientId);
    }

    public void saveSignesVitaux(SignesVitaux s) {
        repo.save(s);
    }

    public SignesVitaux getSignesVitaux(Long id) {
        return repo.findById(id);
    }

    public void deleteSignesVitaux(Long id) {
        repo.delete(id);
    }
}