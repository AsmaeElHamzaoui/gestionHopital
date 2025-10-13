package com.medecineApp.model;

import com.medecineApp.enums.JourSemaine;
import jakarta.persistence.*;

import java.time.LocalTime;

@Entity
@Table(name = "creneaux_journaliers")
public class CreneauJournalier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "specialiste_id", nullable = false)
    private User specialiste;

    @Enumerated(EnumType.STRING)
    @Column(name = "jour_semaine", nullable = false)
    private JourSemaine jourSemaine;

    @Column(name = "heure_debut", nullable = false)
    private LocalTime heureDebut;

    @Column(name = "heure_fin", nullable = false)
    private LocalTime heureFin;

    @Column(name = "duree_consultation_minutes", nullable = false)
    private Integer dureeConsultationMinutes; // Durée d'un créneau en minutes

    @Column(name = "actif", nullable = false)
    private Boolean actif = true;

    // Constructeurs
    public CreneauJournalier() {
    }

    public CreneauJournalier(User specialiste, JourSemaine jourSemaine, LocalTime heureDebut,
                             LocalTime heureFin, Integer dureeConsultationMinutes) {
        this.specialiste = specialiste;
        this.jourSemaine = jourSemaine;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
        this.dureeConsultationMinutes = dureeConsultationMinutes;
        this.actif = true;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(User specialiste) {
        this.specialiste = specialiste;
    }

    public JourSemaine getJourSemaine() {
        return jourSemaine;
    }

    public void setJourSemaine(JourSemaine jourSemaine) {
        this.jourSemaine = jourSemaine;
    }

    public LocalTime getHeureDebut() {
        return heureDebut;
    }

    public void setHeureDebut(LocalTime heureDebut) {
        this.heureDebut = heureDebut;
    }

    public LocalTime getHeureFin() {
        return heureFin;
    }

    public void setHeureFin(LocalTime heureFin) {
        this.heureFin = heureFin;
    }

    public Integer getDureeConsultationMinutes() {
        return dureeConsultationMinutes;
    }

    public void setDureeConsultationMinutes(Integer dureeConsultationMinutes) {
        this.dureeConsultationMinutes = dureeConsultationMinutes;
    }

    public Boolean getActif() {
        return actif;
    }

    public void setActif(Boolean actif) {
        this.actif = actif;
    }

    // Méthode utilitaire pour calculer le nombre de créneaux
    public int getNombreCreneaux() {
        long totalMinutes = java.time.Duration.between(heureDebut, heureFin).toMinutes();
        return (int) (totalMinutes / dureeConsultationMinutes);
    }

    @Override
    public String toString() {
        return "CreneauJournalier{" +
                "id=" + id +
                ", specialiste=" + (specialiste != null ? specialiste.getId() : null) +
                ", jourSemaine=" + jourSemaine +
                ", heureDebut=" + heureDebut +
                ", heureFin=" + heureFin +
                ", dureeConsultationMinutes=" + dureeConsultationMinutes +
                ", actif=" + actif +
                '}';
    }
}