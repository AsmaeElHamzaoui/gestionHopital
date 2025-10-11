<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Consultations du patient</title></head>
<body>
<h2>Consultations du patient : ${patient.nom} ${patient.prenom}</h2>
<a href="consultations?action=new&patientId=${patient.id}">+ Ajouter une consultation</a>
<a href="patients">Retour à la liste des patients</a>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Date de consultation</th>
        <th>Motif</th>
        <th>Observations</th>
        <th>Diagnostic</th>
        <th>Statut</th>
        <th>Coût fixe</th>
        <th>Action</th>
    </tr>
    <c:forEach var="c" items="${consultations}">
        <tr>
            <td>${c.id}</td>
            <td>${c.dateConsultation}</td>
            <td>${c.motif}</td>
            <td>${c.observations}</td>
            <td>${c.diagnostic}</td>
            <td>${c.statut}</td>
            <td>${c.coutFixe}</td>
            <td>
                <a href="consultations?action=edit&id=${c.id}&patientId=${patient.id}">Modifier</a>
                <a href="consultations?action=delete&id=${c.id}&patientId=${patient.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>