package com.medecineApp.test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaInit {
    public static void main(String[] args) {
        System.out.println("Initialisation de JPA...");

        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionHopitalPU");
            EntityManager em = emf.createEntityManager();

            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();
            emf.close();

            System.out.println("Tables créées avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
