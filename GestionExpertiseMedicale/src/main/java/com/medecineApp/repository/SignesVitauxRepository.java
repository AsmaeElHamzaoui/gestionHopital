package com.medecineApp.repository;

import com.medecineApp.model.SignesVitaux;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class SignesVitauxRepository {

    public List<SignesVitaux> findAllByPatientId(Long patientId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<SignesVitaux> list = em.createQuery("SELECT s FROM SignesVitaux s WHERE s.patient.id = :patientId", SignesVitaux.class)
                .setParameter("patientId", patientId)
                .getResultList();
        em.close();
        return list;
    }

    public void save(SignesVitaux s) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (s.getId() == null)
            em.persist(s);
        else
            em.merge(s);
        em.getTransaction().commit();
        em.close();
    }

    public SignesVitaux findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        SignesVitaux s = em.find(SignesVitaux.class, id);
        em.close();
        return s;
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        SignesVitaux s = em.find(SignesVitaux.class, id);
        if (s != null)
            em.remove(s);
        em.getTransaction().commit();
        em.close();
    }
}