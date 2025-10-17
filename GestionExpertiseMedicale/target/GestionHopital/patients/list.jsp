<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Liste des patients</title></head>
<body>
<h2>Liste des patients</h2>
<a href="patients?action=new">+ Ajouter un patient</a>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Date de naissance</th>
        <th>Numéro de sécurité sociale</th>
        <th>Téléphone</th>
        <th>Adresse</th>
        <th>Date d'enregistrement</th>
        <th>Statut</th>
        <th>Action</th>
    </tr>
    <c:forEach var="p" items="${patients}">
        <tr>
            <td>${p.id}</td>
            <td>${p.nom}</td>
            <td>${p.prenom}</td>
            <td>${p.dateNaissance}</td>
            <td>${p.numSecu}</td>
            <td>${p.telephone}</td>
            <td>${p.adresse}</td>
            <td>${p.dateEnregistrement}</td>
            <td>${p.statut}</td>
            <td>
                <a href="patients?action=edit&id=${p.id}">Modifier</a>
                <a href="patients?action=delete&id=${p.id}">Supprimer</a>
                <a href="signes-vitaux?patientId=${p.id}">Voir signes vitaux</a>
                <a href="consultations?patientId=${p.id}">Voir consultations</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>