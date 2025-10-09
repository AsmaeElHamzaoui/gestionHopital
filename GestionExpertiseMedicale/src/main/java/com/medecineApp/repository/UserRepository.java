package com.medecineApp.repository;

import com.medecineApp.model.User;
import com.medecineApp.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class UserRepository {

    public List<User> findAll(){
        EntityManager em= JpaUtil.getEntityManager();
        List<User> list=em.createQuery("Select u FROM User u", User.class).getResultList();
        em.close();
        return list;
    }

    public void save(User u){
        EntityManager em= JpaUtil.getEntityManager();
        em.getTransaction().begin();
        if(u.getId() == null)
            em.persist(u);
        else em.merge(u);

        em.getTransaction().commit();
        em.close();
    }

    public User findById(Long id){
        EntityManager em= JpaUtil.getEntityManager();
        User u=em.find(User.class,id);
        em.close();
        return u;
    }

    public void delete(Long id){
        EntityManager em= JpaUtil.getEntityManager();
        em.getTransaction().begin();
        User u=em.find(User.class,id);
        if(u!=null) em.remove(u);
        em.getTransaction().commit();
        em.close();
    }

    //tester aussi en plus de l'équivalence des émails l'équivalence des mot de passe
    // voir le résultat dans la base de donnée)
    public User findByEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

}
