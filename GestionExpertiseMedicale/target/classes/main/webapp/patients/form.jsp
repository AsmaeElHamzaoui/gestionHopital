<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Formulaire Patient</title></head>
<body>
<h2><c:choose>
    <c:when test="${not empty patient.id}">Modifier</c:when>
    <c:otherwise>Ajouter</c:otherwise>
</c:choose> un patient</h2>

<form action="patients" method="post">
    <input type="hidden" name="id" value="${patient.id}" />
    Nom: <input type="text" name="nom" value="${patient.nom}"/><br/>
    Prénom: <input type="text" name="prenom" value="${patient.prenom}"/><br/>
    Date de naissance: <input type="date" name="dateNaissance" value="${patient.dateNaissance}"/><br/>
    Numéro de sécurité sociale: <input type="text" name="numSecu" value="${patient.numSecu}"/><br/>
    Téléphone: <input type="text" name="telephone" value="${patient.telephone}"/><br/>
    Adresse: <input type="text" name="adresse" value="${patient.adresse}"/><br/>
    Date d'enregistrement: <input type="date" name="dateEnregistrement" value="${patient.dateEnregistrement}"/><br/>
    Statut: <input type="text" name="statut" value="${patient.statut}"/><br/>
    <input type="submit" value="Enregistrer"/>
</form>
<a href="patients">Retour à la liste</a>
</body>
</html>