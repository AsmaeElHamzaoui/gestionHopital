<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Mes Créneaux</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .actif-true { color: green; }
        .actif-false { color: red; }
    </style>
</head>
<body>
    <h2>Mes Créneaux de Consultation</h2>

    <div style="margin: 20px 0;">
        <a href="creneaux?action=new">+ Ajouter un créneau</a>
        <a href="creneaux?action=semaine" style="margin-left: 20px;">📅 Planifier la semaine</a>
    </div>

    <table>
        <tr>
            <th>Jour</th>
            <th>Heure début</th>
            <th>Heure fin</th>
            <th>Durée consultation</th>
            <th>Nombre de créneaux</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="creneau" items="${creneaux}">
            <tr>
                <td>${creneau.jourSemaine}</td>
                <td>${creneau.heureDebut}</td>
                <td>${creneau.heureFin}</td>
                <td>${creneau.dureeConsultationMinutes} min</td>
                <td>${creneau.nombreCreneaux}</td>
                <td class="actif-${creneau.actif}">
                    ${creneau.actif ? 'Actif' : 'Inactif'}
                </td>
                <td>
                    <a href="creneaux?action=edit&id=${creneau.id}">Modifier</a>
                    <a href="creneaux?action=delete&id=${creneau.id}"
                       onclick="return confirm('Supprimer ce créneau?')">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <c:if test="${empty creneaux}">
        <p style="margin: 20px 0; color: #666;">
            Aucun créneau défini.
            <a href="creneaux?action=semaine">Planifiez votre semaine</a> pour commencer.
        </p>
    </c:if>
</body>
</html>