package com.medecineApp.service;

import com.medecineApp.model.Consultation;
import com.medecineApp.repository.ConsultationRepository;
import java.util.List;

public class ConsultationService {
    private final ConsultationRepository repo = new ConsultationRepository();

    public List<Consultation> getAllConsultationsByPatientId(Long patientId) {
        return repo.findAllByPatientId(patientId);
    }

    public void saveConsultation(Consultation c) {
        repo.save(c);
    }

    public Consultation getConsultation(Long id) {
        return repo.findById(id);
    }

    public void deleteConsultation(Long id) {
        repo.delete(id);
    }
}