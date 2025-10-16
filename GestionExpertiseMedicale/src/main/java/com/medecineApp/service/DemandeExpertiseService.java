package com.medecineApp.service;

import com.medecineApp.enums.StatutExpertise;
import com.medecineApp.model.Consultation;
import com.medecineApp.model.DemandeExpertise;
import com.medecineApp.model.User;
import com.medecineApp.repository.ConsultationRepository;
import com.medecineApp.repository.DemandeExpertiseRepository;
import com.medecineApp.repository.UserRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class DemandeExpertiseService {

    private final DemandeExpertiseRepository demandeRepo = new DemandeExpertiseRepository();
    private final ConsultationRepository consultationRepo = new ConsultationRepository();
    private final UserRepository userRepo = new UserRepository();

    // Récupérer toutes les demandes d'expertise
    public List<DemandeExpertise> getAllDemandes() {
        return demandeRepo.findAll();
    }

    // Récupérer les demandes par ID de consultation
    public List<DemandeExpertise> getDemandesByConsultationId(Long consultationId) {
        return demandeRepo.findAllByConsultationId(consultationId);
    }

    // Récupérer les demandes par ID de spécialiste
    public List<DemandeExpertise> getNowDemandesBySpecialisteId(Long specialisteId) {
        LocalDate today = LocalDate.now(); // date du jour actuelle
        return demandeRepo.findAllBySpecialisteId(specialisteId)
                          .stream()
                          .filter(d->d.getDateDemande().toLocalDate().isEqual(today))
                          .collect(Collectors.toList());
    }

    // Sauvegarder une nouvelle demande d'expertise
// Sauvegarder une nouvelle demande d'expertise ou mettre à jour une existante
    public void saveDemande(DemandeExpertise demande) {
        // Vérifier que la consultation existe
        Consultation consultation = consultationRepo.findById(demande.getConsultation().getId());
        if (consultation == null) {
            throw new IllegalArgumentException("Consultation non trouvée pour l'ID : " + demande.getConsultation().getId());
        }

        // Vérifier que le spécialiste existe (si spécifié)
        if (demande.getSpecialiste() != null) {
            User specialiste = userRepo.findById(demande.getSpecialiste().getId());
            if (specialiste == null) {
                throw new IllegalArgumentException("Spécialiste non trouvé pour l'ID : " + demande.getSpecialiste().getId());
            }
            // Vérifier que le spécialiste a la spécialité indiquée
            if (!specialiste.getSpecialite().equals(demande.getSpecialite())) {
                throw new IllegalArgumentException("Le spécialiste n'a pas la spécialité requise : " + demande.getSpecialite());
            }
        }

        // Ne pas réinitialiser reponse et tarif si la demande existe déjà
        if (demande.getId() == null) {
            demande.setReponse(null);
            demande.setTarif(null);
        }

        demandeRepo.save(demande);
    }

    // Mettre à jour la réponse et le tarif par le spécialiste
    public void updateReponseAndTarif(Long demandeId, String reponse, Double tarif, Long specialisteId) {
        DemandeExpertise demande = demandeRepo.findById(demandeId);
        if (demande == null) {
            throw new IllegalArgumentException("Demande d'expertise non trouvée pour l'ID : " + demandeId);
        }

        // Vérifier que le spécialiste correspond
        if (demande.getSpecialiste() == null || !demande.getSpecialiste().getId().equals(specialisteId)) {
            throw new IllegalArgumentException("Seul le spécialiste assigné peut répondre à cette demande.");
        }

        // Mettre à jour la réponse, le tarif et le statut
        demande.setReponse(reponse);
        demande.setTarif(tarif);
        demande.setStatut(StatutExpertise.TERMINEE);
        demandeRepo.save(demande);
    }

    // Récupérer une demande par ID
    public DemandeExpertise getDemande(Long id) {
        return demandeRepo.findById(id);
    }

    // Supprimer une demande
    public void deleteDemande(Long id) {
        demandeRepo.delete(id);
    }
}