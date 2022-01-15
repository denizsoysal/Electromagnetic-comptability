function [capacite] = calcul(A)
% Calcul d'une serie de capacite � partir d'une matrice de donn�es
rayon = 0.2e-3;
longueur = 0.3;
capacite = zeros(1,length(A));
for i=1:1:length(A)
    capacite(i) = Calcul_capacite(A(1,i),rayon,longueur);
end

