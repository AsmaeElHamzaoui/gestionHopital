<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interface Infirmier - Gestion des patients</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-4xl mx-auto mt-8 animate-slide-in">
    <h2 class="text-2xl font-bold text-blue-600 mb-6 text-center">
        <c:choose>
            <c:when test="${not empty signesVitaux.id}">Modifier les Signes Vitaux</c:when>
            <c:otherwise>Ajouter des Signes Vitaux</c:otherwise>
        </c:choose>
    </h2>

    <form action="signes-vitaux" method="post" class="space-y-6">
        <input type="hidden" name="id" value="${signesVitaux.id}" />

        <!-- Sélection du patient -->
        <div class="mb-6">
            <label class="block text-gray-700 font-semibold mb-2">Sélectionner le patient</label>
            <select name="patientId" class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-500" required>
                <option value="">Choisir un patient...</option>
                <c:forEach var="p" items="${patients}">
                    <option value="${p.id}" ${p.id == signesVitaux.patientId ? 'selected' : ''}>${p.nom} ${p.prenom}</option>
                </c:forEach>
            </select>
        </div>

        <div class="grid grid-cols-2 gap-6">
            <div class="flex items-center">
                <label for="tension" class="w-48 text-gray-700 font-medium">Tension :</label>
                <input type="text" id="tension" name="tension" value="${signesVitaux.tension}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center">
                <label for="frequenceCardiaque" class="w-48 text-gray-700 font-medium">Fréquence cardiaque :</label>
                <input type="number" id="frequenceCardiaque" name="frequenceCardiaque" value="${signesVitaux.frequenceCardiaque}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center">
                <label for="temperature" class="w-48 text-gray-700 font-medium">Température (°C) :</label>
                <input type="number" step="0.1" id="temperature" name="temperature" value="${signesVitaux.temperature}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center">
                <label for="frequenceRespiratoire" class="w-48 text-gray-700 font-medium">Fréquence respiratoire :</label>
                <input type="number" id="frequenceRespiratoire" name="frequenceRespiratoire" value="${signesVitaux.frequenceRespiratoire}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center">
                <label for="poids" class="w-48 text-gray-700 font-medium">Poids (kg) :</label>
                <input type="number" step="0.1" id="poids" name="poids" value="${signesVitaux.poids}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center">
                <label for="taille" class="w-48 text-gray-700 font-medium">Taille (m) :</label>
                <input type="number" step="0.01" id="taille" name="taille" value="${signesVitaux.taille}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="flex items-center col-span-2">
                <label for="dateMesure" class="w-48 text-gray-700 font-medium">Date de mesure :</label>
                <input type="date" id="dateMesure" name="dateMesure" value="${signesVitaux.dateMesure}"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
        </div>

        <div class="flex justify-end gap-3 mt-8">
            <button type="button" onclick="showPatientList()" class="px-5 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-100 transition">
                Annuler
            </button>
            <button type="submit" class="px-6 py-2 bg-blue-500 text-white rounded-lg font-medium hover:bg-blue-600 transition">
                <c:choose>
                    <c:when test="${not empty signesVitaux.id}">Modifier</c:when>
                    <c:otherwise>Enregistrer</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form>
</div>