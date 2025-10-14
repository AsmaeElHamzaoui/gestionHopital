<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Généraliste</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .modal-content {
            border-radius: 10px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Dashboard Généraliste</h1>

    <!-- Button to trigger the modal -->
    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDemandeModal">
        Nouvelle Demande d'Expertise
    </button>

    <!-- Patients Table -->
    <h2>Liste des Patients</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="patient" items="${patients}">
            <tr>
                <td>${patient.id}</td>
                <td>${patient.nom}</td>
                <td>${patient.prenom}</td>
                <td>${patient.email}</td>
                <td>
                    <a href="patients?action=edit&id=${patient.id}" class="btn btn-sm btn-warning">Modifier</a>
                    <a href="patients?action=delete&id=${patient.id}" class="btn btn-sm btn-danger"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce patient ?');">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Modal for Adding Expertise Request -->
    <div class="modal fade" id="addDemandeModal" tabindex="-1" aria-labelledby="addDemandeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDemandeModalLabel">Nouvelle Demande d'Expertise</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="demandes-expertise" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="create">
                        <div class="mb-3">
                            <label for="specialisteId" class="form-label">Spécialiste</label>
                            <select class="form-select" id="specialisteId" name="specialisteId" required
                                    onchange="loadTimeSlots()">
                                <option value="">Sélectionner un spécialiste</option>
                                <c:forEach var="specialiste" items="${specialistes}">
                                    <option value="${specialiste.id}">${specialiste.nom} ${specialiste.prenom}
                                        (${specialiste.specialite})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="consultationId" class="form-label">Consultation</label>
                            <select class="form-select" id="consultationId" name="consultationId" required>
                                <option value="">Sélectionner une consultation</option>
                                <c:forEach var="consultation" items="${consultations}">
                                    <option value="${consultation.id}">Consultation #${consultation.id}
                                        - ${consultation.date}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="question" class="form-label">Question</label>
                            <textarea class="form-control" id="question" name="question" rows="4"
                                      required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="priorite" class="form-label">Priorité</label>
                            <select class="form-select" id="priorite" name="priorite" required>
                                <option value="BASSE">Basse</option>
                                <option value="MOYENNE">Moyenne</option>
                                <option value="HAUTE">Haute</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="dateDemande" class="form-label">Date de la demande</label>
                            <input type="datetime-local" class="form-control" id="dateDemande" name="dateDemande"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label for="timeSlot" class="form-label">Créneau horaire</label>
                            <select class="form-select" id="timeSlot" name="timeSlot">
                                <option value="">Sélectionner un créneau</option>
                                <!-- Populated dynamically via JavaScript -->
                            </select>
                        </div>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function loadTimeSlots() {
        const specialisteId = document.getElementById('specialisteId').value;
        const timeSlotSelect = document.getElementById('timeSlot');
        timeSlotSelect.innerHTML = '<option value="">Sélectionner un créneau</option>';

        if (specialisteId) {
            fetch(`/demandes-expertise?action=getTimeSlots&specialisteId=${specialisteId}`)
                .then(response => response.json())
                .then(data => {
                    data.forEach(slot => {
                        const option = document.createElement('option');
                        option.value = slot;
                        option.text = new Date(slot).toLocaleString();
                        timeSlotSelect.appendChild(option);
                    });
                })
                .catch(error => console.error('Erreur lors du chargement des créneaux:', error));
        }
    }

    // Set default date to now
    document.getElementById('dateDemande').value = new Date().toISOString().slice(0, 16);
</script>