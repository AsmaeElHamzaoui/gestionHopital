<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-5xl mx-auto mt-8 animate-slide-in">
    <h2 class="text-2xl font-bold text-teal-600 mb-6 text-center">
        <c:choose>
            <c:when test="${not empty patient.id}">Modifier le Patient</c:when>
            <c:otherwise>Ajouter un Patient</c:otherwise>
        </c:choose>
    </h2>

    <form action="patients" method="post" class="grid grid-cols-2 gap-6">
        <input type="hidden" name="id" value="${patient.id}" />

        <!-- Colonne gauche -->
        <div class="space-y-4">
            <div>
                <label class="block text-gray-700 font-semibold mb-2">Nom</label>
                <input type="text" name="nom" value="${patient.nom}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" required />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Prénom</label>
                <input type="text" name="prenom" value="${patient.prenom}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" required />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Date de naissance</label>
                <input type="date" name="dateNaissance" value="${patient.dateNaissance}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" required />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Numéro de sécurité sociale</label>
                <input type="text" name="numSecu" value="${patient.numSecu}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" required />
            </div>
        </div>

        <!-- Colonne droite -->
        <div class="space-y-4">
            <div>
                <label class="block text-gray-700 font-semibold mb-2">Téléphone</label>
                <input type="text" name="telephone" value="${patient.telephone}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Adresse</label>
                <input type="text" name="adresse" value="${patient.adresse}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Date d'enregistrement</label>
                <input type="date" name="dateEnregistrement" value="${patient.dateEnregistrement}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2">Statut</label>
                <input type="text" name="statut" value="${patient.statut}"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" />
            </div>
        </div>

        <!-- Boutons -->
        <div class="col-span-2 mt-6 flex justify-between">
            <button type="button" onclick="showPatientList()" class="px-6 py-2 text-teal-600 font-semibold hover:text-teal-800 transition duration-300">
                Annuler
            </button>
            <button type="submit" class="bg-teal-500 text-white px-8 py-2 rounded-lg hover:bg-teal-400 transition duration-300">
                <c:choose>
                    <c:when test="${not empty patient.id}">Modifier</c:when>
                    <c:otherwise>Enregistrer</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form>
</div>