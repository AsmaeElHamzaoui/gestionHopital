<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Formulaire Utilisateur</title></head>
<body>
<h2>
    <c:choose>
        <c:when test="${not empty user.id}">Modifier</c:when>
        <c:otherwise>Ajouter</c:otherwise>
    </c:choose> un utilisateur
</h2>

<form action="users" method="post">
    <input type="hidden" name="id" value="${user.id}" />

    Nom: <input type="text" name="nom" value="${user.nom}" required/><br/>
    Prénom: <input type="text" name="prenom" value="${user.prenom}" required/><br/>
    Email: <input type="email" name="email" value="${user.email}" required/><br/>

    <!-- Mot de passe -->
    Mot de passe:
    <input type="password" name="password" placeholder="<c:out value='${user.id != null ? "Laisser vide pour ne pas changer" : ""}'/>"/><br/>

    <!-- Sélecteur de rôle -->
    Rôle:
    <select name="role" id="roleSelect" required onchange="toggleSpecialite()">
        <option value="">-- Choisir un rôle --</option>
        <option value="INFIRMIER" <c:if test="${user.role == 'INFIRMIER'}">selected</c:if>>Infirmier</option>
        <option value="GENERALISTE" <c:if test="${user.role == 'GENERALISTE'}">selected</c:if>>Généraliste</option>
        <option value="SPECIALISTE" <c:if test="${user.role == 'SPECIALISTE'}">selected</c:if>>Spécialiste</option>
    </select><br/><br/>

    <!-- Sélecteur de spécialité (visible seulement pour les spécialistes) -->
    <div id="specialiteDiv" style="display: none;">
        Spécialité:
        <select name="specialite">
            <option value="">-- Choisir une spécialité --</option>
            <c:forEach var="spec" items="${specialites}">
                <option value="${spec}" <c:if test="${user.specialite == spec}">selected</c:if>>
                    ${spec}
                </option>
            </c:forEach>
        </select><br/><br/>
    </div>

    <input type="submit" value="Enregistrer"/>
</form>

<a href="users">Retour à la liste</a>

<script>
    function toggleSpecialite() {
        const roleSelect = document.getElementById('roleSelect');
        const specialiteDiv = document.getElementById('specialiteDiv');

        if (roleSelect.value === 'SPECIALISTE') {
            specialiteDiv.style.display = 'block';
        } else {
            specialiteDiv.style.display = 'none';
        }
    }

    // Initialiser l'état au chargement de la page
    document.addEventListener('DOMContentLoaded', function() {
        toggleSpecialite();
    });
</script>
</body>
</html>