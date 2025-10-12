<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signes vitaux du patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <div class="container mx-auto p-6">
        <!-- En-tête -->
        <div class="flex justify-between items-center mb-6">
            <div>
                <h1 class="text-2xl font-bold text-gray-900">Signes vitaux du patient</h1>
                <p class="text-lg text-gray-600">${patient.nom} ${patient.prenom}</p>
            </div>
            <div class="flex gap-3">
                <a href="dashboard-infermier"
                   class="flex items-center gap-2 px-4 py-2 bg-gray-500 text-white rounded-lg font-medium hover:bg-gray-600 transition-colors">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Retour au tableau de bord
                </a>
            </div>
        </div>

        <!-- Tableau des signes vitaux -->
        <div class="bg-white rounded-lg shadow-sm overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tension</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fréquence cardiaque</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Température</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Fréquence respiratoire</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Poids</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Taille</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de mesure</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach var="s" items="${signesVitauxList}">
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.tension}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.frequenceCardiaque}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.temperature}°C</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.frequenceRespiratoire}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.poids} kg</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.taille} cm</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${s.dateMesure}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <a href="signes-vitaux?action=edit&id=${s.id}&patientId=${patient.id}"
                                       class="text-blue-600 hover:text-blue-900 mr-3">Modifier</a>
                                    <a href="signes-vitaux?action=delete&id=${s.id}&patientId=${patient.id}"
                                       class="text-red-600 hover:text-red-900"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ces signes vitaux ?')">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty signesVitauxList}">
                            <tr>
                                <td colspan="9" class="px-6 py-4 text-center text-sm text-gray-500">
                                    Aucun signe vital enregistré pour ce patient.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>