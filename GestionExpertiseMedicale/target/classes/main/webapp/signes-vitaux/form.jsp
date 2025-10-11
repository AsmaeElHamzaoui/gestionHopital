<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Formulaire Signes Vitaux</title></head>
<body>
<h2><c:choose>
    <c:when test="${not empty signesVitaux.id}">Modifier</c:when>
    <c:otherwise>Ajouter</c:otherwise>
</c:choose> des signes vitaux</h2>

<form action="signes-vitaux" method="post">
    <input type="hidden" name="id" value="${signesVitaux.id}" />
    <input type="hidden" name="patientId" value="${patientId}" />
    Tension: <input type="text" name="tension" value="${signesVitaux.tension}"/><br/>
    Fréquence cardiaque: <input type="number" name="frequenceCardiaque" value="${signesVitaux.frequenceCardiaque}"/><br/>
    Température: <input type="number" step="0.1" name="temperature" value="${signesVitaux.temperature}"/><br/>
    Fréquence respiratoire: <input type="number" name="frequenceRespiratoire" value="${signesVitaux.frequenceRespiratoire}"/><br/>
    Poids: <input type="number" step="0.1" name="poids" value="${signesVitaux.poids}"/><br/>
    Taille: <input type="number" step="0.01" name="taille" value="${signesVitaux.taille}"/><br/>
    Date de mesure: <input type="date" name="dateMesure" value="${signesVitaux.dateMesure}"/><br/>
    <input type="submit" value="Enregistrer"/>
</form>
<a href="signes-vitaux?patientId=${patientId}">Retour à la liste des signes vitaux</a>
</body>
</html>