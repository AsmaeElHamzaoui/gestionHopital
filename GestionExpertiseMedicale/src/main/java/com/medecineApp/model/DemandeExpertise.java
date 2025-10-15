package com.medecineApp.model;

import com.medecineApp.enums.Specialiste;
import com.medecineApp.enums.StatutExpertise;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "demandes_expertise")
public class DemandeExpertise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_demande", nullable = false)
    private LocalDate dateDemande;

    @Column(name = "question", nullable = false)
    private String question;

    @Column(name = "priorite", nullable = false)
    private Integer priorite;

    @Enumerated(EnumType.STRING)
    @Column(name = "statut", nullable = false)
    private StatutExpertise statut;

    @Column(name = "reponse")
    private String reponse;

    @ManyToOne
    @JoinColumn(name = "id_consultation", nullable = false)
    private Consultation consultation;

    @ManyToOne
    @JoinColumn(name = "id_specialiste")
    private User specialiste;

    @Enumerated(EnumType.STRING)
    @Column(name = "specialite", nullable = false)
    private Specialiste specialite;

    @Column(name = "tarif")
    private Double tarif;

    // Constructeur par défaut
    public DemandeExpertise() {
    }

    // Constructeur avec paramètres
    public DemandeExpertise(LocalDate dateDemande, String question, Integer priorite, StatutExpertise statut,
                            Consultation consultation, Specialiste specialite) {
        this.dateDemande = dateDemande;
        this.question = question;
        this.priorite = priorite;
        this.statut = statut;
        this.consultation = consultation;
        this.specialite = specialite;
        this.reponse = null; // Initialisé à null
        this.tarif = null;   // Initialisé à null
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(LocalDate dateDemande) {
        this.dateDemande = dateDemande;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Integer getPriorite() {
        return priorite;
    }

    public void setPriorite(Integer priorite) {
        this.priorite = priorite;
    }

    public StatutExpertise getStatut() {
        return statut;
    }

    public void setStatut(StatutExpertise statut) {
        this.statut = statut;
    }

    public String getReponse() {
        return reponse;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    public User getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(User specialiste) {
        this.specialiste = specialiste;
    }

    public Specialiste getSpecialite() {
        return specialite;
    }

    public void setSpecialite(Specialiste specialite) {
        this.specialite = specialite;
    }

    public Double getTarif() {
        return tarif;
    }

    public void setTarif(Double tarif) {
        this.tarif = tarif;
    }

    @Override
    public String toString() {
        return "DemandeExpertise{" +
                "id=" + id +
                ", dateDemande=" + dateDemande +
                ", question='" + question + '\'' +
                ", priorite=" + priorite +
                ", statut=" + statut +
                ", reponse='" + reponse + '\'' +
                ", consultation=" + (consultation != null ? consultation.getId() : null) +
                ", specialiste=" + (specialiste != null ? specialiste.getId() : null) +
                ", specialite=" + specialite +
                ", tarif=" + tarif +
                '}';
    }
}