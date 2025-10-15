package com.medecineApp.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "creneaux")
public class Creneau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "heure_debut", nullable = false)
    private LocalTime heureDebut;

    @Column(name = "heure_fin", nullable = false)
    private LocalTime heureFin;

    @Column(nullable = false)
    private boolean disponible = true;

    @Column(name = "date_jour_actuelle", nullable = false)
    private LocalDate dateJourActuelle;

    @Column(name = "id_specialiste", nullable = false)
    private Long idSpecialiste;

    public Creneau() {
        this.dateJourActuelle = LocalDate.now(); // Toujours la date du jour à la création
    }

    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalTime getHeureDebut() { return heureDebut; }
    public void setHeureDebut(LocalTime heureDebut) { this.heureDebut = heureDebut; }

    public LocalTime getHeureFin() { return heureFin; }
    public void setHeureFin(LocalTime heureFin) { this.heureFin = heureFin; }

    public boolean isDisponible() { return disponible; }
    public void setDisponible(boolean disponible) { this.disponible = disponible; }

    public LocalDate getDateJourActuelle() { return dateJourActuelle; }
    public void setDateJourActuelle(LocalDate dateJourActuelle) { this.dateJourActuelle = dateJourActuelle; }

    public Long getIdSpecialiste() { return idSpecialiste; }
    public void setIdSpecialiste(Long idSpecialiste) { this.idSpecialiste = idSpecialiste; }

    @Override
    public String toString() {
        return "Creneau{" +
                "id=" + id +
                ", heureDebut=" + heureDebut +
                ", heureFin=" + heureFin +
                ", disponible=" + disponible +
                ", dateJourActuelle=" + dateJourActuelle +
                ", idSpecialiste=" + idSpecialiste +
                '}';
    }
}

