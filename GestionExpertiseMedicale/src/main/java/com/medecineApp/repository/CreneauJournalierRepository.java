package com.medecineApp.repository;

import com.medecineApp.model.Consultation;
import com.medecineApp.model.CreneauJournalier;
import com.medecineApp.enums.JourSemaine;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class CreneauJournalierRepository {

    public List<CreneauJournalier> findBySpecialisteId(Long specialisteId) {
        EntityManager em = JpaUtil.getEntityManager();
        List<CreneauJournalier> list = em.createQuery(
                        "SELECT c FROM CreneauJournalier c WHERE c.specialiste.id = :specialisteId ORDER BY c.jourSemaine, c.heureDebut",
                        CreneauJournalier.class)
                .setParameter("specialisteId", specialisteId)
                .getResultList();
        em.close();
        return list;
    }

    public List<CreneauJournalier> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        List<CreneauJournalier> list = em.createQuery("SELECT c FROM CreneauJournalier c", CreneauJournalier.class).getResultList();
        em.close();
        return list;
    }

    public List<CreneauJournalier> findBySpecialisteIdAndJour(Long specialisteId, JourSemaine jourSemaine) {
        EntityManager em = JpaUtil.getEntityManager();
        List<CreneauJournalier> list = em.createQuery(
                        "SELECT c FROM CreneauJournalier c WHERE c.specialiste.id = :specialisteId AND c.jourSemaine = :jourSemaine AND c.actif = true ORDER BY c.heureDebut",
                        CreneauJournalier.class)
                .setParameter("specialisteId", specialisteId)
                .setParameter("jourSemaine", jourSemaine)
                .getResultList();
        em.close();
        return list;
    }

    public CreneauJournalier findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        CreneauJournalier creneau = em.find(CreneauJournalier.class, id);
        em.close();
        return creneau;
    }

    public void save(CreneauJournalier creneau) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if (creneau.getId() == null)
            em.persist(creneau);
        else
            em.merge(creneau);
        em.getTransaction().commit();
        em.close();
    }

    public void delete(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        CreneauJournalier creneau = em.find(CreneauJournalier.class, id);
        if (creneau != null)
            em.remove(creneau);
        em.getTransaction().commit();
        em.close();
    }

    public void deleteBySpecialisteId(Long specialisteId) {
        EntityManager em = JpaUtil.getEntityManager();
        em.getTransaction().begin();
        em.createQuery("DELETE FROM CreneauJournalier c WHERE c.specialiste.id = :specialisteId")
                .setParameter("specialisteId", specialisteId)
                .executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}