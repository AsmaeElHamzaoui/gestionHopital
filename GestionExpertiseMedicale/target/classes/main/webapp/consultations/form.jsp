<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Formulaire Consultation</title></head>
<body>
<h2><c:choose>
    <c:when test="${not empty consultation.id}">Modifier</c:when>
    <c:otherwise>Ajouter</c:otherwise>
</c:choose> une consultation</h2>

<form action="consultations" method="post">
    <input type="hidden" name="id" value="${consultation.id}" />
    <input type="hidden" name="patientId" value="${patientId}" />
    Date de consultation: <input type="date" name="dateConsultation" value="${consultation.dateConsultation}"/><br/>
    Motif: <input type="text" name="motif" value="${consultation.motif}"/><br/>
    Observations: <textarea name="observations">${consultation.observations}</textarea><br/>
    Diagnostic: <textarea name="diagnostic">${consultation.diagnostic}</textarea><br/>
    Statut:
    <select name="statut">
        <option value="EN_ATTENTE" ${consultation.statut == 'EN_ATTENTE' ? 'selected' : ''}>En attente</option>
        <option value="EN_ATTENTE_AVIS_SPECIALISTE" ${consultation.statut == 'EN_ATTENTE_AVIS_SPECIALISTE' ? 'selected' : ''}>En attente avis spécialiste</option>
        <option value="TERMINEE" ${consultation.statut == 'TERMINEE' ? 'selected' : ''}>Terminée</option>
    </select><br/>
    Coût fixe: <input type="number" step="0.01" name="coutFixe" value="${consultation.coutFixe}"/><br/>
    <input type="submit" value="Enregistrer"/>
</form>
<a href="consultations?patientId=${patientId}">Retour à la liste des consultations</a>
</body>
</html>