package com.medecineApp.repository;

import com.medecineApp.model.Creneau;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class CreneauRepository {

    public List<Creneau> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<Creneau> list = em.createQuery("SELECT c FROM Creneau c", Creneau.class).getResultList();
        em.close();
        return list;
    }

    public void save(Creneau creneau) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (creneau.getId() == null) {
            em.persist(creneau);
        } else {
            em.merge(creneau);
        }
        em.getTransaction().commit();
        em.close();
    }

    public Creneau findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        Creneau c = em.find(Creneau.class, id);
        em.close();
        return c;
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        Creneau c = em.find(Creneau.class, id);
        if (c != null) em.remove(c);
        em.getTransaction().commit();
        em.close();
    }

    public List<Creneau> findBySpecialiste(Long idSpecialiste) {
        EntityManager em = JpaUtil.getEntityManager();
        List<Creneau> list = em.createQuery("SELECT c FROM Creneau c WHERE c.idSpecialiste = :idSpecialiste", Creneau.class)
                .setParameter("idSpecialiste", idSpecialiste)
                .getResultList();
        em.close();
        return list;
    }
}
