package com.medecineApp.repository;

import com.medecineApp.model.Patient;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class PatientRepository {

    public List<Patient> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<Patient> list = em.createQuery("SELECT p FROM Patient p", Patient.class).getResultList();
        em.close();
        return list;
    }

    public void save(Patient p) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (p.getId() == null)
            em.persist(p);
        else
            em.merge(p);
        em.getTransaction().commit();
        em.close();
    }

    public Patient findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        Patient p = em.find(Patient.class, id);
        em.close();
        return p;
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        Patient p = em.find(Patient.class, id);
        if (p != null)
            em.remove(p);
        em.getTransaction().commit();
        em.close();
    }
}