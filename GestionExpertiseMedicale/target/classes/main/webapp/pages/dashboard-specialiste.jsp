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
                <img src="https://i.pravatar.cc/40?img=12" alt="Dr. ${user.nom}" class="w-10 h-10 rounded-full">
                <div class="text-right">
                    <p class="text-sm font-medium text-gray-900">Dr. ${user.nom}</p>
                    <p class="text-xs text-gray-500">${user.specialite}</p>
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
                <h2 class="text-2xl font-semibold text-gray-900" id="pageTitle">Mes Créneaux de Consultation</h2>
                <div class="flex gap-3">
                    <button onclick="openModal('add')" class="flex items-center gap-2 px-4 py-2 bg-emerald-500 text-white rounded-lg font-medium hover:bg-emerald-600 transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                        </svg>
                        Ajouter Créneaux
                    </button>
                </div>
            </div>

            <!-- Liste des créneaux par semaine -->
            <div class="bg-white rounded-lg border border-gray-200 p-6">
                <h3 class="text-lg font-medium text-gray-900 mb-4">Créneaux par semaine</h3>
                <c:choose>
                    <c:when test="${empty creneaux}">
                        <p class="text-gray-600">Aucun créneau défini. <a href="#" onclick="openModal('add')" class="text-teal-600 hover:underline">Ajoutez un créneau</a> pour commencer.</p>
                    </c:when>
                    <c:otherwise>
                        <table class="w-full border-collapse">
                            <thead>
                                <tr class="bg-gray-100">
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Jour</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Heure début</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Heure fin</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Durée consultation</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Nombre de créneaux</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Statut</th>
                                    <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="creneau" items="${creneaux}">
                                    <tr>
                                        <td class="border border-gray-200 px-4 py-2">${creneau.jourSemaine}</td>
                                        <td class="border border-gray-200 px-4 py-2">${creneau.heureDebut}</td>
                                        <td class="border border-gray-200 px-4 py-2">${creneau.heureFin}</td>
                                        <td class="border border-gray-200 px-4 py-2">${creneau.dureeConsultationMinutes} min</td>
                                        <td class="border border-gray-200 px-4 py-2">${creneau.nombreCreneaux}</td>
                                        <td class="border border-gray-200 px-4 py-2 ${creneau.actif ? 'text-green-600' : 'text-red-600'}">
                                            ${creneau.actif ? 'Actif' : 'Inactif'}
                                        </td>
                                        <td class="border border-gray-200 px-4 py-2">
                                            <a href="#" onclick="openModal('edit', ${creneau.id}, '${creneau.jourSemaine}', '${creneau.heureDebut}', '${creneau.heureFin}', ${creneau.dureeConsultationMinutes}, ${creneau.actif})" class="text-teal-600 hover:underline">Modifier</a>
                                            <a href="creneaux?action=delete&id=${creneau.id}" onclick="return confirm('Supprimer ce créneau?')" class="text-red-600 hover:underline ml-2">Supprimer</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>

    <!-- Modal pour ajouter ou modifier un créneau -->
    <div id="creneauModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3">
                <div class="flex justify-between items-center mb-4">
                    <h3 id="modalTitle" class="text-lg font-medium text-gray-900">Ajouter un Créneau</h3>
                    <button onclick="closeModal()" class="text-gray-400 hover:text-gray-600">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <form id="creneauForm" action="${pageContext.request.contextPath}/creneaux" method="POST">
                    <input type="hidden" name="action" id="formAction" value="add">
                    <input type="hidden" name="id" id="creneauId">
                    <input type="hidden" name="specialisteId" value="${sessionScope.user.id}">

                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Jour de la semaine</label>
                        <select name="jourSemaine" id="jourSemaine" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
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
                            <input type="time" name="heureDebut" id="heureDebut" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Heure de fin</label>
                            <input type="time" name="heureFin" id="heureFin" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Durée consultation (minutes)</label>
                        <input type="number" name="dureeConsultationMinutes" id="dureeConsultationMinutes" value="30" min="15" step="15" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                    </div>

                    <div class="flex items-center mb-4">
                        <input type="checkbox" name="actif" id="actif" class="w-4 h-4 text-teal-600 border-gray-300 rounded focus:ring-teal-500">
                        <label class="ml-2 text-sm text-gray-700">Créneau actif</label>
                    </div>

                    <div class="flex justify-end gap-3">
                        <button type="button" onclick="closeModal()" class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-md hover:bg-gray-200">
                            Annuler
                        </button>
                        <button type="submit" id="submitButton" class="px-4 py-2 text-sm font-medium text-white bg-teal-600 rounded-md hover:bg-teal-700">
                            Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openModal(action, id, jourSemaine, heureDebut, heureFin, dureeConsultationMinutes, actif) {
            const modal = document.getElementById('creneauModal');
            const form = document.getElementById('creneauForm');
            const modalTitle = document.getElementById('modalTitle');
            const formAction = document.getElementById('formAction');
            const creneauId = document.getElementById('creneauId');
            const jourSemaineSelect = document.getElementById('jourSemaine');
            const heureDebutInput = document.getElementById('heureDebut');
            const heureFinInput = document.getElementById('heureFin');
            const dureeConsultationInput = document.getElementById('dureeConsultationMinutes');
            const actifCheckbox = document.getElementById('actif');
            const submitButton = document.getElementById('submitButton');

            // Reset form
            form.reset();
            creneauId.value = '';
            actifCheckbox.checked = true;
            modalTitle.textContent = 'Ajouter un Créneau';
            formAction.value = 'add';
            submitButton.textContent = 'Ajouter';

            if (action === 'edit' && id) {
                // Populate form for editing
                modalTitle.textContent = 'Modifier un Créneau';
                formAction.value = 'edit';
                creneauId.value = id;
                jourSemaineSelect.value = jourSemaine || '';
                heureDebutInput.value = heureDebut || '';
                heureFinInput.value = heureFin || '';
                dureeConsultationInput.value = dureeConsultationMinutes || 30;
                actifCheckbox.checked = actif || false;
                submitButton.textContent = 'Modifier';
            }

            modal.classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('creneauModal').classList.add('hidden');
            document.getElementById('creneauForm').reset();
            document.getElementById('formAction').value = 'add';
            document.getElementById('modalTitle').textContent = 'Ajouter un Créneau';
            document.getElementById('submitButton').textContent = 'Ajouter';
        }

        // Fermer le modal en cliquant à l'extérieur
        window.onclick = function(event) {
            const modal = document.getElementById('creneauModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>