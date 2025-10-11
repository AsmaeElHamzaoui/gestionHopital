<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hôpital - Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="font-sans bg-gray-100">
    <!-- Header -->
    <header class="bg-teal-600 text-white sticky top-0 z-50 shadow-md p-4 flex justify-between items-center">
        <div class="flex items-center space-x-4">
            <button class="md:hidden text-white focus:outline-none" onclick="toggleSidebar()">
                <i class="fas fa-bars text-xl"></i>
            </button>
            <div class="text-2xl font-bold">Télé-Expertise Médicale</div>
        </div>
        <div class="flex items-center space-x-4">
            <div class="flex items-center" id="userProfile">
                <img src="https://via.placeholder.com/40" alt="Profile" class="rounded-full mr-2" id="profilePic">
                <span id="userName" class="text-sm"></span>
            </div>
            <button onclick="logout()" class="bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300 flex items-center">
                <i class="fas fa-sign-out-alt mr-2"></i> Déconnexion
            </button>
        </div>
    </header>

    <!-- Login Modal -->
    <div id="loginModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
        <div class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full animate-slide-in">
            <h2 class="text-2xl font-bold text-teal-600 mb-6 text-center">Connexion</h2>
            <div>
                <div class="mb-4">
                    <label for="email" class="block text-gray-700 font-semibold mb-2">Email</label>
                    <input type="email" id="email" name="email" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Entrez votre email" required>
                </div>
                <div class="mb-6">
                    <label for="password" class="block text-gray-700 font-semibold mb-2">Mot de passe</label>
                    <input type="password" id="password" name="password" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Entrez votre mot de passe" required>
                </div>
                <button onclick="simulateLogin()" class="w-full bg-teal-500 text-white py-2 rounded-lg hover:bg-teal-400 transition duration-300">Se connecter</button>
                <button onclick="closeModal()" class="w-full mt-4 text-teal-600 hover:text-teal-800 transition duration-300">Annuler</button>
            </div>
        </div>
    </div>

    <!-- Main Layout with Sidebar -->
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside class="bg-gray-800 text-white w-64 min-h-screen p-4 fixed top-16 bottom-0 shadow-lg transform -translate-x-full transition-transform duration-300 ease-in-out md:translate-x-0 z-40" id="sidebar">
            <nav class="mt-6">
                <ul id="sidebarMenu" class="space-y-2">
                    <!-- Menu dynamique inséré via JavaScript -->
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 ml-0 md:ml-64 p-6 transition-all duration-300">
            <div class="container mx-auto bg-white rounded-lg shadow-lg p-6">
                <div id="dashboardContent" class="hidden">
                    <h1 class="text-3xl font-bold text-teal-600 mb-6 animate-fade-in-down" id="dashboardTitle"></h1>
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6" id="dashboardBody">
                        <!-- Contenu dynamique inséré via JavaScript -->
                    </div>
                </div>
            </div>
        </main>
    </div>

    <style>
        /* Animations personnalisées */
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideIn {
            0% { opacity: 0; transform: scale(0.8); }
            100% { opacity: 1; transform: scale(1); }
        }
        .animate-fade-in-down {
            animation: fadeInDown 1s ease-in-out;
        }
        .animate-fade-in-up {
            animation: fadeInUp 1s ease-in-out 0.3s both;
        }
        .animate-slide-in {
            animation: slideIn 0.3s ease-in-out;
        }
        .sidebar-link-active {
            background-color: #1e293b;
            border-left: 4px solid #10b981;
        }
    </style>

    <script>
        // Simuler la connexion
        function simulateLogin() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            let user = null;
            if (email === "infirmier@hopital.fr" && password === "123") {
                user = { name: "Dr. Sophie Martin", role: "INFIRMIER", photo: "https://via.placeholder.com/40" };
            } else if (email === "specialiste@hopital.fr" && password === "123") {
                user = { name: "Dr. Julien Lefèvre", role: "SPECIALISTE", photo: "https://via.placeholder.com/40" };
            } else if (email === "generaliste@hopital.fr" && password === "123") {
                user = { name: "Dr. Martin Dubois", role: "GENERALISTE", photo: "https://via.placeholder.com/40" };
            }

            if (user) {
                sessionStorage.setItem('user', JSON.stringify(user));
                sessionStorage.setItem('userRole', user.role);
                document.getElementById('userName').textContent = user.name;
                document.getElementById('profilePic').src = user.photo;
                closeModal();
                loadDashboard(user.role);
            } else {
                alert("Email ou mot de passe incorrect");
            }
        }

        function openModal() {
            document.getElementById('loginModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('loginModal').classList.add('hidden');
            document.getElementById('sidebar').classList.add('-translate-x-full');
        }

        function logout() {
            sessionStorage.removeItem('user');
            sessionStorage.removeItem('userRole');
            document.getElementById('dashboardContent').classList.add('hidden');
            document.getElementById('userName').textContent = '';
            document.getElementById('profilePic').src = "https://via.placeholder.com/40";
            openModal();
        }

        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('-translate-x-full');
        }

        function setActiveLink(section) {
            const links = document.querySelectorAll('#sidebarMenu a');
            links.forEach(link => {
                link.classList.remove('sidebar-link-active');
                if (link.getAttribute('onclick').includes(section)) {
                    link.classList.add('sidebar-link-active');
                }
            });
        }

        function loadDashboard(role) {
            const dashboardContent = document.getElementById('dashboardContent');
            const dashboardTitle = document.getElementById('dashboardTitle');
            const sidebarMenu = document.getElementById('sidebarMenu');

            dashboardContent.classList.remove('hidden');

            if (role === 'INFIRMIER') {
                dashboardTitle.textContent = 'Tableau de bord - Infirmier';
                sidebarMenu.innerHTML = `
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300 sidebar-link-active" onclick="showSection('patients', this)">Patients en Attente</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('tasks', this)">Tâches en Cours</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('reports', this)">Rapports</a></li>
                `;
                showSection('patients');
            } else if (role === 'SPECIALISTE') {
                dashboardTitle.textContent = 'Tableau de bord - Spécialiste';
                sidebarMenu.innerHTML = `
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300 sidebar-link-active" onclick="showSection('consultations', this)">Consultations</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('records', this)">Dossiers Patients</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('analyses', this)">Analyses</a></li>
                `;
                showSection('consultations');
            } else if (role === 'GENERALISTE') {
                dashboardTitle.textContent = 'Tableau de bord - Généraliste';
                sidebarMenu.innerHTML = `
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300 sidebar-link-active" onclick="showSection('waiting', this)">File d'Attente</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('consultations', this)">Consultations</a></li>
                    <li><a href="#" class="block p-3 rounded hover:bg-gray-700 transition duration-300" onclick="showSection('stats', this)">Statistiques</a></li>
                `;
                showSection('waiting');
            }
        }

        function showSection(section, element) {
            const dashboardBody = document.getElementById('dashboardBody');
            const role = sessionStorage.getItem('userRole');
            setActiveLink(section);

            if (role === 'INFIRMIER') {
                if (section === 'patients') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Patients en Attente</h2>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm text-gray-600">12 patients</span>
                                <button class="bg-green-500 text-white px-2 py-1 rounded hover:bg-green-400 transition duration-300">Actualiser</button>
                            </div>
                            <table class="w-full text-gray-700">
                                <thead>
                                    <tr class="border-b">
                                        <th class="py-2 text-left">Patient</th>
                                        <th class="py-2 text-left">Heure d'Arrivée</th>
                                        <th class="py-2 text-left">Signes Vitaux</th>
                                        <th class="py-2 text-left">Priorité</th>
                                        <th class="py-2 text-left">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="border-b">
                                        <td class="py-2">Marie Rousseau</td>
                                        <td class="py-2">08:30</td>
                                        <td class="py-2">TA: 120/80 mmHg, FC: 72 bpm</td>
                                        <td class="py-2 text-yellow-500">Normale</td>
                                        <td class="py-2"><button class="text-teal-500 hover:text-teal-700">Consulter</button></td>
                                    </tr>
                                    <tr class="border-b">
                                        <td class="py-2">Pierre Durand</td>
                                        <td class="py-2">08:45</td>
                                        <td class="py-2">TA: 140/90 mmHg, FC: 85 bpm</td>
                                        <td class="py-2 text-red-500">Urgente</td>
                                        <td class="py-2"><button class="text-teal-500 hover:text-teal-700">Consulter</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up" id="patientDetails">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Informations Patient</h2>
                            <div class="flex flex-col md:flex-row gap-4">
                                <div class="w-full md:w-1/3 bg-teal-50 p-4 rounded-lg">
                                    <img src="https://via.placeholder.com/100" alt="Photo Patient" class="rounded-full mb-2">
                                    <h3 class="text-lg font-medium text-teal-700">Marie Rousseau</h3>
                                    <p class="text-gray-600">45 ans, Femme</p>
                                    <p class="text-gray-600">Numéro: 89</p>
                                    <p class="text-gray-600">Tél: 1 85 07 75 123 456 78</p>
                                    <p class="text-gray-600">Tél: 06 12 34 56 78</p>
                                    <div class="mt-2">
                                        <p class="text-gray-600">Signes vitaux:</p>
                                        <p>TA: 120/80 mmHg</p>
                                        <p>FC: 72 bpm</p>
                                        <p>Temp: 36.8°C</p>
                                    </div>
                                </div>
                                <div class="w-full md:w-2/3 bg-teal-50 p-4 rounded-lg">
                                    <h3 class="text-lg font-medium text-teal-700">Consultation Médicale</h3>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" placeholder="Motif de consultation..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" placeholder="Notes d'examen clinique..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" placeholder="Symptômes observés par le patient..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" placeholder="Symptômes rapportés par le patient..."></textarea>
                                    <div class="flex flex-col md:flex-row gap-2">
                                        <input type="text" class="w-full md:w-1/2 p-2 border rounded-lg" placeholder="Diagnostic établi">
                                        <input type="text" class="w-full md:w-1/2 p-2 border rounded-lg" placeholder="Coût consultation">
                                    </div>
                                    <textarea class="w-full p-2 border rounded-lg mt-2" placeholder="Médicaments prescrits..."></textarea>
                                    <div class="mt-4 flex justify-between">
                                        <button class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400 transition duration-300">Clôturer Consultation</button>
                                        <button class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-400 transition duration-300">Demander Avis Spécialiste</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                } else if (section === 'tasks') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Tâches en Cours</h2>
                            <ul class="space-y-2">
                                <li class="text-gray-700">Contrôle des signes vitaux - Patient 1</li>
                                <li class="text-gray-700">Administration de médicaments - Patient 2</li>
                            </ul>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Ajouter une Tâche</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Détails des Tâches</h2>
                            <p class="text-gray-600">Sélectionnez une tâche pour plus de détails...</p>
                        </div>
                    `;
                } else if (section === 'reports') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Rapports d'Incidents</h2>
                            <button class="bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Nouveau Rapport</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Formulaire de Rapport</h2>
                            <textarea class="w-full p-2 border rounded-lg mb-2" placeholder="Décrivez l'incident..."></textarea>
                            <button class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400 transition duration-300">Envoyer</button>
                        </div>
                    `;
                }
            } else if (role === 'SPECIALISTE') {
                if (section === 'consultations') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Consultations Programmées</h2>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm text-gray-600">5 consultations</span>
                                <button class="bg-green-500 text-white px-2 py-1 rounded hover:bg-green-400 transition duration-300">Actualiser</button>
                            </div>
                            <ul class="space-y-2">
                                <li class="text-gray-700">Cardiologie - Patient A - 14h00</li>
                                <li class="text-gray-700">Neurologie - Patient B - 16h00</li>
                            </ul>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Voir l'agenda</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up" id="consultationDetails">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Détails de la Consultation</h2>
                            <p class="text-gray-600">Sélectionnez une consultation pour plus de détails...</p>
                        </div>
                    `;
                } else if (section === 'records') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Dossiers Patients</h2>
                            <select class="w-full p-2 border rounded-lg mt-2">
                                <option>Patient A</option>
                                <option>Patient B</option>
                            </select>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Ouvrir le Dossier</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Détails du Dossier</h2>
                            <p class="text-gray-600">Sélectionnez un patient pour voir les détails...</p>
                        </div>
                    `;
                } else if (section === 'analyses') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Analyses Médicales</h2>
                            <select class="w-full p-2 border rounded-lg mt-2">
                                <option>Analyse 1</option>
                                <option>Analyse 2</option>
                            </select>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Voir les Résultats</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Résultats des Analyses</h2>
                            <canvas id="analysisChart" class="mt-4"></canvas>
                        </div>
                    `;
                    new Chart(document.getElementById('analysisChart'), {
                        type: 'bar',
                        data: {
                            labels: ['Analyse 1', 'Analyse 2', 'Analyse 3'],
                            datasets: [{
                                label: 'Résultats',
                                data: [10, 20, 15],
                                backgroundColor: 'rgba(13, 148, 136, 0.6)',
                                borderColor: 'rgba(13, 148, 136, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: { scales: { y: { beginAtZero: true } } }
                    });
                }
            } else if (role === 'GENERALISTE') {
                if (section === 'waiting') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">File d'Attente des Patients</h2>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm text-gray-600">12 patients</span>
                                <button class="bg-green-500 text-white px-2 py-1 rounded hover:bg-green-400 transition duration-300">Actualiser</button>
                            </div>
                            <table class="w-full text-gray-700">
                                <thead>
                                    <tr class="border-b">
                                        <th class="py-2 text-left">Patient</th>
                                        <th class="py-2 text-left">Heure d'Arrivée</th>
                                        <th class="py-2 text-left">Signes Vitaux</th>
                                        <th class="py-2 text-left">Priorité</th>
                                        <th class="py-2 text-left">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="border-b">
                                        <td class="py-2">Marie Rousseau</td>
                                        <td class="py-2">08:30</td>
                                        <td class="py-2">TA: 120/80 mmHg, FC: 72 bpm</td>
                                        <td class="py-2 text-yellow-500">Normale</td>
                                        <td class="py-2"><button class="text-teal-500 hover:text-teal-700" onclick="showPatientDetails('Marie Rousseau')">Consulter</button></td>
                                    </tr>
                                    <tr class="border-b">
                                        <td class="py-2">Pierre Durand</td>
                                        <td class="py-2">08:45</td>
                                        <td class="py-2">TA: 140/90 mmHg, FC: 85 bpm</td>
                                        <td class="py-2 text-red-500">Urgente</td>
                                        <td class="py-2"><button class="text-teal-500 hover:text-teal-700" onclick="showPatientDetails('Pierre Durand')">Consulter</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up" id="patientDetails">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Informations Patient</h2>
                            <div class="flex flex-col md:flex-row gap-4">
                                <div class="w-full md:w-1/3 bg-teal-50 p-4 rounded-lg">
                                    <img src="https://via.placeholder.com/100" alt="Photo Patient" class="rounded-full mb-2">
                                    <h3 class="text-lg font-medium text-teal-700" id="patientName"></h3>
                                    <p class="text-gray-600" id="patientInfo"></p>
                                    <p class="text-gray-600" id="patientPhone"></p>
                                    <div class="mt-2">
                                        <p class="text-gray-600">Signes vitaux:</p>
                                        <p id="vital1"></p>
                                        <p id="vital2"></p>
                                        <p id="vital3"></p>
                                    </div>
                                </div>
                                <div class="w-full md:w-2/3 bg-teal-50 p-4 rounded-lg">
                                    <h3 class="text-lg font-medium text-teal-700">Consultation Médicale</h3>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" id="consultationReason" placeholder="Motif de consultation..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" id="clinicalNotes" placeholder="Notes d'examen clinique..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" id="observedSymptoms" placeholder="Symptômes observés par le patient..."></textarea>
                                    <textarea class="w-full p-2 border rounded-lg mb-2" id="reportedSymptoms" placeholder="Symptômes rapportés par le patient..."></textarea>
                                    <div class="flex flex-col md:flex-row gap-2">
                                        <input type="text" class="w-full md:w-1/2 p-2 border rounded-lg" id="diagnosis" placeholder="Diagnostic établi">
                                        <input type="text" class="w-full md:w-1/2 p-2 border rounded-lg" id="consultationCost" placeholder="Coût consultation">
                                    </div>
                                    <textarea class="w-full p-2 border rounded-lg mt-2" id="prescription" placeholder="Médicaments prescrits..."></textarea>
                                    <div class="mt-4 flex justify-between">
                                        <button class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-400 transition duration-300" onclick="saveConsultation()">Clôturer Consultation</button>
                                        <button class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-400 transition duration-300">Demander Avis Spécialiste</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                } else if (section === 'consultations') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Consultations Terminées</h2>
                            <ul class="space-y-2">
                                <li class="text-gray-700">Marie Rousseau - 08:30</li>
                                <li class="text-gray-700">Pierre Durand - 08:45</li>
                            </ul>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Voir toutes les consultations</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Détails de la Consultation</h2>
                            <p class="text-gray-600">Sélectionnez une consultation pour plus de détails...</p>
                        </div>
                    `;
                } else if (section === 'stats') {
                    dashboardBody.innerHTML = `
                        <div class="lg:col-span-1 bg-teal-50 p-4 rounded-lg shadow-md">
                            <h2 class="text-xl font-semibold text-teal-700 mb-2">Statistiques</h2>
                            <select class="w-full p-2 border rounded-lg mt-2">
                                <option>Semaine</option>
                                <option>Mois</option>
                            </select>
                            <button class="mt-4 bg-teal-500 text-white px-4 py-2 rounded-lg hover:bg-teal-400 transition duration-300">Générer</button>
                        </div>
                        <div class="lg:col-span-2 bg-white p-4 rounded-lg shadow-md animate-fade-in-up">
                            <h2 class="text-xl font-semibold text-teal-600 mb-4">Graphique des Statistiques</h2>
                            <canvas id="statsChart" class="mt-4"></canvas>
                        </div>
                    `;
                    new Chart(document.getElementById('statsChart'), {
                        type: 'pie',
                        data: {
                            labels: ['Consultations', 'Urgences', 'Suivis'],
                            datasets: [{
                                data: [50, 20, 30],
                                backgroundColor: ['rgba(13, 148, 136, 0.6)', 'rgba(239, 68, 68, 0.6)', 'rgba(59, 130, 246, 0.6)'],
                                borderColor: ['rgba(13, 148, 136, 1)', 'rgba(239, 68, 68, 1)', 'rgba(59, 130, 246, 1)'],
                                borderWidth: 1
                            }]
                        }
                    });
                }
            }
            document.getElementById('sidebar').classList.add('-translate-x-full'); // Ferme la sidebar sur mobile après sélection
        }

        function showPatientDetails(patientName) {
            const details = document.getElementById('patientDetails');
            if (patientName === 'Marie Rousseau') {
                document.getElementById('patientName').textContent = 'Marie Rousseau';
                document.getElementById('patientInfo').textContent = '45 ans, Femme';
                document.getElementById('patientPhone').textContent = 'Tél: 1 85 07 75 123 456 78';
                document.getElementById('vital1').textContent = 'TA: 120/80 mmHg';
                document.getElementById('vital2').textContent = 'FC: 72 bpm';
                document.getElementById('vital3').textContent = 'Temp: 36.8°C';
            } else if (patientName === 'Pierre Durand') {
                document.getElementById('patientName').textContent = 'Pierre Durand';
                document.getElementById('patientInfo').textContent = '52 ans, Homme';
                document.getElementById('patientPhone').textContent = 'Tél: 1 75 12 34 567 89';
                document.getElementById('vital1').textContent = 'TA: 140/90 mmHg';
                document.getElementById('vital2').textContent = 'FC: 85 bpm';
                document.getElementById('vital3').textContent = 'Temp: 37.2°C';
            }
            details.classList.remove('hidden');
        }

        function saveConsultation() {
            alert('Consultation clôturée avec succès !');
            document.getElementById('consultationReason').value = '';
            document.getElementById('clinicalNotes').value = '';
            document.getElementById('observedSymptoms').value = '';
            document.getElementById('reportedSymptoms').value = '';
            document.getElementById('diagnosis').value = '';
            document.getElementById('consultationCost').value = '';
            document.getElementById('prescription').value = '';
        }

        // Vérifier si un utilisateur est connecté au chargement de la page
        window.onload = function() {
            const user = sessionStorage.getItem('user');
            const userRole = sessionStorage.getItem('userRole');
            if (user && userRole) {
                const userData = JSON.parse(user);
                document.getElementById('userName').textContent = userData.name;
                document.getElementById('profilePic').src = userData.photo;
                loadDashboard(userRole);
            } else {
                openModal();
            }
        };
    </script>
</body>
</html>