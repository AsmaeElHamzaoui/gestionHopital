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
                <a href="#" onclick="showSection('creneaux')" id="nav-creneaux" class="flex items-center gap-3 px-4 py-3 bg-teal-600 text-white rounded-lg font-medium">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    Mes Créneaux
                </a>
                <a href="#" onclick="showSection('demandes')" id="nav-demandes" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg relative">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                    Demandes d'Expertise
                    <c:if test="${not empty demandes && demandes.size() > 0}">
                        <span class="absolute right-3 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">${demandes.size()}</span>
                    </c:if>
                </a>
                <a href="#" onclick="showSection('statistiques')" id="nav-statistiques" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                    </svg>
                    Statistiques
                </a>
            </nav>
        </aside>

        <main class="flex-1 p-6">
            <!-- Section Créneaux -->
            <div id="section-creneaux" class="section-content">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Mes Créneaux de Consultation</h2>
                    <div class="flex gap-3">
                        <button onclick="openModal('add')" class="flex items-center gap-2 px-4 py-2 bg-emerald-500 text-white rounded-lg font-medium hover:bg-emerald-600 transition-colors">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                            </svg>
                            Ajouter Créneaux
                        </button>
                    </div>
                </div>

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
                                        <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Disponibilité</th>
                                        <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="creneau" items="${creneaux}">
                                        <tr>
                                            <td class="border border-gray-200 px-4 py-2">${creneau.dateJourActuelle}</td>
                                            <td class="border border-gray-200 px-4 py-2">${creneau.heureDebut}</td>
                                            <td class="border border-gray-200 px-4 py-2">${creneau.heureFin}</td>
                                            <td class="border border-gray-200 px-4 py-2 ${creneau.disponible ? 'text-green-600' : 'text-red-600'}">
                                                ${creneau.disponible ? 'Disponible' : 'Indisponible'}
                                            </td>
                                            <td class="border border-gray-200 px-4 py-2">
                                                <a href="#" onclick="openModal('edit', ${creneau.id}, '${creneau.dateJourActuelle}', '${creneau.heureDebut}', '${creneau.heureFin}', ${creneau.disponible})" class="text-teal-600 hover:underline">Modifier</a>
                                                <a href="creneaux?action=delete&id=${creneau.id}" onclick="return confirm('Supprimer ce créneau?')" class="text-red-600 hover:underline ml-2">Supprimer</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Section Demandes d'Expertise -->
            <div id="section-demandes" class="section-content hidden">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Demandes d'Expertise</h2>
                </div>

                <div class="bg-white rounded-lg border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h3 class="text-lg font-semibold text-gray-900">Liste des demandes reçues</h3>
                    </div>
                    <c:choose>
                        <c:when test="${empty demandes}">
                            <div class="px-6 py-8 text-center">
                                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                <p class="mt-2 text-gray-600">Aucune demande d'expertise pour le moment</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="overflow-x-auto">
                                <table class="w-full">
                                    <thead class="bg-gray-50 border-b border-gray-200">
                                        <tr>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Patient</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Motif</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date demande</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Priorité</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        <c:forEach var="demande" items="${demandes}">
                                            <tr class="hover:bg-gray-50 transition-colors">
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <div class="flex items-center gap-3">
                                                        <div class="w-10 h-10 bg-teal-500 rounded-full flex items-center justify-center text-white font-semibold">
                                                            ${demande.consultation.patient.prenom.charAt(0)}${demande.consultation.patient.nom.charAt(0)}
                                                        </div>
                                                        <div>
                                                            <div class="text-sm font-medium text-gray-900">
                                                                ${demande.consultation.patient.nom} ${demande.consultation.patient.prenom}
                                                            </div>
                                                            <div class="text-xs text-gray-500">${demande.consultation.patient.telephone}</div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <div class="text-sm text-gray-900">${demande.consultation.motif}</div>
                                                    <div class="text-xs text-gray-500 mt-1">${demande.question}</div>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-900">
                                                        <fmt:formatDate value="${demande.dateDemande}" pattern="dd/MM/yyyy HH:mm"/>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                        <c:choose>
                                                            <c:when test="${demande.priorite == 4}">bg-red-100 text-red-800</c:when>
                                                            <c:when test="${demande.priorite == 3}">bg-orange-100 text-orange-800</c:when>
                                                            <c:when test="${demande.priorite == 2}">bg-green-100 text-green-800</c:when>
                                                            <c:otherwise>bg-blue-100 text-blue-800</c:otherwise>
                                                        </c:choose>">
                                                        <c:choose>
                                                            <c:when test="${demande.priorite == 4}">Urgente</c:when>
                                                            <c:when test="${demande.priorite == 3}">Élevée</c:when>
                                                            <c:when test="${demande.priorite == 2}">Normale</c:when>
                                                            <c:otherwise>Faible</c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                        <c:choose>
                                                            <c:when test="${demande.statut == 'EN_ATTENTE'}">bg-yellow-100 text-yellow-800</c:when>
                                                            <c:when test="${demande.statut == 'EN_COURS'}">bg-blue-100 text-blue-800</c:when>
                                                            <c:when test="${demande.statut == 'TERMINEE'}">bg-green-100 text-green-800</c:when>
                                                            <c:otherwise>bg-gray-100 text-gray-800</c:otherwise>
                                                        </c:choose>">
                                                        ${demande.statut}
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4 whitespace-nowrap">
                                                    <button onclick="viewDemande(${demande.id})" class="text-teal-600 hover:text-teal-900 font-medium text-sm">
                                                        Consulter
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Section Statistiques -->
            <div id="section-statistiques" class="section-content hidden">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Statistiques</h2>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-white rounded-lg border border-gray-200 p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Total Créneaux</p>
                                <p class="text-3xl font-bold text-gray-900 mt-2">${creneaux.size()}</p>
                            </div>
                            <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-lg border border-gray-200 p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Demandes reçues</p>
                                <p class="text-3xl font-bold text-gray-900 mt-2">${demandes.size()}</p>
                            </div>
                            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-lg border border-gray-200 p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Taux de réponse</p>
                                <p class="text-3xl font-bold text-gray-900 mt-2">95%</p>
                            </div>
                            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
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
                    <input type="hidden" name="idSpecialiste" value="${sessionScope.user.id}">
                    <input type="hidden" name="dateJourActuelle" id="dateJourActuelle" value="<%= java.time.LocalDate.now() %>">

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

                    <div class="flex items-center mb-4">
                        <input type="checkbox" name="disponible" id="disponible" class="w-4 h-4 text-teal-600 border-gray-300 rounded focus:ring-teal-500" checked>
                        <label class="ml-2 text-sm text-gray-700">Créneau disponible</label>
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
        // Navigation entre sections
        function showSection(sectionName) {
            // Cacher toutes les sections
            const sections = document.querySelectorAll('.section-content');
            sections.forEach(section => section.classList.add('hidden'));

            // Retirer la classe active de tous les liens
            const navLinks = document.querySelectorAll('aside a');
            navLinks.forEach(link => {
                link.classList.remove('bg-teal-600', 'text-white');
                link.classList.add('text-gray-700', 'hover:bg-gray-50');
            });

            // Afficher la section sélectionnée
            document.getElementById('section-' + sectionName).classList.remove('hidden');

            // Activer le lien de navigation correspondant
            const activeNav = document.getElementById('nav-' + sectionName);
            activeNav.classList.add('bg-teal-600', 'text-white');
            activeNav.classList.remove('text-gray-700', 'hover:bg-gray-50');
        }

        function openModal(action, id, dateJourActuelle, heureDebut, heureFin, disponible) {
            const modal = document.getElementById('creneauModal');
            const form = document.getElementById('creneauForm');
            const modalTitle = document.getElementById('modalTitle');
            const formAction = document.getElementById('formAction');
            const creneauId = document.getElementById('creneauId');
            const heureDebutInput = document.getElementById('heureDebut');
            const heureFinInput = document.getElementById('heureFin');
            const dispoCheckbox = document.getElementById('disponible');
            const dateInput = document.getElementById('dateJourActuelle');
            const submitButton = document.getElementById('submitButton');

            // Reset form
            form.reset();
            creneauId.value = '';
            dispoCheckbox.checked = true;
            dateInput.value = new Date().toISOString().split('T')[0];
            modalTitle.textContent = 'Ajouter un Créneau';
            formAction.value = 'add';
            submitButton.textContent = 'Ajouter';

            // Si c'est une modification
            if (action === 'edit' && id) {
                modalTitle.textContent = 'Modifier un Créneau';
                formAction.value = 'edit';
                creneauId.value = id;
                heureDebutInput.value = heureDebut;
                heureFinInput.value = heureFin;
                dispoCheckbox.checked = disponible;
                dateInput.value = dateJourActuelle;
                submitButton.textContent = 'Modifier';
            }

            modal.classList.remove('hidden');
        }

        function closeModal() {
            const modal = document.getElementById('creneauModal');
            modal.classList.add('hidden');
            document.getElementById('creneauForm').reset();
        }

        function viewDemande(demandeId) {
            // Rediriger vers la page de détail de la demande
            window.location.href = 'demande-expertise?action=view&id=' + demandeId;
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