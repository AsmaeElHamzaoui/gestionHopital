<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
            <!-- Patient Information and Vital Signs -->
            <div class="space-y-4">
                <h2 class="text-lg font-semibold text-gray-800 mb-4">Informations patient</h2>

                <!-- Patient Profile -->
                <div class="flex items-start gap-3 mb-6">
                    <div class="w-12 h-12 bg-emerald-500 rounded-full flex items-center justify-center text-white font-semibold">
                        ${patient.prenom.charAt(0)}${patient.nom.charAt(0)}
                    </div>
                    <div>
                        <h3 class="font-semibold text-gray-900">${patient.nom} ${patient.prenom}</h3>
                        <p class="text-sm text-gray-600">
                            <c:set var="today" value="<%= java.time.LocalDate.now() %>" />
                            <c:set var="age" value="${today.year - patient.dateNaissance.year - (today.monthValue < patient.dateNaissance.monthValue || (today.monthValue == patient.dateNaissance.monthValue && today.dayOfMonth < patient.dateNaissance.dayOfMonth) ? 1 : 0)}" />
                            ${age} ans
                        </p>
                    </div>
                </div>

                <!-- Patient Details -->
                <div class="space-y-3">
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Numéro SS</span>
                        <span class="text-sm font-medium text-gray-900">${patient.numSecu}</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Téléphone</span>
                        <span class="text-sm font-medium text-gray-900">${patient.telephone}</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Adresse</span>
                        <span class="text-sm font-medium text-gray-900">${patient.adresse}</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Date d'enregistrement</span>
                        <span class="text-sm font-medium text-gray-900">${patient.dateEnregistrement}</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="text-sm text-gray-600">Priorité</span>
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium
                            <c:choose>
                                <c:when test="${patient.priorite == 'URGENTE'}">bg-red-100 text-red-800</c:when>
                                <c:when test="${patient.priorite == 'NORMALE'}">bg-green-100 text-green-800</c:when>
                                <c:otherwise>bg-yellow-100 text-yellow-800</c:otherwise>
                            </c:choose>">
                            ${patient.priorite}
                        </span>
                    </div>
                    <div class="mt-4">
                        <h4 class="text-sm font-semibold text-gray-700 mb-3">Signes vitaux (dernier enregistrement)</h4>
                        <c:choose>
                            <c:when test="${not empty signesVitaux}">
                                <c:set var="latestSignesVitaux" value="${signesVitaux[0]}" />
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Tension artérielle</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.tension}</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Fréquence cardiaque</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.frequenceCardiaque} bpm</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Température</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.temperature}°C</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Fréquence respiratoire</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.frequenceRespiratoire} /min</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Poids</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.poids} kg</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Taille</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.taille} cm</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="text-sm text-gray-600">Date de mesure</span>
                                    <span class="text-sm font-medium text-gray-900">${latestSignesVitaux.dateMesure}</span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="text-sm text-gray-600">Aucun signe vital enregistré.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Consultation Form -->
            <div class="space-y-4">
                <h2 class="text-lg font-semibold text-gray-800 mb-4">Consultation médicale</h2>
                <form action="consultations" method="post" class="space-y-4">
                    <input type="hidden" name="id" value="${consultation.id}" />
                    <input type="hidden" name="patientId" value="${patientId}" />
                    <!-- Date de consultation -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Date de consultation</label>
                        <input type="date" name="dateConsultation" value="${consultation.dateConsultation != null ? consultation.dateConsultation : today}" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm" required />
                    </div>
                    <!-- Motif -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Motif de consultation</label>
                        <textarea name="motif" rows="3" placeholder="Décrivez le motif de la consultation..." class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none">${consultation.motif}</textarea>
                    </div>
                    <!-- Observations -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Observations</label>
                        <textarea name="observations" rows="3" placeholder="Notes d'examen clinique..." class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm resize-none">${consultation.observations}</textarea>
                    </div>
                    <!-- Diagnostic et Coût -->
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Diagnostic</label>
                            <input type="text" name="diagnostic" value="${consultation.diagnostic}" placeholder="Diagnostic établi" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm" />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Coût consultation</label>
                            <input type="number" step="0.01" name="coutFixe" value="${consultation.coutFixe != null ? consultation.coutFixe : '150.00'}" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm font-medium" required />
                        </div>
                    </div>
                    <!-- Statut -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Statut</label>
                        <select name="statut" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm" required>
                            <option value="EN_ATTENTE" ${consultation.statut == 'EN_ATTENTE' ? 'selected' : ''}>En attente</option>
                            <option value="EN_ATTENTE_AVIS_SPECIALISTE" ${consultation.statut == 'EN_ATTENTE_AVIS_SPECIALISTE' ? 'selected' : ''}>En attente avis spécialiste</option>
                            <option value="TERMINEE" ${consultation.statut == 'TERMINEE' ? 'selected' : ''}>Terminée</option>
                        </select>
                    </div>
                    <!-- Buttons -->
                    <div class="flex gap-3 pt-2">
                        <button type="submit" class="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            Enregistrer consultation
                        </button>
                        <a href="consultations?patientId=${patientId}" class="flex-1 bg-gray-800 hover:bg-gray-900 text-white font-medium py-2.5 px-4 rounded-md transition-colors duration-200 flex items-center justify-center gap-2 text-sm">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                            </svg>
                            Retour
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>