package com.medecineApp.service;

import com.medecineApp.model.CreneauJournalier;
import com.medecineApp.model.User;
import com.medecineApp.enums.JourSemaine;
import com.medecineApp.repository.CreneauJournalierRepository;
import com.medecineApp.repository.UserRepository;

import java.time.LocalTime;
import java.util.List;

public class CreneauJournalierService {
    private final CreneauJournalierRepository repo = new CreneauJournalierRepository();
    private final UserRepository userRepo = new UserRepository();

    public List<CreneauJournalier> getCreneauxBySpecialiste(Long specialisteId) {
        return repo.findBySpecialisteId(specialisteId);
    }

    public List<CreneauJournalier> getCreneauxBySpecialisteAndJour(Long specialisteId, JourSemaine jourSemaine) {
        return repo.findBySpecialisteIdAndJour(specialisteId, jourSemaine);
    }

    public CreneauJournalier getCreneau(Long id) {
        return repo.findById(id);
    }

    public void saveCreneau(CreneauJournalier creneau) {
        // Validation des heures
        if (creneau.getHeureDebut().isAfter(creneau.getHeureFin())) {
            throw new IllegalArgumentException("L'heure de début doit être avant l'heure de fin");
        }

        if (creneau.getDureeConsultationMinutes() <= 0) {
            throw new IllegalArgumentException("La durée de consultation doit être positive");
        }

        repo.save(creneau);
    }

    public void deleteCreneau(Long id) {
        repo.delete(id);
    }

    public void saveCreneauxSemaine(Long specialisteId, List<CreneauJournalier> creneaux) {
        // Supprimer les anciens créneaux
        repo.deleteBySpecialisteId(specialisteId);

        // Sauvegarder les nouveaux créneaux
        User specialiste = userRepo.findById(specialisteId);
        for (CreneauJournalier creneau : creneaux) {
            creneau.setSpecialiste(specialiste);
            repo.save(creneau);
        }
    }

    // Méthode pour générer des créneaux par défaut
    public void initialiserCreneauxDefaut(Long specialisteId) {
        User specialiste = userRepo.findById(specialisteId);

        if (specialiste == null) {
            throw new IllegalArgumentException("Spécialiste non trouvé");
        }

        // Créneaux par défaut pour la semaine (exemple)
        JourSemaine[] joursOuvres = {JourSemaine.LUNDI, JourSemaine.MARDI, JourSemaine.MERCREDI,
                JourSemaine.JEUDI, JourSemaine.VENDREDI};

        for (JourSemaine jour : joursOuvres) {
            CreneauJournalier creneau = new CreneauJournalier();
            creneau.setSpecialiste(specialiste);
            creneau.setJourSemaine(jour);
            creneau.setHeureDebut(LocalTime.of(8, 0));
            creneau.setHeureFin(LocalTime.of(17, 0));
            creneau.setDureeConsultationMinutes(30);
            creneau.setActif(true);

            repo.save(creneau);
        }
    }
}