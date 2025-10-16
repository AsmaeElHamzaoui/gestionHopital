<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Télé-Expertise Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans">
    <header class="bg-white border-b border-gray-200 px-6 py-3 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-emerald-500 rounded flex items-center justify-center text-white font-bold">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
            </div>
            <div>
                <h1 class="text-lg font-semibold text-gray-900">Télé-Expertise Médicale</h1>
                <p class="text-xs text-gray-500">Maison Générale</p>
            </div>
        </div>
        <div class="flex items-center gap-3">
            <img src="/placeholder.svg?height=40&width=40" alt="Dr Martin Dubois" class="w-10 h-10 rounded-full">
            <span class="text-sm font-medium text-gray-700">Dr Martin Dubois</span>
            <button class="text-gray-400 hover:text-gray-600">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                </svg>
            </button>
        </div>
    </header>

    <div class="flex h-[calc(100vh-73px)]">
        <aside class="w-64 bg-gradient-to-b from-emerald-700 to-emerald-800 text-white p-4">
            <nav class="space-y-2">
                <a href="#" class="flex items-center gap-3 px-4 py-3 rounded-lg bg-emerald-600 hover:bg-emerald-600 transition-colors" onclick="showQueue()">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                    <span class="font-medium">File d'attente des patients</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-emerald-600 transition-colors" onclick="showConsultations()">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <span class="font-medium">Consultations</span>
                </a>
                <a href="#" class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-emerald-600 transition-colors" onclick="showExpertise()">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                    </svg>
                    <span class="font-medium">Demande expertise</span>
                </a>
            </nav>
        </aside>
        <main class="flex-1 p-6 overflow-auto">
            <div id="queue-section" class="block">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">File d'attente des patients</h2>
                </div>
                <div class="bg-white rounded-lg shadow-sm border border-gray-200">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h3 class="text-lg font-semibold text-gray-900">Patients en attente</h3>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-50 border-b border-gray-200">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Patient</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d'enregistrement</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Téléphone</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Priorité</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <c:forEach var="p" items="${patients}">
                                    <tr class="hover:bg-gray-50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 bg-emerald-500 rounded-full flex items-center justify-center text-white font-semibold">
                                                    ${p.prenom.charAt(0)}${p.nom.charAt(0)}
                                                </div>
                                                <div>
                                                    <div class="text-sm font-medium text-gray-900">${p.nom} ${p.prenom}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${p.dateEnregistrement}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${p.telephone}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                <c:choose>
                                                    <c:when test="${p.priorite == 'URGENTE'}">bg-red-100 text-red-800</c:when>
                                                    <c:when test="${p.priorite == 'NORMALE'}">bg-green-100 text-green-800</c:when>
                                                    <c:otherwise>bg-yellow-100 text-yellow-800</c:otherwise>
                                                </c:choose>">
                                                ${p.priorite}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <a href="consultations?action=newConsultation&patientId=${p.id}" class="px-4 py-2 bg-emerald-500 text-white text-sm font-medium rounded-lg hover:bg-emerald-600 transition-colors">
                                                Consulter
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="consultations-section" class="hidden">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Consultations</h2>
                </div>
                <div class="bg-white rounded-lg shadow-sm border border-gray-200">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h3 class="text-lg font-semibold text-gray-900">Liste des patients</h3>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-50 border-b border-gray-200">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Patient</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d'enregistrement</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Téléphone</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Priorité</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <c:forEach var="p" items="${patients}">
                                    <tr class="hover:bg-gray-50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 bg-emerald-500 rounded-full flex items-center justify-center text-white font-semibold">
                                                    ${p.prenom.charAt(0)}${p.nom.charAt(0)}
                                                </div>
                                                <div>
                                                    <div class="text-sm font-medium text-gray-900">${p.nom} ${p.prenom}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${p.dateEnregistrement}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${p.telephone}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                <c:choose>
                                                    <c:when test="${p.priorite == 'URGENTE'}">bg-red-100 text-red-800</c:when>
                                                    <c:when test="${p.priorite == 'NORMALE'}">bg-green-100 text-green-800</c:when>
                                                    <c:otherwise>bg-yellow-100 text-yellow-800</c:otherwise>
                                                </c:choose>">
                                                ${p.priorite}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <a href="consultations?action=list&patientId=${p.id}" class="px-4 py-2 bg-blue-500 text-white text-sm font-medium rounded-lg hover:bg-blue-600 transition-colors">
                                                Voir Consultation
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="expertise-section" class="hidden">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-semibold text-gray-900">Demandes d'expertise</h2>
                    <button onclick="openExpertiseModal()" class="px-4 py-2 bg-emerald-500 text-white text-sm font-medium rounded-lg hover:bg-emerald-600 transition-colors">
                        Demander expertise
                    </button>
                </div>
                <div class="bg-white rounded-lg shadow-sm border border-gray-200">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <h3 class="text-lg font-semibold text-gray-900">Liste des demandes d'expertise</h3>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-50 border-b border-gray-200">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Consultation-motif</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de demande</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Spécialité & spécialiste</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Priorité</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <c:forEach var="demande" items="${demandes}">
                                    <tr class="hover:bg-gray-50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${demande.consultation.motif}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">${demande.dateDemande}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-900">
                                                ${demande.specialite}
                                                <c:if test="${not empty demande.specialiste}">
                                                    - Dr. ${demande.specialiste.nom} ${demande.specialiste.prenom}
                                                </c:if>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                <c:choose>
                                                    <c:when test="${demande.statut == 'EN_ATTENTE'}">bg-yellow-100 text-yellow-800</c:when>
                                                    <c:when test="${demande.statut == 'TERMINEE'}">bg-green-100 text-green-800</c:when>
                                                    <c:otherwise>bg-gray-100 text-gray-800</c:otherwise>
                                                </c:choose>">
                                                ${demande.statut}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                                                <c:choose>
                                                    <c:when test="${demande.priorite == 1}">bg-red-100 text-red-800</c:when>
                                                    <c:when test="${demande.priorite == 2}">bg-orange-100 text-orange-800</c:when>
                                                    <c:when test="${demande.priorite == 3}">bg-green-100 text-green-800</c:when>
                                                    <c:otherwise>bg-blue-100 text-blue-800</c:otherwise>
                                                </c:choose>">
                                                <c:choose>
                                                    <c:when test="${demande.priorite == 1}">Urgente</c:when>
                                                    <c:when test="${demande.priorite == 2}">Élevée</c:when>
                                                    <c:when test="${demande.priorite == 3}">Normale</c:when>
                                                    <c:otherwise>Faible</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap flex gap-2">
                                            <button onclick='openExpertiseModal(${demande.id}, "${demande.consultation.id}", "${demande.question}", "${demande.priorite}", "${demande.specialite}", "${demande.specialiste != null ? demande.specialiste.id : ""}", "${demande.dateDemande}", "${demande.tarif != null ? demande.tarif : ""}")' class="px-3 py-1 bg-blue-500 text-white text-xs font-medium rounded-lg hover:bg-blue-600 transition-colors">
                                                Modifier
                                            </button>
                                            <form action="demande-expertise" method="post" onsubmit="return confirm('Voulez-vous vraiment supprimer cette demande ?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="${demande.id}">
                                                <button type="submit" class="px-3 py-1 bg-red-500 text-white text-xs font-medium rounded-lg hover:bg-red-600 transition-colors">
                                                    Supprimer
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Modal for requesting/editing expertise -->
    <div id="expertise-modal" class="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center hidden z-50">
        <div class="bg-white rounded-lg shadow-lg p-4 w-full max-w-3xl max-h-[80vh] overflow-y-auto">
            <h3 id="modal-title" class="text-lg font-bold text-gray-900 mb-4">Demande d'expertise</h3>

            <form action="demande-expertise" method="post" id="expertise-form" class="space-y-4">
                <input type="hidden" name="action" id="form-action" value="add">
                <input type="hidden" name="id" id="demande-id">

                <!-- Section 1: Consultation & Priorité -->
                <div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <!-- Consultation -->
                        <div>
                            <label for="consultation" class="block text-xs font-medium text-gray-700 mb-1">Consultation *</label>
                            <select id="consultation" name="consultation" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm" required>
                                <option value="">Sélectionner</option>
                                <c:forEach var="consultation" items="${consultations}">
                                    <option value="${consultation.id}">${consultation.motif}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Priorité -->
                        <div>
                            <label for="priorite" class="block text-xs font-medium text-gray-700 mb-1">Priorité</label>
                            <select id="priorite" name="priorite" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm" required>
                                 <option value="4">Urgente</option>
                                 <option value="2" selected>Normale</option>
                                 <option value="3">Non normale</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Section 2: Spécialité & Spécialiste -->
                <div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <!-- Spécialité -->
                        <div>
                            <label for="specialite" class="block text-xs font-medium text-gray-700 mb-1">Spécialité *</label>
                            <select id="specialite" name="specialite" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm" required>
                                <option value="">Sélectionner</option>
                                <option value="CARDIOLOGIE">Cardiologie</option>
                                <option value="PNEUMOLOGIE">Pneumologie</option>
                                <option value="NEUROLOGIE">Neurologie</option>
                                <option value="DERMATOLOGIE">Dermatologie</option>
                                <option value="GASTROENTEROLOGIE">Gastro-entérologie</option>
                                <option value="ENDOCRINOLOGIE">Endocrinologie</option>
                                <option value="PSYCHIATRIE">Psychiatrie</option>
                                <option value="NEPHROLOGIE">Néphrologie</option>
                                <option value="ORTHOPEDIE">Orthopédie</option>
                            </select>
                        </div>

                        <!-- Spécialiste -->
                        <div>
                            <label for="specialiste" class="block text-xs font-medium text-gray-700 mb-1">Spécialiste</label>
                            <select id="specialiste" name="specialiste" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm">
                                <option value="">Sélectionner</option>
                                <c:forEach var="specialiste" items="${specialistes}">
                                    <option value="${specialiste.id}" data-specialite="${specialiste.specialite}">
                                        Dr. ${specialiste.nom} ${specialiste.prenom} (${specialiste.specialite})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Section 3: Tarif -->
                <div>
                    <div class="hidden grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label for="tarif" class="block text-xs font-medium text-gray-700 mb-1">Tarif (€)</label>
                            <input type="number" id="tarif" name="tarif" step="0.01" min="0"
                                   class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm"
                                   placeholder="0.00">
                            <p class="text-xs text-gray-500 mt-0.5">Optionnel</p>
                        </div>
                    </div>
                </div>

                <!-- Date de demande -->
                <div>
                    <label for="dateDemande" class="block text-xs font-medium text-gray-700 mb-1">Date de demande</label>
                    <select id="dateDemande" name="dateDemande" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm">
                        <option value="">Sélectionner</option>
                        <c:forEach var="creneau" items="${creneaux}">
                         <option
                             value="${creneau.dateJourActuelle}T${creneau.heureDebut}"
                             data-specialiste="${creneau.idSpecialiste}">
                             ${creneau.dateJourActuelle} — ${creneau.heureDebut} - ${creneau.heureFin}
                         </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Section 4: Description -->
                <div>
                    <div>
                        <label for="question" class="block text-xs font-medium text-gray-700 mb-1">Question / Description *</label>
                        <textarea id="question" name="question" rows="3"
                                  class="w-full border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 py-1.5 px-2 border text-sm resize-none"
                                  placeholder="Décrivez la raison de la demande, symptômes, antécédents..." required></textarea>
                    </div>
                </div>

                <!-- Boutons d'action -->
                <div class="mt-4 flex justify-end gap-2 pt-4">
                    <button type="button" onclick="closeExpertiseModal()"
                            class="px-4 py-1.5 bg-gray-100 text-gray-700 text-xs font-medium rounded-md hover:bg-gray-200 transition-colors">
                        Annuler
                    </button>
                    <button type="submit" id="submit-btn"
                            class="px-4 py-1.5 bg-emerald-500 text-white text-xs font-medium rounded-md hover:bg-emerald-600 transition-colors">
                        Soumettre
                    </button>
                </div>
            </form>

        </div>
    </div>

    <script>
        function showQueue() {
            document.getElementById('queue-section').classList.remove('hidden');
            document.getElementById('consultations-section').classList.add('hidden');
            document.getElementById('expertise-section').classList.add('hidden');
        }

        function showConsultations() {
            document.getElementById('queue-section').classList.add('hidden');
            document.getElementById('consultations-section').classList.remove('hidden');
            document.getElementById('expertise-section').classList.add('hidden');
        }

        function showExpertise() {
            document.getElementById('queue-section').classList.add('hidden');
            document.getElementById('consultations-section').classList.add('hidden');
            document.getElementById('expertise-section').classList.remove('hidden');
        }

        function openExpertiseModal(id, consultationId, question, priorite, specialite, specialisteId, dateDemande, tarif) {
            const modal = document.getElementById('expertise-modal');
            const form = document.getElementById('expertise-form');
            const modalTitle = document.getElementById('modal-title');
            const formAction = document.getElementById('form-action');
            const demandeIdInput = document.getElementById('demande-id');
            const submitBtn = document.getElementById('submit-btn');

            // Reset form
            form.reset();

            if (id) {
                // Mode édition
                modalTitle.textContent = 'Modifier la demande d\'expertise';
                formAction.value = 'update';
                demandeIdInput.value = id;
                submitBtn.textContent = 'Mettre à jour';

                // Remplir les champs
                document.getElementById('consultation').value = consultationId;
                document.getElementById('question').value = question;
                document.getElementById('priorite').value = priorite;
                document.getElementById('specialite').value = specialite;

                // Déclencher l'événement change pour filtrer les spécialistes
                document.getElementById('specialite').dispatchEvent(new Event('change'));

                // Attendre un peu pour que les options soient filtrées
                setTimeout(() => {
                    if (specialisteId) {
                        document.getElementById('specialiste').value = specialisteId;
                        document.getElementById('specialiste').dispatchEvent(new Event('change'));
                    }

                    // Attendre encore pour que les créneaux soient filtrés
                    setTimeout(() => {
                        if (dateDemande && dateDemande !== 'null') {
                            // Extraire la date et l'heure du format ISO
                            const dateTimeMatch = dateDemande.match(/(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2})/);
                            if (dateTimeMatch) {
                                const formattedDateTime = dateTimeMatch[1] + 'T' + dateTimeMatch[2];
                                document.getElementById('dateDemande').value = formattedDateTime;
                            }
                        }
                    }, 100);
                }, 100);

                if (tarif && tarif !== 'null') {
                    document.getElementById('tarif').value = tarif;
                }
            } else {
                // Mode ajout
                modalTitle.textContent = 'Demande d\'expertise';
                formAction.value = 'add';
                demandeIdInput.value = '';
                submitBtn.textContent = 'Soumettre';
            }

            modal.classList.remove('hidden');
        }

        function closeExpertiseModal() {
            document.getElementById('expertise-modal').classList.add('hidden');
            document.getElementById('expertise-form').reset();
        }

        // Filtrer les spécialistes en fonction de la spécialité
        const selectSpecialite = document.getElementById('specialite');
        const selectSpecialiste = document.getElementById('specialiste');
        const selectCreneau = document.getElementById('dateDemande');

        // Stocker toutes les options de base pour les spécialistes
        const allSpecialisteOptions = Array.from(selectSpecialiste.options);

        selectSpecialite.addEventListener('change', () => {
            const selectedSpec = selectSpecialite.value;

            // Vider la liste des spécialistes
            selectSpecialiste.innerHTML = '';

            // Ajouter l'option par défaut
            const defaultSpecialisteOption = document.createElement('option');
            defaultSpecialisteOption.value = '';
            defaultSpecialisteOption.textContent = 'Sélectionner';
            selectSpecialiste.appendChild(defaultSpecialisteOption);

            // Réafficher toutes les options si aucune spécialité n'est choisie
            if (!selectedSpec) {
                allSpecialisteOptions.forEach(opt => {
                    if (opt.value !== '') {
                        selectSpecialiste.appendChild(opt.cloneNode(true));
                    }
                });
            } else {
                // Filtrer les spécialistes selon la spécialité choisie
                allSpecialisteOptions.forEach(opt => {
                    if (opt.dataset.specialite === selectedSpec) {
                        selectSpecialiste.appendChild(opt.cloneNode(true));
                    }
                });
            }

            // Réinitialiser les créneaux
            selectCreneau.value = '';
            updateCreneaux();
        });

        // Stocker toutes les options de base pour les créneaux
        const allCreneauOptions = Array.from(selectCreneau.options);

        // Filtrer les créneaux en fonction du spécialiste
        selectSpecialiste.addEventListener('change', updateCreneaux);

        function updateCreneaux() {
            const selectedSpecialiste = selectSpecialiste.value;

            // Vider la liste des créneaux
            selectCreneau.innerHTML = '';

            // Ajouter l'option par défaut
            const defaultCreneauOption = document.createElement('option');
            defaultCreneauOption.value = '';
            defaultCreneauOption.textContent = 'Sélectionner';
            selectCreneau.appendChild(defaultCreneauOption);

            // Réafficher tous les créneaux si aucun spécialiste n'est choisi
            if (!selectedSpecialiste) {
                allCreneauOptions.forEach(opt => {
                    if (opt.value !== '') {
                        selectCreneau.appendChild(opt.cloneNode(true));
                    }
                });
            } else {
                // Filtrer les créneaux selon le spécialiste choisi
                allCreneauOptions.forEach(opt => {
                    if (opt.dataset.specialiste === selectedSpecialiste) {
                        selectCreneau.appendChild(opt.cloneNode(true));
                    }
                });
            }
        }
    </script>
</body>
</html>