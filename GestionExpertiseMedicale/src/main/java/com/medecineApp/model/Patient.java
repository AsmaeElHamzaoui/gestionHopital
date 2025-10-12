package com.medecineApp.model;

import com.medecineApp.enums.Priorite;
import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "date_naissance")
    private LocalDate dateNaissance;

    @Column(name = "num_secu")
    private String numSecu;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "date_enregistrement")
    private LocalDate dateEnregistrement;

    @Enumerated(EnumType.STRING)
    @Column(name = "priorite")
    private Priorite priorite;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SignesVitaux> signesVitaux = new ArrayList<>();

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Consultation> consultations = new ArrayList<>();

    // Constructeur par défaut
    public Patient() {
    }

    // Constructeur avec paramètres
    public Patient(String nom, String prenom, LocalDate dateNaissance, String numSecu, String telephone,
                   String adresse, LocalDate dateEnregistrement, Priorite priorite) {
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.numSecu = numSecu;
        this.telephone = telephone;
        this.adresse = adresse;
        this.dateEnregistrement = dateEnregistrement;
        this.priorite = priorite;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(LocalDate dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getNumSecu() {
        return numSecu;
    }

    public void setNumSecu(String numSecu) {
        this.numSecu = numSecu;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public LocalDate getDateEnregistrement() {
        return dateEnregistrement;
    }

    public void setDateEnregistrement(LocalDate dateEnregistrement) {
        this.dateEnregistrement = dateEnregistrement;
    }

    public Priorite getPriorite() {
        return priorite;
    }

    public void setPriorite(Priorite priorite) {
        this.priorite = priorite;
    }

    public List<SignesVitaux> getSignesVitaux() {
        return signesVitaux;
    }

    public void setSignesVitaux(List<SignesVitaux> signesVitaux) {
        this.signesVitaux = signesVitaux;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    // toString pour le débogage
    @Override
    public String toString() {
        return "Patient{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", dateNaissance=" + dateNaissance +
                ", numSecu='" + numSecu + '\'' +
                ", telephone='" + telephone + '\'' +
                ", adresse='" + adresse + '\'' +
                ", dateEnregistrement=" + dateEnregistrement +
                ", priorite=" + priorite +
                ", signesVitaux=" + signesVitaux +
                ", consultations=" + consultations +
                '}';
    }
}