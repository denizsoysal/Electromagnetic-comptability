function [cap] = wirecap(separation, rayon,longueur)
%calcul de la capacite
epsilon = 8.85418782e-12; %% `F/m
k = separation/(2*rayon);
G = k+sqrt(k^2-1);
cap = (pi*epsilon*longueur)/log(G);
end

