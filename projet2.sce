clc; clear; // Nettoyer la console et toutes les variables

// --------------------------
// 1. Définir f(t) ici directement
// Remplace cette ligne selon l’énoncé de ton exercice
deff('z = f(t)', 'z = t^2 + sin(t)'); // Exemple : f(t) = t² + sin(t)

// --------------------------
// 2. Définir les paramètres
k = 3;        // Constante k donnée dans l'équation
y0 = 2;       // y(0), condition initiale
dy0 = 1;      // y'(0), condition initiale
Y0 = [y0; dy0]; // Vecteur initial de conditions

// --------------------------
// 3. Définir l'intervalle de temps
t0 = 0;       // Temps initial
tf = 5;       // Temps final
t = linspace(t0, tf, 100); // 100 points dans [t0, tf]

// --------------------------
// 4. Définir le système d'équations d'ordre 1
// y1 = y, y2 = y' ⇒ y1' = y2, y2' = f(t) - k*sin(y1^(1/7))
function dydt = ode_system(t, y)
    dydt = zeros(2,1);                         // Vecteur colonne [y1'; y2']
    dydt(1) = y(2);                            // y1' = y2
    dydt(2) = f(t) - k * sin(y(1)^(1/7));      // y2' = f(t) - k*sin(y1^(1/7))
endfunction

// --------------------------
// 5. Résolution numérique avec ode()
Y = ode(Y0, t0, t, ode_system); // Résolution avec la méthode d'intégration ode

// --------------------------
// 6. Extraire les composantes y(t) et y'(t)
y_sol = Y(1,:);       // y(t)
y_prime_sol = Y(2,:); // y'(t)

// --------------------------
// 7. Afficher les 10 premières valeurs de y(t)
disp("📋 Voici les 10 premières valeurs de y(t) :");
disp(y_sol(1:10)'); // Affichage vertical

// --------------------------
// 8. Tracer la solution y(t)
show_window(); // Forcer l'ouverture de la fenêtre graphique
plot(t, y_sol, 'b-');
xlabel("Temps t");
ylabel("Solution y(t)");
title("Solution de y'' + k·sin(y^{1/7}) = f(t)");