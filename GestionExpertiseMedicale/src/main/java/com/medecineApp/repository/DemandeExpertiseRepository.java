package com.medecineApp.repository;

import com.medecineApp.model.DemandeExpertise;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class DemandeExpertiseRepository {

    public List<DemandeExpertise> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<DemandeExpertise> list = em.createQuery("SELECT d FROM DemandeExpertise d", DemandeExpertise.class)
                .getResultList();
        em.close();
        return list;
    }

    public List<DemandeExpertise> findAllByConsultationId(Long consultationId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<DemandeExpertise> list = em.createQuery("SELECT d FROM DemandeExpertise d WHERE d.consultation.id = :consultationId", DemandeExpertise.class)
                .setParameter("consultationId", consultationId)
                .getResultList();
        em.close();
        return list;
    }

    public List<DemandeExpertise> findAllBySpecialisteId(Long specialisteId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<DemandeExpertise> list = em.createQuery("SELECT d FROM DemandeExpertise d WHERE d.specialiste.id = :specialisteId", DemandeExpertise.class)
                .setParameter("specialisteId", specialisteId)
                .getResultList();
        em.close();
        return list;
    }

    public void save(DemandeExpertise demande) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (demande.getId() == null)
            em.persist(demande);
        else
            em.merge(demande);
        em.getTransaction().commit();
        em.close();
    }

    public DemandeExpertise findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        DemandeExpertise demande = em.find(DemandeExpertise.class, id);
        em.close();
        return demande;
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        DemandeExpertise demande = em.find(DemandeExpertise.class, id);
        if (demande != null)
            em.remove(demande);
        em.getTransaction().commit();
        em.close();
    }
}