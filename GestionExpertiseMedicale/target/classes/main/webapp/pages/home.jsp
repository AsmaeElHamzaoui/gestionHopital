<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hôpital - Page d'Accueil</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="font-sans">
    <!-- Header -->
    <header class="bg-teal-600 text-white sticky top-0 z-50 shadow-md">
        <nav class="container mx-auto px-4 py-4 flex justify-between items-center">
            <div class="text-2xl font-bold">Hôpital Santé</div>
            <ul class="flex space-x-6">
                <li><a href="${pageContext.request.contextPath}/users" class="hover:text-teal-200 transition duration-300">users</a></li>
                <li><a href="#" class="hover:text-teal-200 transition duration-300">Accueil</a></li>
                <li><a href="#" class="hover:text-teal-200 transition duration-300">Services</a></li>
                <li><a href="#" class="hover:text-teal-200 transition duration-300" onclick="openModal()">Login</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Section -->
    <main class="relative min-h-screen flex items-center justify-center bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80')">
        <div class="absolute inset-0 bg-black opacity-50"></div>
        <div class="relative z-10 text-center text-white px-4">
            <h1 class="text-5xl font-bold mb-4 animate-fade-in-down">Bienvenue à l'Hôpital Santé</h1>
            <p class="text-xl mb-6 animate-fade-in-up">Votre santé, notre priorité. Découvrez des soins de qualité avec compassion.</p>
            <a href="#" class="bg-teal-500 text-white px-6 py-3 rounded-full hover:bg-teal-400 transition duration-300 animate-pulse">Prendre un rendez-vous</a>
        </div>
    </main>

    <!-- Login Modal -->
    <div id="loginModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
        <div class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full animate-slide-in">
            <h2 class="text-2xl font-bold text-teal-600 mb-6 text-center">Connexion</h2>

            <!-- FORMULAIRE -->
            <form action="${pageContext.request.contextPath}/auth" method="post">
                <div class="mb-4">
                    <label for="email" class="block text-gray-700 font-semibold mb-2">Email</label>
                    <input type="email" id="email" name="email" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Entrez votre email" required>
                </div>
                <div class="mb-6">
                    <label for="password" class="block text-gray-700 font-semibold mb-2">Mot de passe</label>
                    <input type="password" id="password" name="password" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Entrez votre mot de passe" required>
                </div>
                <button type="submit" class="w-full bg-teal-500 text-white py-2 rounded-lg hover:bg-teal-400 transition duration-300">Se connecter</button>
                <button type="button" onclick="closeModal()" class="w-full mt-4 text-teal-600 hover:text-teal-800 transition duration-300">Annuler</button>
            </form>
        </div>
    </div>


    <!-- Footer -->
    <footer class="bg-teal-600 text-white py-6">
        <div class="container mx-auto px-4 text-center">
            <p>&copy; 2025 Hôpital Santé. Tous droits réservés.</p>
            <p class="mt-2">Contact : contact@hopitalsante.fr | Tél : +33 1 23 45 67 89</p>
        </div>
    </footer>

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
    </style>

    <script>
        function openModal() {
            document.getElementById('loginModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('loginModal').classList.add('hidden');
        }
    </script>
</body>
</html>