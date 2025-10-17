<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire Consultation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-6">
    <div class="max-w-7xl mx-auto bg-white rounded-lg shadow-sm p-6">
        <h2 class="text-lg font-semibold text-gray-800 mb-6">
            <c:choose>
                <c:when test="${not empty consultation.id}">Modifier</c:when>
                <c:otherwise>Ajouter</c:otherwise>
            </c:choose> une consultation
        </h2>

        <form action="consultations" method="post" class="space-y-4">
            <input type="hidden" name="id" value="${consultation.id}" />
            <input type="hidden" name="patientId" value="${patientId}" />

            <!-- Date de consultation -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Date de consultation</label>
                <input type="date" name="dateConsultation" value="${consultation.dateConsultation}"
                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm" required />
            </div>

            <!-- Motif -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Motif de consultation</label>
                <input type="text" name="motif" value="${consultation.motif}"
                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm"
                       placeholder="Décrivez le motif de la consultation..." />
            </div>

            <!-- Observations -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Observations</label>
                <textarea name="observations" rows="3"
                          class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                          placeholder="Notes d'examen clinique...">${consultation.observations}</textarea>
            </div>

            <!-- Diagnostic -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Diagnostic</label>
                <textarea name="diagnostic" rows="3"
                          class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                          placeholder="Diagnostic établi...">${consultation.diagnostic}</textarea>
            </div>

            <!-- Statut -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Statut</label>
                <select name="statut"
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm" required>
                    <option value="EN_ATTENTE" ${consultation.statut == 'EN_ATTENTE' ? 'selected' : ''}>En attente</option>
                    <option value="EN_ATTENTE_AVIS_SPECIALISTE" ${consultation.statut == 'EN_ATTENTE_AVIS_SPECIALISTE' ? 'selected' : ''}>En attente avis spécialiste</option>
                    <option value="TERMINEE" ${consultation.statut == 'TERMINEE' ? 'selected' : ''}>Terminée</option>
                </select>
            </div>

            <!-- Coût fixe -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Coût consultation</label>
                <input type="number" step="0.01" name="coutFixe" value="${consultation.coutFixe}"
                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm font-medium"
                       required />
            </div>

            <!-- Buttons -->
            <div class="flex gap-3 pt-2">
                <button type="submit"
                        class="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    Enregistrer
                </button>
                <a href="consultations?patientId=${patientId}"
                   class="flex-1 bg-gray-800 hover:bg-gray-900 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                    </svg>
                    Retour à la liste des consultations
                </a>
            </div>
        </form>
    </div>
</body>
</html>