//package com.medecineApp.service;
//
//import com.medecineApp.model.Patient;
//import com.medecineApp.repository.PatientRepository;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//
//import java.util.Arrays;
//import java.util.List;
//
//import static org.junit.jupiter.api.Assertions.*;
//import static org.mockito.Mockito.*;
//
//class PatientServiceTest {
//
//    @Mock
//    private PatientRepository patientRepository;
//
//    @InjectMocks
//    private PatientService patientService;
//
//    @BeforeEach
//    void setUp() {
//        MockitoAnnotations.openMocks(this);
//    }
//
//    @Test
//    void testGetAllPatients() {
//        // Préparer les données
//        Patient p1 = new Patient();
//        p1.setId(1L);
//        p1.setNom("Dupont");
//
//        Patient p2 = new Patient();
//        p2.setId(2L);
//        p2.setNom("Martin");
//
//        List<Patient> patients = Arrays.asList(p1, p2);
//
//        // Définir le comportement du mock
//        when(patientRepository.findAll()).thenReturn(patients);
//
//        // Appel de la méthode
//        List<Patient> result = patientService.getAllPatients();
//
//        // Vérifications
//        assertEquals(2, result.size());
//        assertEquals("Dupont", result.get(0).getNom());
//        verify(patientRepository, times(1)).findAll();
//    }
//
//    @Test
//    void testSavePatient() {
//        Patient p = new Patient();
//        p.setNom("Durand");
//
//        // Appel de la méthode
//        patientService.savePatient(p);
//
//        // Vérification que save a été appelé
//        verify(patientRepository, times(1)).save(p);
//    }
//
//    @Test
//    void testGetPatient() {
//        Patient p = new Patient();
//        p.setId(1L);
//        p.setNom("Leroy");
//
//        when(patientRepository.findById(1L)).thenReturn(p);
//
//        Patient result = patientService.getPatient(1L);
//
//        assertNotNull(result);
//        assertEquals("Leroy", result.getNom());
//        verify(patientRepository, times(1)).findById(1L);
//    }
//
//    @Test
//    void testDeletePatient() {
//        Long patientId = 1L;
//
//        // Appel de la méthode
//        patientService.deletePatient(patientId);
//
//        // Vérification que delete a été appelé
//        verify(patientRepository, times(1)).delete(patientId);
//    }
//}
