package com.medecineApp.repository;

import com.medecineApp.model.ActeTechnique;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class ActeTechniqueRepository {

    public List<ActeTechnique> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<ActeTechnique> list = em.createQuery("SELECT a FROM ActeTechnique a", ActeTechnique.class).getResultList();
        em.close();
        return list;
    }

    public ActeTechnique findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        ActeTechnique acte = em.find(ActeTechnique.class, id);
        em.close();
        return acte;
    }

    public void save(ActeTechnique acte) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (acte.getId() == null)
            em.persist(acte);
        else
            em.merge(acte);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        ActeTechnique acte = em.find(ActeTechnique.class, id);
        if (acte != null)
            em.remove(acte);
        em.getTransaction().commit();
        em.close();
    }

    public List<ActeTechnique> findAllByConsultationId(Long consultationId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<ActeTechnique> list = em.createQuery(
                        "SELECT a FROM ActeTechnique a WHERE a.consultation.id = :consultationId", ActeTechnique.class)
                .setParameter("consultationId", consultationId)
                .getResultList();
        em.close();
        return list;
    }
}
