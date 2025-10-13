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
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette consultation ?')">Supprimer</a>
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
    </div>
</body>
</html>