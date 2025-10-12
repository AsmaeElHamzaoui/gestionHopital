<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-6">
    <div class="max-w-7xl mx-auto bg-white rounded-lg shadow-sm p-6">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

            <div class="space-y-4">
                <h2 class="text-lg font-semibold text-gray-800 mb-4">Informations patient</h2>

                 Patient Profile
                <div class="flex items-start gap-3 mb-6">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop"
                         alt="Marie Rousseau"
                         class="w-12 h-12 rounded-full object-cover">
                    <div>
                        <h3 class="font-semibold text-gray-900">Marie Rousseau</h3>
                        <p class="text-sm text-gray-600">45 ans • Femme</p>
                    </div>
                </div>

                 Patient Details
                <div class="space-y-3">
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Numéro SS</span>
                        <span class="text-sm font-medium text-gray-900">1 85 07 75 123 456 78</span>
                    </div>

                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Téléphone</span>
                        <span class="text-sm font-medium text-gray-900">06 12 34 56 78</span>
                    </div>

                    <div class="mt-4">
                        <h4 class="text-sm font-semibold text-gray-700 mb-3">Signes vitaux</h4>

                        <div class="flex justify-between items-center py-2 border-b border-gray-100">
                            <span class="text-sm text-gray-600">Tension artérielle</span>
                            <span class="text-sm font-medium text-gray-900">120/80 mmHg</span>
                        </div>

                        <div class="flex justify-between items-center py-2 border-b border-gray-100">
                            <span class="text-sm text-gray-600">Fréquence cardiaque</span>
                            <span class="text-sm font-medium text-gray-900">72 bpm</span>
                        </div>

                        <div class="flex justify-between items-center py-2 border-b border-gray-100">
                            <span class="text-sm text-gray-600">Température</span>
                            <span class="text-sm font-medium text-gray-900">36.8°C</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="space-y-4">
                <h2 class="text-lg font-semibold text-gray-800 mb-4">Consultation médicale</h2>

                <form class="space-y-4">
                     Motif de consultation
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Motif de consultation
                        </label>
                        <textarea
                            rows="3"
                            placeholder="Décrivez le motif de la consultation..."
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                        ></textarea>
                    </div>

                     Examen clinique
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Examen clinique
                        </label>
                        <textarea
                            rows="3"
                            placeholder="Notes d'examen clinique..."
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                        ></textarea>
                    </div>

                     Symptômes observés
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Symptômes observés
                        </label>
                        <textarea
                            rows="3"
                            placeholder="Symptômes rapportés par le patient..."
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                        ></textarea>
                    </div>

                     Diagnostic et Coût
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                Diagnostic
                            </label>
                            <input
                                type="text"
                                placeholder="Diagnostic établi"
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm"
                            >
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">
                                Coût consultation
                            </label>
                            <input
                                type="text"
                                value="150 DH"
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm font-medium"
                            >
                        </div>
                    </div>

                     Prescription
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Prescription
                        </label>
                        <textarea
                            rows="3"
                            placeholder="Médicaments prescrits..."
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none"
                        ></textarea>
                    </div>

                     Buttons
                    <div class="flex gap-3 pt-2">
                        <button
                            type="button"
                            class="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm"
                        >
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            Clôturer consultation
                        </button>
                        <button
                            type="button"
                            class="flex-1 bg-gray-800 hover:bg-gray-900 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm"
                        >
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                            </svg>
                            Demander avis spécialiste
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>