package com.medecineApp.service;

import com.medecineApp.enums.Specialiste;
import com.medecineApp.enums.StatutExpertise;
import com.medecineApp.model.Consultation;
import com.medecineApp.model.DemandeExpertise;
import com.medecineApp.model.User;
import com.medecineApp.repository.ConsultationRepository;
import com.medecineApp.repository.DemandeExpertiseRepository;
import com.medecineApp.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class DemandeExpertiseServiceTest {

    @Mock
    private DemandeExpertiseRepository demandeRepo;

    @Mock
    private ConsultationRepository consultationRepo;

    @Mock
    private UserRepository userRepo;

    @InjectMocks
    private DemandeExpertiseService service;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testGetAllDemandes() {
        DemandeExpertise d1 = new DemandeExpertise();
        DemandeExpertise d2 = new DemandeExpertise();
        when(demandeRepo.findAll()).thenReturn(Arrays.asList(d1, d2));

        List<DemandeExpertise> result = service.getAllDemandes();
        assertEquals(2, result.size());
        verify(demandeRepo, times(1)).findAll();
    }

    @Test
    void testGetDemandesByConsultationId() {
        DemandeExpertise d1 = new DemandeExpertise();
        when(demandeRepo.findAllByConsultationId(1L)).thenReturn(List.of(d1));

        List<DemandeExpertise> result = service.getDemandesByConsultationId(1L);
        assertEquals(1, result.size());
        verify(demandeRepo).findAllByConsultationId(1L);
    }

    @Test
    void testGetNowDemandesBySpecialisteId() {
        DemandeExpertise d1 = new DemandeExpertise();
        d1.setDateDemande(LocalDateTime.now());
        DemandeExpertise d2 = new DemandeExpertise();
        d2.setDateDemande(LocalDateTime.now().minusDays(1));
        when(demandeRepo.findAllBySpecialisteId(1L)).thenReturn(Arrays.asList(d1, d2));

        List<DemandeExpertise> result = service.getNowDemandesBySpecialisteId(1L);
        assertEquals(1, result.size());
        verify(demandeRepo).findAllBySpecialisteId(1L);
    }

    @Test
    void testTotalDemandeSpecialiste() {
        DemandeExpertise d1 = new DemandeExpertise();
        DemandeExpertise d2 = new DemandeExpertise();
        when(demandeRepo.findAllBySpecialisteId(1L)).thenReturn(Arrays.asList(d1, d2));

        Long total = service.totalDemandeSpecialiste(1L);
        assertEquals(2L, total);
        verify(demandeRepo).findAllBySpecialisteId(1L);
    }

    @Test
    void testRevenuSpecialiste() {
        DemandeExpertise d1 = new DemandeExpertise();
        d1.setStatut(StatutExpertise.TERMINEE);
        d1.setTarif(100.0);
        DemandeExpertise d2 = new DemandeExpertise();
        d2.setStatut(StatutExpertise.EN_ATTENTE);
        d2.setTarif(50.0);
        when(demandeRepo.findAllBySpecialisteId(1L)).thenReturn(Arrays.asList(d1, d2));

        Double revenu = service.revenuSpecialiste(1L);
        assertEquals(100.0, revenu);
        verify(demandeRepo).findAllBySpecialisteId(1L);
    }

    @Test
    void testSaveDemande_ConsultationNotFound() {
        DemandeExpertise d = new DemandeExpertise();
        Consultation c = new Consultation();
        c.setId(1L);
        d.setConsultation(c);

        when(consultationRepo.findById(1L)).thenReturn(null);

        Exception exception = assertThrows(IllegalArgumentException.class,
                () -> service.saveDemande(d));
        assertTrue(exception.getMessage().contains("Consultation non trouvée"));
    }

    @Test
    void testSaveDemande_SpecialisteNotFound() {
        DemandeExpertise d = new DemandeExpertise();
        Consultation c = new Consultation();
        c.setId(1L);
        d.setConsultation(c);
        User u = new User();
        u.setId(1L);
        d.setSpecialiste(u);
        d.setSpecialite(Specialiste.DERMATOLOGIE);

        when(consultationRepo.findById(1L)).thenReturn(c);
        when(userRepo.findById(1L)).thenReturn(null);

        Exception exception = assertThrows(IllegalArgumentException.class,
                () -> service.saveDemande(d));
        assertTrue(exception.getMessage().contains("Spécialiste non trouvé"));
    }

    @Test
    void testSaveDemande_Success() {
        DemandeExpertise d = new DemandeExpertise();
        Consultation c = new Consultation();
        c.setId(1L);
        d.setConsultation(c);
        d.setId(null);

        when(consultationRepo.findById(1L)).thenReturn(c);

        service.saveDemande(d);
        verify(demandeRepo).save(d);
        assertNull(d.getReponse());
        assertNull(d.getTarif());
    }

    @Test
    void testUpdateReponseAndTarif_Success() {
        DemandeExpertise d = new DemandeExpertise();
        d.setId(1L);
        User u = new User();
        u.setId(1L);
        d.setSpecialiste(u);

        when(demandeRepo.findById(1L)).thenReturn(d);

        service.updateReponseAndTarif(1L, "Réponse OK", 120.0, 1L);

        assertEquals("Réponse OK", d.getReponse());
        assertEquals(120.0, d.getTarif());
        assertEquals(StatutExpertise.TERMINEE, d.getStatut());
        verify(demandeRepo).save(d);
    }

    @Test
    void testGetDemande() {
        DemandeExpertise d = new DemandeExpertise();
        when(demandeRepo.findById(1L)).thenReturn(d);

        DemandeExpertise result = service.getDemande(1L);
        assertNotNull(result);
        verify(demandeRepo).findById(1L);
    }

    @Test
    void testDeleteDemande() {
        service.deleteDemande(1L);
        verify(demandeRepo).delete(1L);
    }
}
