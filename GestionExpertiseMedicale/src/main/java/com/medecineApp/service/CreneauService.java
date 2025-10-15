package com.medecineApp.service;

import com.medecineApp.model.Creneau;
import com.medecineApp.repository.CreneauRepository;

import java.util.List;
import java.util.stream.Collectors;

public class CreneauService {

    private final CreneauRepository repo = new CreneauRepository();

    public List<Creneau> getAllCreneaux() {
        return repo.findAll();
    }

    public void saveCreneau(Creneau creneau) {
        // Toujours mettre la date du jour si création
        if (creneau.getId() == null) {
            creneau.setDateJourActuelle(java.time.LocalDate.now());
        }
        repo.save(creneau);
    }

    public Creneau getCreneau(Long id) {
        return repo.findById(id);
    }

    public void deleteCreneau(Long id) {
        repo.delete(id);
    }

    public List<Creneau> getCreneauxBySpecialiste(Long idSpecialiste) {
        return repo.findBySpecialiste(idSpecialiste);
    }

    public List<Creneau> getCrenauxIndisponible(){
        return repo.findAll()
                .stream()
                .filter(Creneau::isDisponible)
                .collect(Collectors.toList());
    }
}
