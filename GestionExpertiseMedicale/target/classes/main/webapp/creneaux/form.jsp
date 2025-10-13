<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Gestion des Créneaux Hebdomadaires</title>
    <style>
        .form-container { max-width: 800px; margin: 20px auto; }
        .jour-section { border: 1px solid #ddd; margin: 10px 0; padding: 15px; }
        .jour-header { background: #f5f5f5; padding: 10px; margin: -15px -15px 15px -15px; }
        .form-group { margin: 10px 0; }
        label { display: inline-block; width: 150px; }
        input, select { padding: 5px; margin: 5px; }
        .checkbox-group { display: inline-block; margin-left: 20px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Planification des Créneaux Hebdomadaires</h2>

        <c:if test="${not empty param.success}">
            <div style="color: green; margin: 10px 0;">Créneaux sauvegardés avec succès!</div>
        </c:if>

        <c:if test="${not empty param.error}">
            <div style="color: red; margin: 10px 0;">Erreur: ${param.error}</div>
        </c:if>

        <form action="creneaux" method="post">
            <input type="hidden" name="action" value="semaine">

            <c:forEach var="jour" items="${joursSemaine}">
                <div class="jour-section">
                    <div class="jour-header">
                        <strong>${jour}</strong>
                    </div>

                    <div class="form-group">
                        <label>Heure de début:</label>
                        <input type="time" name="heureDebut_${jour}" value="08:00" required>
                    </div>

                    <div class="form-group">
                        <label>Heure de fin:</label>
                        <input type="time" name="heureFin_${jour}" value="17:00" required>
                    </div>

                    <div class="form-group">
                        <label>Durée consultation (min):</label>
                        <select name="duree_${jour}" required>
                            <option value="15">15 minutes</option>
                            <option value="30" selected>30 minutes</option>
                            <option value="45">45 minutes</option>
                            <option value="60">60 minutes</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Jour actif:</label>
                        <div class="checkbox-group">
                            <input type="checkbox" name="actif_${jour}" value="true" checked>
                            <label>Activer ce jour</label>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div style="margin-top: 20px;">
                <input type="submit" value="Enregistrer toute la semaine" style="padding: 10px 20px;">
                <a href="creneaux" style="margin-left: 20px;">Annuler</a>
            </div>
        </form>
    </div>
</body>
</html>