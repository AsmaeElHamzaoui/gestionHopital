package com.medecineApp.service;

import com.medecineApp.model.User;
import com.medecineApp.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class UserService {
    private final UserRepository repo = new UserRepository();

    // 🔹 Récupérer tous les utilisateurs
    public List<User> getAllUsers() {
        return repo.findAll();
    }

    // 🔹 Sauvegarder un utilisateur (hachage du mot de passe avant persistance)
    public void saveUser(User u) {
        if (u.getPassword() != null && !u.getPassword().isEmpty()) {
            String hashed = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
            u.setPassword(hashed);
        }
        repo.save(u);
    }

    // 🔹 Récupérer un utilisateur par ID
    public User getUser(Long id) {
        return repo.findById(id);
    }

    // 🔹 Supprimer un utilisateur
    public void deleteUser(Long id) {
        repo.delete(id);
    }

    // 🔹 Authentification avec vérification du mot de passe haché
    public User authenticate(String email, String password) {
        User user = repo.findByEmail(email);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user;
        }
        return null;
    }


}
