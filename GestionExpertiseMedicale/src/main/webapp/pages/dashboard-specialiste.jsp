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
                <a href="#" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg" onclick="showSection('creneaux')">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    Mes Créneaux
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg" onclick="showSection('expertises')">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                    Demandes d'Expertise
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg" onclick="showSection('statistiques')">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                    </svg>
                    Statistiques
                </a>
            </nav>
        </aside>

        <main class="flex-1 p-6">
            <div id="creneauxSection">
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
                                        <th class="border border-gray-200 px-4 py-2 text-left text-sm font-medium text-gray-700">Disponiblilité</th>
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

            <div id="expertisesSection" class="hidden">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Demandes d'Expertise</h2>
                </div>
                <div class="bg-white rounded-lg border border-gray-200 p-6">
                    <h3 class="text-lg font-medium text-gray-900 mb-4">Liste des demandes d'expertise actuelle</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <c:forEach var="demande" items="${demandes}">
                            <c:if test="${demande.priorite == 1}">
                                <div class="bg-white border-l-4 border-red-500 rounded-lg shadow p-4">
                                    <p style="color:red;">Urgente</p>
                                    <h4 class="text-md font-semibold text-gray-900">${demande.dateDemande}</h4>
                                    <p class="text-sm text-gray-600">${demande.question}</p>
                                    <div class="mt-2">
                                        <a href="#" onclick="openResponseModal(${demande.id})" class="text-teal-600 hover:underline text-sm">Répondre</a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${demande.priorite == 2}">
                                <div class="bg-white border-l-4 border-orange-500 rounded-lg shadow p-4">
                                    <p style="color:orange;">Élevée</p>
                                    <h4 class="text-md font-semibold text-gray-900">${demande.dateDemande}</h4>
                                    <p class="text-sm text-gray-600">${demande.question}</p>
                                    <div class="mt-2">
                                        <a href="#" onclick="openResponseModal(${demande.id})" class="text-teal-600 hover:underline text-sm">Répondre</a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${demande.priorite == 3}">
                                <div class="bg-white border-l-4 border-green-500 rounded-lg shadow p-4">
                                    <p style="color:green;">Normale</p>
                                    <h4 class="text-md font-semibold text-gray-900">${demande.dateDemande}</h4>
                                    <p class="text-sm text-gray-600">${demande.question}</p>
                                    <div class="mt-2">
                                        <a href="#" onclick="openResponseModal(${demande.id})" class="text-teal-600 hover:underline text-sm">Répondre</a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Section Statistiques -->
            <div id="statistiquesSection" class="hidden">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Statistiques</h2>
                </div>

                <!-- Cartes de statistiques principales -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6 mb-6">
                    <!-- Carte 1: Nombre d'expertises -->
                    <div class="bg-white rounded-lg border border-gray-200 p-6 shadow-sm hover:shadow-md transition-shadow">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm font-medium text-gray-600">nombre d'expertises</p>
                                <p class="text-3xl font-bold text-gray-900 mt-2">${total}</p>
                            </div>
                            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <!-- Carte 2: Revenu du Mois -->
                    <div class="bg-white rounded-lg border border-gray-200 p-6 shadow-sm hover:shadow-md transition-shadow">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm font-medium text-gray-600">Revenu du Mois</p>
                                <p class="text-3xl font-bold text-gray-900 mt-2">${revenu}</p>
                            </div>
                            <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
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
                        <label class="ml-2text-sm text-gray-700">Créneau disponible</label>
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

                                              <!-- Modal pour répondre à une demande d'expertise -->
                                              <div id="responseModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
                                                  <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
                                                      <div class="mt-3">
                                                          <div class="flex justify-between items-center mb-4">
                                                              <h3 class="text-lg font-medium text-gray-900">Répondre à la Demande</h3>
                                                              <button onclick="closeResponseModal()" class="text-gray-400 hover:text-gray-600">
                                                                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                                                  </svg>
                                                              </button>
                                                          </div>
                                                          <form id="responseForm" action="${pageContext.request.contextPath}/demande-expertise?action=repondre" method="POST">
                                                              <input type="hidden" name="demandeId" id="demandeId">
                                                              <div class="mb-4">
                                                                  <label class="block text-sm font-medium text-gray-700 mb-2">Tarif (€)</label>
                                                                  <input type="number" name="tarif" id="tarif" step="0.01" min="0" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required>
                                                              </div>
                                                              <div class="mb-4">
                                                                  <label class="block text-sm font-medium text-gray-700 mb-2">Réponse</label>
                                                                  <textarea name="reponse" id="reponse" rows="4" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" required></textarea>
                                                              </div>
                                                              <div class="flex justify-end gap-3">
                                                                  <button type="button" onclick="closeResponseModal()" class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-md hover:bg-gray-200">
                                                                      Annuler
                                                                  </button>
                                                                  <button type="submit" class="px-4 py-2 text-sm font-medium text-white bg-teal-600 rounded-md hover:bg-teal-700">
                                                                      Envoyer
                                                                  </button>
                                                              </div>
                                                          </form>
                                                      </div>
                                                  </div>
                                              </div>

                                              <script>
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

                                                  function openResponseModal(demandeId) {
                                                      const modal = document.getElementById('responseModal');
                                                      const form = document.getElementById('responseForm');
                                                      const demandeIdInput = document.getElementById('demandeId');

                                                      // Reset form
                                                      form.reset();
                                                      demandeIdInput.value = demandeId;

                                                      modal.classList.remove('hidden');
                                                  }

                                                  function closeResponseModal() {
                                                      const modal = document.getElementById('responseModal');
                                                      modal.classList.add('hidden');
                                                      document.getElementById('responseForm').reset();
                                                  }

                                                  // Fermer les modals en cliquant à l'extérieur
                                                  window.onclick = function(event) {
                                                      const creneauModal = document.getElementById('creneauModal');
                                                      const responseModal = document.getElementById('responseModal');
                                                      if (event.target === creneauModal) {
                                                          closeModal();
                                                      }
                                                      if (event.target === responseModal) {
                                                          closeResponseModal();
                                                      }
                                                  }

                                                  function showSection(section) {
                                                      const creneauxSection = document.getElementById('creneauxSection');
                                                      const expertisesSection = document.getElementById('expertisesSection');
                                                      const statistiquesSection = document.getElementById('statistiquesSection');
                                                      const pageTitle = document.getElementById('pageTitle');

                                                      // Cacher toutes les sections
                                                      creneauxSection.classList.add('hidden');
                                                      expertisesSection.classList.add('hidden');
                                                      statistiquesSection.classList.add('hidden');

                                                      // Afficher la section demandée
                                                      if (section === 'creneaux') {
                                                          creneauxSection.classList.remove('hidden');
                                                          pageTitle.textContent = 'Mes Créneaux de Consultation';
                                                      } else if (section === 'expertises') {
                                                          expertisesSection.classList.remove('hidden');
                                                          pageTitle.textContent = 'Demandes d\'Expertise';
                                                      } else if (section === 'statistiques') {
                                                          statistiquesSection.classList.remove('hidden');
                                                          pageTitle.textContent = 'Statistiques';
                                                      }
                                                  }
                                              </script>
                                          </body>
                                          </html>