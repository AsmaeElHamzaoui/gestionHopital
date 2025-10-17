<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Consultations du Patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-6">
        <h1 class="text-2xl font-bold mb-6">Consultations de ${patient.nom} ${patient.prenom}</h1>

        <a href="dashboard-generaliste" class="mb-4 inline-block bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">
            ← Retour au tableau de bord
        </a>

        <div class="bg-white rounded-lg shadow overflow-hidden">
            <table class="w-full">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Motif</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Diagnostic</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Statut</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <c:forEach var="consultation" items="${consultations}">
                        <tr>
                            <td class="px-6 py-4">${consultation.dateConsultation}</td>
                            <td class="px-6 py-4">${consultation.motif}</td>
                            <td class="px-6 py-4">${consultation.diagnostic}</td>
                            <td class="px-6 py-4">
                                <span class="px-2 py-1 text-xs rounded-full
                                    <c:choose>
                                        <c:when test="${consultation.statut == 'TERMINEE'}">bg-green-100 text-green-800</c:when>
                                        <c:otherwise>bg-yellow-100 text-yellow-800</c:otherwise>
                                    </c:choose>">
                                    ${consultation.statut}
                                </span>
                            </td>
                            <td class="px-6 py-4">
                                <a href="consultations?action=edit&id=${consultation.id}&patientId=${patient.id}"
                                   class="text-blue-600 hover:text-blue-900 mr-3">Modifier</a>
                                <a href="consultations?action=delete&id=${consultation.id}&patientId=${patient.id}"
                                   class="text-red-600 hover:text-red-900"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette consultation ?')">Supprimer
                                </a>
                                <button onclick="openModal(${consultation.id}, '${consultation.motif}')"
                                        class="px-4 py-2 m-4 bg-blue-500 text-white text-sm font-medium rounded-lg hover:bg-emerald-600 transition-colors">
                                    Ajouter acte
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty consultations}">
                        <tr>
                            <td colspan="5" class="px-6 py-4 text-center text-gray-500">
                                Aucune consultation trouvée pour ce patient.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <!-- Modal -->
        <div id="acteModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden flex items-center justify-center">
            <div class="bg-white rounded-lg p-6 w-full max-w-md">
                <h2 class="text-xl font-bold mb-4">Ajouter un Acte Technique</h2>
                <form id="acteForm" action="actes" method="POST">
                    <input type="hidden" name="consultationId" id="consultationId">
                    <div class="mb-4">
                        <label for="motif" class="block text-sm font-medium text-gray-700">Motif de la consultation</label>
                        <input type="text" id="motif" name="motif" disabled
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                    </div>
                    <div class="mb-4">
                        <label for="typeActe" class="block text-sm font-medium text-gray-700">Type d'acte</label>
                        <select id="typeActe" name="typeActe"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                                <option value="RADIOGRAPHIE">RADIOGRAPHIE</option>
                                <option value="ECHOGRAPHIE">ECHOGRAPHIE</option>
                                <option value="IRM">IRM</option>
                                <option value="ECG">ECG</option>
                                <option value="LASER">LASER</option>
                                <option value="FOND_OEIL">FOND_OEIL</option>
                                <option value="ANALYSE_SANG">ANALYSE_SANG</option>
                                <option value="ANALYSE_URINE">ANALYSE_URINE</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="cout" class="block text-sm font-medium text-gray-700">Coût (€)</label>
                        <input type="number" id="cout" name="cout" step="0.01" min="0" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                    </div>
                    <div class="flex justify-end">
                        <button type="button" onclick="closeModal()"
                                class="mr-2 px-4 py-2 bg-gray-300 text-gray-800 rounded hover:bg-gray-400">
                            Annuler
                        </button>
                        <button type="submit"
                                class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">
                            Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openModal(consultationId, motif) {
            document.getElementById('consultationId').value = consultationId;
            document.getElementById('motif').value = motif;
            document.getElementById('acteModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('acteModal').classList.add('hidden');
            document.getElementById('acteForm').reset();
        }

        // Close modal when clicking outside
        document.getElementById('acteModal').addEventListener('click', function(event) {
            if (event.target === this) {
                closeModal();
            }
        });
    </script>
</body>
</html>