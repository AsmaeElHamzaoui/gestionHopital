<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Liste des utilisateurs</title></head>
<body>
<h2>Liste des utilisateurs</h2>
<a href="users?action=new">+ Ajouter un utilisateur</a>
<table border="1" cellpadding="5">
    <tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Rôle</th><th>Action</th></tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.id}</td>
            <td>${u.nom}</td>
            <td>${u.prenom}</td>
            <td>${u.email}</td>
            <td>${u.role}</td>
            <td>
                <a href="users?action=edit&id=${u.id}">Modifier</a>
                <a href="users?action=delete&id=${u.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
