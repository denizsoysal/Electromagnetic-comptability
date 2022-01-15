function [L] = calcul_inductance(b,a,rayon)
mu = 4e-7*pi;
L = mu*(b*log(a/rayon)+a*log(b/rayon))/pi;
end

