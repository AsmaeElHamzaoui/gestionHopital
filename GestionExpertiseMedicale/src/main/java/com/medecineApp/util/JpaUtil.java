package com.medecineApp.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
    private static final EntityManagerFactory
            // EntityManagerFactory celui qui gère la connexion avec la base de données
            // GestionHopitalPU : c'est le nom de <persistence-unit name="GestionHopitalPU" ...>

            emf= Persistence.createEntityManagerFactory("GestionHopitalPU");

    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
}
