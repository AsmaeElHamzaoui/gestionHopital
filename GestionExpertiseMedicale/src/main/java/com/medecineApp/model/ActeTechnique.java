package com.medecineApp.model;

import com.medecineApp.enums.TypeActeTechnique;
import jakarta.persistence.*;

@Entity
@Table(name = "actes_techniques")
public class ActeTechnique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private TypeActeTechnique type;

    @Column(name = "cout")
    private Double cout;

    @ManyToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    // Constructeur par défaut
    public ActeTechnique() {
    }

    // Constructeur avec paramètres
    public ActeTechnique(TypeActeTechnique type, Double cout, Consultation consultation) {
        this.type = type;
        this.cout = cout;
        this.consultation = consultation;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public TypeActeTechnique getType() {
        return type;
    }

    public void setType(TypeActeTechnique type) {
        this.type = type;
    }

    public Double getCout() {
        return cout;
    }

    public void setCout(Double cout) {
        this.cout = cout;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    @Override
    public String toString() {
        return "ActeTechnique{" +
                "id=" + id +
                ", type=" + type +
                ", cout=" + cout +
                ", consultation=" + (consultation != null ? consultation.getId() : null) +
                '}';
    }
}
