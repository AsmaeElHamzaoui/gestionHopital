package com.medecineApp.service;

import com.medecineApp.model.ActeTechnique;
import com.medecineApp.repository.ActeTechniqueRepository;

import java.util.List;

public class ActeTechniqueService {

    private ActeTechniqueRepository repository = new ActeTechniqueRepository();

    public List<ActeTechnique> getAllActes() {
        return repository.findAll();
    }

    public ActeTechnique getActeById(Long id) {
        return repository.findById(id);
    }

    public void saveOrUpdateActe(ActeTechnique acte) {
        repository.save(acte);
    }

    public void deleteActe(Long id) {
        repository.delete(id);
    }

    public List<ActeTechnique> getActesByConsultationId(Long consultationId) {
        return repository.findAllByConsultationId(consultationId);
    }
}
