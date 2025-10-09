package com.medecineApp.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "signes_vitaux")
public class SignesVitaux {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tension")
    private String tension;

    @Column(name = "frequence_cardiaque")
    private Integer frequenceCardiaque;

    @Column(name = "temperature")
    private Double temperature;

    @Column(name = "frequence_respiratoire")
    private Integer frequenceRespiratoire;

    @Column(name = "poids")
    private Double poids;

    @Column(name = "taille")
    private Double taille;

    @Column(name = "date_mesure")
    private LocalDate dateMesure;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    // Constructeur par défaut
    public SignesVitaux() {
    }

    // Constructeur avec paramètres
    public SignesVitaux(String tension, Integer frequenceCardiaque, Double temperature,
                        Integer frequenceRespiratoire, Double poids, Double taille,
                        LocalDate dateMesure, Patient patient) {
        this.tension = tension;
        this.frequenceCardiaque = frequenceCardiaque;
        this.temperature = temperature;
        this.frequenceRespiratoire = frequenceRespiratoire;
        this.poids = poids;
        this.taille = taille;
        this.dateMesure = dateMesure;
        this.patient = patient;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTension() {
        return tension;
    }

    public void setTension(String tension) {
        this.tension = tension;
    }

    public Integer getFrequenceCardiaque() {
        return frequenceCardiaque;
    }

    public void setFrequenceCardiaque(Integer frequenceCardiaque) {
        this.frequenceCardiaque = frequenceCardiaque;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public Integer getFrequenceRespiratoire() {
        return frequenceRespiratoire;
    }

    public void setFrequenceRespiratoire(Integer frequenceRespiratoire) {
        this.frequenceRespiratoire = frequenceRespiratoire;
    }

    public Double getPoids() {
        return poids;
    }

    public void setPoids(Double poids) {
        this.poids = poids;
    }

    public Double getTaille() {
        return taille;
    }

    public void setTaille(Double taille) {
        this.taille = taille;
    }

    public LocalDate getDateMesure() {
        return dateMesure;
    }

    public void setDateMesure(LocalDate dateMesure) {
        this.dateMesure = dateMesure;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    // toString pour le débogage
    @Override
    public String toString() {
        return "SignesVitaux{" +
                "id=" + id +
                ", tension='" + tension + '\'' +
                ", frequenceCardiaque=" + frequenceCardiaque +
                ", temperature=" + temperature +
                ", frequenceRespiratoire=" + frequenceRespiratoire +
                ", poids=" + poids +
                ", taille=" + taille +
                ", dateMesure=" + dateMesure +
                ", patient=" + (patient != null ? patient.getId() : null) +
                '}';
    }
}