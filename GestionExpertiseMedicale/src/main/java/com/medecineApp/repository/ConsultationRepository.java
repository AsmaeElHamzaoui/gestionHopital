package com.medecineApp.repository;

import com.medecineApp.model.Consultation;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class ConsultationRepository {

    public List<Consultation> findAllByPatientId(Long patientId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<Consultation> list = em.createQuery("SELECT c FROM Consultation c WHERE c.patient.id = :patientId", Consultation.class)
                .setParameter("patientId", patientId)
                .getResultList();
        em.close();
        return list;
    }
    public List<Consultation> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<Consultation> list = em.createQuery("SELECT c FROM Consultation c", Consultation.class).getResultList();
        em.close();
        return list;
    }

    public void save(Consultation c) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (c.getId() == null)
            em.persist(c);
        else
            em.merge(c);
        em.getTransaction().commit();
        em.close();
    }

    public Consultation findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        Consultation c = em.find(Consultation.class, id);
        em.close();
        return c;
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        Consultation c = em.find(Consultation.class, id);
        if (c != null)
            em.remove(c);
        em.getTransaction().commit();
        em.close();
    }
}