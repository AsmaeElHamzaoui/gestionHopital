```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TéléExpertise Médicale - Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <header class="bg-white border-b border-gray-200 px-6 py-4">
        <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-teal-600 rounded-lg flex items-center justify-center text-white font-bold text-xl">
                    T
                </div>
                <div>
                    <h1 class="text-lg font-semibold text-gray-900">TéléExpertise Médicale</h1>
                    <p class="text-sm text-gray-500">Espace Médecin Spécialiste</p>
                </div>
            </div>
            <div class="flex items-center gap-3">
                <img src="https://i.pravatar.cc/40?img=12" alt="Dr. Martin Dubois" class="w-10 h-10 rounded-full">
                <div class="text-right">
                    <p class="text-sm font-medium text-gray-900">Dr. Martin Dubois</p>
                    <p class="text-xs text-gray-500">Cardiologue</p>
                </div>
                <button class="text-gray-400 hover:text-gray-600">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                    </svg>
                </button>
            </div>
        </div>
    </header>

    <div class="flex">
        <aside class="w-64 bg-white border-r border-gray-200 min-h-screen p-4">
            <nav class="space-y-2">
                <a href="#" class="flex items-center gap-3 px-4 py-3 bg-teal-600 text-white rounded-lg font-medium">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    Mes Créneaux
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg relative">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                    Demandes d'Expertise
                    <span class="absolute right-3 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">1</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                    </svg>
                    Statistiques
                </a>
            </nav>
        </aside>

        <main class="flex-1 p-6">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-900" id="pageTitle">Liste des créneaux et demandes d'expertise</h2>
                <div class="flex gap-3">
                    <button onclick="openModal()" class="flex items-center gap-2 px-4 py-2 bg-emerald-500 text-white rounded-lg font-medium hover:bg-emerald-600 transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                        </svg>
                        Ajouter Créneaux
                    </button>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-6">
                <div class="bg-white rounded-lg border border-gray-200 p-6">
                    <div class="flex items-center justify-between mb-4">
                        <div>
                            <h2 class="text-lg font-semibold text-gray-900">Planning d'Aujourd'hui</h2>
                            <p class="text-sm text-gray-500" id="dateAujourdhui"></p>
                        </div>
                    </div>

                    <div class="space-y-3" id="creneauxContainer">
                        <c:forEach var="creneau" items="${creneauxDuJour}">
                            <div class="flex items-center justify-between p-3 ${creneau.statut == 'LIBRE' ? 'bg-teal-50 border-teal-200' : creneau.statut == 'RESERVE' ? 'bg-red-50 border-red-200' : 'bg-yellow-50 border-yellow-200'} border rounded-lg">
                                <div class="flex items-center gap-3">
                                    <div class="w-2 h-2 ${creneau.statut == 'LIBRE' ? 'bg-teal-500' : creneau.statut == 'RESERVE' ? 'bg-red-500' : 'bg-yellow-500'} rounded-full"></div>
                                    <div>
                                        <p class="text-sm font-medium text-gray-900">
                                            <fmt:formatDate value="${creneau.heureDebut}" pattern="HH:mm"/> -
                                            <fmt:formatDate value="${creneau.heureFin}" pattern="HH:mm"/>
                                        </p>
                                        <p class="text-xs text-gray-600">
                                            <c:choose>
                                                <c:when test="${creneau.statut == 'LIBRE'}">Disponible</c:when>
                                                <c:when test="${creneau.statut == 'RESERVE'}">Expertise - ${creneau.patientNom}</c:when>
                                                <c:otherwise>En attente confirmation</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <span class="text-xs font-medium ${creneau.statut == 'LIBRE' ? 'text-teal-700 bg-teal-100' : creneau.statut == 'RESERVE' ? 'text-red-700 bg-red-100' : 'text-yellow-700 bg-yellow-100'} px-2 py-1 rounded">
                                    <c:choose>
                                        <c:when test="${creneau.statut == 'LIBRE'}">Libre</c:when>
                                        <c:when test="${creneau.statut == 'RESERVE'}">Réservé</c:when>
                                        <c:otherwise>Attente</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </c:forEach>

                        <c:if test="${empty creneauxDuJour}">
                            <div class="text-center py-8 text-gray-500">
                                <svg class="w-12 h-12 mx-auto text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                                <p class="mt-2">Aucun créneau programmé pour aujourd'hui</p>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div>
                    <div class="flex items-center justify-between mb-4">
                        <h2 class="text-lg font-semibold text-gray-900">Demandes d'Expertise</h2>
                        <a href="#" class="text-sm text-teal-600 hover:text-teal-700 font-medium">Voir tout</a>
                    </div>

                    <div class="space-y-4">
                        <div class="bg-white rounded-lg border border-gray-200 p-4">
                            <div class="flex items-start justify-between mb-3">
                                <span class="text-xs font-semibold text-white bg-gray-600 px-2 py-1 rounded">NON URGENTE</span>
                                <span class="text-xs text-gray-500">il y a 6h</span>
                            </div>
                            <h3 class="font-semibold text-gray-900 mb-2">Patient: Mohamed Idrissi</h3>
                            <p class="text-sm text-gray-600 mb-3">Contrôle de routine post-infarctus. Ajustement traitement.</p>
                            <div class="flex items-center justify-between">
                                <p class="text-xs text-gray-500">Dr. Tazi (Généraliste)</p>
                                <button class="bg-teal-600 hover:bg-teal-700 text-white text-sm font-medium px-4 py-2 rounded-lg">
                                    Répondre
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Modal d'ajout de créneaux -->
    <div id="creneauModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-medium text-gray-900">Ajouter un Créneau</h3>
                    <button onclick="closeModal()" class="text-gray-400 hover:text-gray-600">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <form id="creneauForm" action="${pageContext.request.contextPath}/creneaux" method="POST">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="specialisteId" value="${sessionScope.user.id}">

                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Jour de la semaine</label>
                        <select name="jourSemaine" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                            <option value="">Sélectionner un jour</option>
                            <option value="LUNDI">Lundi</option>
                            <option value="MARDI">Mardi</option>
                            <option value="MERCREDI">Mercredi</option>
                            <option value="JEUDI">Jeudi</option>
                            <option value="VENDREDI">Vendredi</option>
                            <option value="SAMEDI">Samedi</option>
                            <option value="DIMANCHE">Dimanche</option>
                        </select>
                    </div>

                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Heure de début</label>
                            <input type="time" name="heureDebut" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Heure de fin</label>
                            <input type="time" name="heureFin" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Durée consultation (minutes)</label>
                        <input type="number" name="dureeConsultationMinutes" value="30" min="15" step="15" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                    </div>

                    <div class="flex items-center mb-4">
                        <input type="checkbox" name="actif" checked class="w-4 h-4 text-teal-600 border-gray-300 rounded focus:ring-teal-500">
                        <label class="ml-2 text-sm text-gray-700">Créneau actif</label>
                    </div>

                    <div class="flex justify-end gap-3">
                        <button type="button" onclick="closeModal()" class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-md hover:bg-gray-200">
                            Annuler
                        </button>
                        <button type="submit" class="px-4 py-2 text-sm font-medium text-white bg-teal-600 rounded-md hover:bg-teal-700">
                            Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Fonctions pour gérer le modal
        function openModal() {
            document.getElementById('creneauModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('creneauModal').classList.add('hidden');
        }

        // Fermer le modal en cliquant à l'extérieur
        window.onclick = function(event) {
            const modal = document.getElementById('creneauModal');
            if (event.target === modal) {
                closeModal();
            }
        }

        // Afficher la date d'aujourd'hui
        function afficherDateAujourdhui() {
            const aujourdhui = new Date();
            const options = { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' };
            document.getElementById('dateAujourdhui').textContent = aujourdhui.toLocaleDateString('fr-FR', options);
        }

        // Charger au démarrage
        document.addEventListener('DOMContentLoaded', function() {
            afficherDateAujourdhui();
        });
    </script>
</body>
</html>
```