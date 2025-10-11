<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Signes vitaux du patient</title></head>
<body>
<h2>Signes vitaux du patient : ${patient.nom} ${patient.prenom}</h2>
<a href="signes-vitaux?action=new&patientId=${patient.id}">+ Ajouter des signes vitaux</a>
<a href="patients">Retour à la liste des patients</a>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Tension</th>
        <th>Fréquence cardiaque</th>
        <th>Température</th>
        <th>Fréquence respiratoire</th>
        <th>Poids</th>
        <th>Taille</th>
        <th>Date de mesure</th>
        <th>Action</th>
    </tr>
    <c:forEach var="s" items="${signesVitauxList}">
        <tr>
            <td>${s.id}</td>
            <td>${s.tension}</td>
            <td>${s.frequenceCardiaque}</td>
            <td>${s.temperature}</td>
            <td>${s.frequenceRespiratoire}</td>
            <td>${s.poids}</td>
            <td>${s.taille}</td>
            <td>${s.dateMesure}</td>
            <td>
                <a href="signes-vitaux?action=edit&id=${s.id}&patientId=${patient.id}">Modifier</a>
                <a href="signes-vitaux?action=delete&id=${s.id}&patientId=${patient.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>