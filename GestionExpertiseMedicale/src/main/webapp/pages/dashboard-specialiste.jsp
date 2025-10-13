<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    Profil
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
            <div class="grid grid-cols-4 gap-4 mb-6">
                <div class="bg-white rounded-lg p-4 border border-gray-200">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-sm text-gray-600">Créneaux Disponibles</p>
                        <div class="w-8 h-8 bg-teal-100 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                            </svg>
                        </div>
                    </div>
                    <p class="text-3xl font-bold text-gray-900">8</p>
                </div>

                <div class="bg-white rounded-lg p-4 border border-gray-200">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-sm text-gray-600">Demandes en Attente</p>
                        <div class="w-8 h-8 bg-orange-100 rounded-lg flex items-center justify-center">
                            <span class="w-2 h-2 bg-orange-500 rounded-full"></span>
                        </div>
                    </div>
                    <p class="text-3xl font-bold text-gray-900">3</p>
                </div>

                <div class="bg-white rounded-lg p-4 border border-gray-200">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-sm text-gray-600">Expertises Terminées</p>
                        <div class="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                            </svg>
                        </div>
                    </div>
                    <p class="text-3xl font-bold text-gray-900">24</p>
                </div>

                <div class="bg-white rounded-lg p-4 border border-gray-200">
                    <div class="flex items-center justify-between mb-2">
                        <p class="text-sm text-gray-600">Tarif/Consultation</p>
                        <div class="w-8 h-8 bg-green-100 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                    </div>
                    <p class="text-3xl font-bold text-gray-900">250 DH</p>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-6">
                <div class="bg-white rounded-lg border border-gray-200 p-6">
                    <div class="flex items-center justify-between mb-4">
                        <div>
                            <h2 class="text-lg font-semibold text-gray-900">Planning d'Aujourd'hui</h2>
                            <p class="text-sm text-gray-500">Mardi 15 Octobre 2024</p>
                        </div>
                    </div>

                    <div class="space-y-3">
                        <div class="flex items-center justify-between p-3 bg-teal-50 border border-teal-200 rounded-lg">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-2 bg-teal-500 rounded-full"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">09:00 - 09:30</p>
                                    <p class="text-xs text-gray-600">Disponible</p>
                                </div>
                            </div>
                            <span class="text-xs font-medium text-teal-700 bg-teal-100 px-2 py-1 rounded">Libre</span>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-red-50 border border-red-200 rounded-lg">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-2 bg-red-500 rounded-full"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">09:30 - 10:00</p>
                                    <p class="text-xs text-gray-600">Expertise - Patient Benali</p>
                                </div>
                            </div>
                            <span class="text-xs font-medium text-red-700 bg-red-100 px-2 py-1 rounded">Réservé</span>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-teal-50 border border-teal-200 rounded-lg">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-2 bg-teal-500 rounded-full"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">10:00 - 10:30</p>
                                    <p class="text-xs text-gray-600">Disponible</p>
                                </div>
                            </div>
                            <span class="text-xs font-medium text-teal-700 bg-teal-100 px-2 py-1 rounded">Libre</span>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-yellow-50 border border-yellow-200 rounded-lg">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-2 bg-yellow-500 rounded-full"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">10:30 - 11:00</p>
                                    <p class="text-xs text-gray-600">En attente confirmation</p>
                                </div>
                            </div>
                            <span class="text-xs font-medium text-yellow-700 bg-yellow-100 px-2 py-1 rounded">Attente</span>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-teal-50 border border-teal-200 rounded-lg">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-2 bg-teal-500 rounded-full"></div>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">11:00 - 11:30</p>
                                    <p class="text-xs text-gray-600">Disponible</p>
                                </div>
                            </div>
                            <span class="text-xs font-medium text-teal-700 bg-teal-100 px-2 py-1 rounded">Libre</span>
                        </div>
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
                                <span class="text-xs font-semibold text-white bg-red-500 px-2 py-1 rounded">URGENTE</span>
                                <span class="text-xs text-gray-500">il y a 2h</span>
                            </div>
                            <h3 class="font-semibold text-gray-900 mb-2">Patient: Ahmed Benali</h3>
                            <p class="text-sm text-gray-600 mb-3">Douleurs thoraciques persistantes avec dyspnée d'effort. ECG anormal.</p>
                            <div class="flex items-center justify-between">
                                <p class="text-xs text-gray-500">Dr. Alami (Généraliste)</p>
                                <button class="bg-teal-600 hover:bg-teal-700 text-white text-sm font-medium px-4 py-2 rounded-lg">
                                    Répondre
                                </button>
                            </div>
                        </div>
                        <div class="bg-white rounded-lg border border-gray-200 p-4">
                            <div class="flex items-start justify-between mb-3">
                                <span class="text-xs font-semibold text-white bg-orange-500 px-2 py-1 rounded">NORMALE</span>
                                <span class="text-xs text-gray-500">il y a 4h</span>
                            </div>
                            <h3 class="font-semibold text-gray-900 mb-2">Patient: Fatima Zahra</h3>
                            <p class="text-sm text-gray-600 mb-3">Hypertension artérielle non contrôlée malgré traitement.</p>
                            <div class="flex items-center justify-between">
                                <p class="text-xs text-gray-500">Dr. Bennani (Généraliste)</p>
                                <button class="bg-teal-600 hover:bg-teal-700 text-white text-sm font-medium px-4 py-2 rounded-lg">
                                    Répondre
                                </button>
                            </div>
                        </div>
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
</body>
</html>