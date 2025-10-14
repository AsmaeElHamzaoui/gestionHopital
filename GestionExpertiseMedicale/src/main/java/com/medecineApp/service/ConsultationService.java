package com.medecineApp.service;

import com.medecineApp.enums.StatutConsultation;
import com.medecineApp.model.Consultation;
import com.medecineApp.model.Patient;
import com.medecineApp.repository.ConsultationRepository;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ConsultationService {
    private final ConsultationRepository repo = new ConsultationRepository();

    public List<Consultation> getAllConsultationsByPatientId(Long patientId) {
        return repo.findAllByPatientId(patientId);
    }

    public List<Consultation> getAllConsultations() {
        return repo.findAll()
                .stream()
                .filter(c ->c.getStatut().equals(StatutConsultation.EN_ATTENTE_AVIS_SPECIALISTE)) // filtre par statut
                .sorted(Comparator.comparing(Consultation::getDateConsultation)) // tri croissant par date
                .collect(Collectors.toList());
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