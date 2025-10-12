<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interface Infirmier - Gestion des patients</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

    <!-- HEADER -->
    <header class="bg-white border-b border-gray-200 px-6 py-3 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-emerald-500 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
            </div>
            <div>
                <h1 class="text-lg font-semibold text-gray-900">Interface Infirmier</h1>
                <p class="text-sm text-gray-500">Gestion des patients</p>
            </div>
        </div>
        <div class="flex items-center gap-3">
            <img src="https://ui-avatars.com/api/?name=Marie+Dubois&background=6366f1&color=fff" alt="Marie Dubois" class="w-9 h-9 rounded-full">
            <span class="text-sm font-medium text-gray-700">Marie Dubois</span>
            <button class="text-gray-400 hover:text-gray-600">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                </svg>
            </button>
        </div>
    </header>

    <div class="flex">
        <!-- SIDEBAR -->
        <aside class="w-64 bg-white border-r border-gray-200 min-h-screen p-4">
            <nav class="space-y-2">
                <button onclick="showPatientList()" id="btnAccueil" class="w-full flex items-center gap-3 px-4 py-3 text-white bg-emerald-500 rounded-lg font-medium">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    Liste Patient
                </button>
                <button class="w-full flex items-center gap-3 px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-lg font-medium">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    File d'attente
                </button>
            </nav>
        </aside>

        <!-- MAIN -->
        <main class="flex-1 p-6">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-900" id="pageTitle">Liste des Patients</h2>
                <div class="flex gap-3">
                    <button onclick="showRegistrationForm()" class="flex items-center gap-2 px-4 py-2 bg-emerald-500 text-white rounded-lg font-medium hover:bg-emerald-600 transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                        </svg>
                        Ajouter Patient
                    </button>
                    <button onclick="showVitalSignsForm()" class="flex items-center gap-2 px-4 py-2 bg-blue-500 text-white rounded-lg font-medium hover:bg-blue-600 transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                        Ajouter Signes Vitaux
                    </button>
                </div>
            </div>

            <!-- TABLE PATIENTS -->
            <div id="patientListView" class="bg-white rounded-lg shadow-sm">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b border-gray-200">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de naissance</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Numéro de sécurité</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Téléphone</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Adresse</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date Enreg.</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="p" items="${patients}">
                                <tr>
                                    <td class="hidden">${p.id}</td>
                                    <td>${p.nom}</td>
                                    <td>${p.prenom}</td>
                                    <td>${p.dateNaissance}</td>
                                    <td>${p.numSecu}</td>
                                    <td>${p.telephone}</td>
                                    <td>${p.adresse}</td>
                                    <td>${p.dateEnregistrement}</td>
                                    <td>${p.statut}</td>
                                    <td class="text-sm text-emerald-600 font-medium">
                                        <a href="javascript:void(0)" onclick="showRegistrationForm(${p.id})" class="hover:underline">Modifier</a> |
                                        <a href="patients?action=delete&id=${p.id}" class="hover:underline text-red-500">Supprimer</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

             <div id="registrationFormView" class="hidden">
                 <jsp:include page="../patients/form.jsp" />
             </div>

             <div id="vitalSignsFormView" class="hidden">
                 <jsp:include page="../signes-vitaux/form.jsp" />
             </div>
        </main>
    </div>

    <!-- JS -->
    <script>
    function showRegistrationForm(patientId = null) {
        document.getElementById('patientListView').classList.add('hidden');
        document.getElementById('registrationFormView').classList.remove('hidden');
        document.getElementById('vitalSignsFormView').classList.add('hidden');

        if (patientId) {
            // Mode modification - charger les données du patient
            document.getElementById('pageTitle').textContent = 'Modifier Patient';
            // Ici vous devrez charger les données via AJAX ou recharger la page
            window.location.href = 'patients?action=edit&id=' + patientId;
        } else {
            // Mode ajout
            document.getElementById('pageTitle').textContent = 'Ajouter Patient';
        }
    }

    function showVitalSignsForm(patientId = null) {
        document.getElementById('patientListView').classList.add('hidden');
        document.getElementById('registrationFormView').classList.add('hidden');
        document.getElementById('vitalSignsFormView').classList.remove('hidden');

        if (patientId) {
            // Mode modification
            document.getElementById('pageTitle').textContent = 'Modifier Signes Vitaux';
        } else {
            // Mode ajout
            document.getElementById('pageTitle').textContent = 'Ajouter Signes Vitaux';

            // Définir la date du jour par défaut
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('dateMesure').value = today;
        }
    }
    </script>

    <style>
        @keyframes slideIn {
            0% { opacity: 0; transform: scale(0.95); }
            100% { opacity: 1; transform: scale(1); }
        }
        .animate-slide-in {
            animation: slideIn 0.4s ease-in-out;
        }
    </style>
</body>
</html>