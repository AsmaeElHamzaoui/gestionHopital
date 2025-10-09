package com.medecineApp.model;
import com.medecineApp.enums.StatutConsultation;
import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "consultations")
public class Consultation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_consultation")
    private LocalDate dateConsultation;

    @Column(name = "motif")
    private String motif;

    @Column(name = "observations")
    private String observations;

    @Column(name = "diagnostic")
    private String diagnostic;

    @Enumerated(EnumType.STRING)
    @Column(name = "statut")
    private StatutConsultation statut;

    @Column(name = "cout_fixe")
    private Double coutFixe;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    // Constructeur par défaut
    public Consultation() {
    }

    // Constructeur avec paramètres
    public Consultation(LocalDate dateConsultation, String motif, String observations, String diagnostic,
                        StatutConsultation statut, Double coutFixe, Patient patient) {
        this.dateConsultation = dateConsultation;
        this.motif = motif;
        this.observations = observations;
        this.diagnostic = diagnostic;
        this.statut = statut;
        this.coutFixe = coutFixe;
        this.patient = patient;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDateConsultation() {
        return dateConsultation;
    }

    public void setDateConsultation(LocalDate dateConsultation) {
        this.dateConsultation = dateConsultation;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public StatutConsultation getStatut() {
        return statut;
    }

    public void setStatut(StatutConsultation statut) {
        this.statut = statut;
    }

    public Double getCoutFixe() {
        return coutFixe;
    }

    public void setCoutFixe(Double coutFixe) {
        this.coutFixe = coutFixe;
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
        return "Consultation{" +
                "id=" + id +
                ", dateConsultation=" + dateConsultation +
                ", motif='" + motif + '\'' +
                ", observations='" + observations + '\'' +
                ", diagnostic='" + diagnostic + '\'' +
                ", statut=" + statut +
                ", coutFixe=" + coutFixe +
                ", patient=" + (patient != null ? patient.getId() : null) +
                '}';
    }
}