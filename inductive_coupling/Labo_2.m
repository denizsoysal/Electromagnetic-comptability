close all;
clear all;
clc
f = linspace(10, 8e6,1e3);
ecart = 1.25e-3;
mu = 4e-7*pi;
ro = 1.7e-8;
L = 0.3;
rayon = .2e-3;
A = pi*rayon^2;
Rfil = (ro*L)/A;
Rne = 50;
Rfe = 50;
Rs = 50;
%% Configuration A
k = .7;
EcartA1 = 7*ecart;
EcartA2 = 7*ecart;
L1A = calcul_inductance(L,EcartA1,rayon);
L2A = calcul_inductance(L,EcartA2,rayon);
M1 = k*sqrt(L1A*L2A);
%% Configuration B
EcartB1 = 7*ecart;
EcartB2 = ecart;
L1B = calcul_inductance(L,EcartB1,rayon);
L2B = calcul_inductance(L,EcartB2,rayon);
M2 = k*sqrt(L1B*L2B);
%% Configuration C
k1 = .2;
EcartC1 = 7*ecart;
EcartC2 = 8*ecart;
L1C = calcul_inductance(L,EcartC1,rayon);
L2C = calcul_inductance(L,EcartC2,rayon);
M3 = k1*sqrt(L1C*L2C);
%% Configuration D
k2 = .1;
EcartD1 = 3*ecart;
EcartD2 = 3*ecart;
L1D = calcul_inductance(L,EcartD1,rayon);
L2D = calcul_inductance(L,EcartD2,rayon);
M4 = k2*sqrt(L1D*L2D);
%% Configuration E
k3 = .05;
EcartE1 = 3*ecart;
EcartE2 = 1*ecart;
L1E = calcul_inductance(L,EcartE1,rayon);
L2E = calcul_inductance(L,EcartE2,rayon);
M5 = k3*sqrt(L1D*L2D);
%% Configuration F
k2 = .1;
EcartF1 = 3*ecart;
EcartF2 = 3*ecart;
L1F = calcul_inductance(L,EcartF1,rayon);
L2F = calcul_inductance(L,EcartF2,rayon);
M6 = k2*sqrt(L1F*L2F);
%% Configuration G
k2 = .1;
EcartG1 = 3*ecart;
EcartG2 = 3*ecart;
L1G = calcul_inductance(L,EcartG1,rayon);
L2G = calcul_inductance(L,EcartG2,rayon);
M7 = k2*sqrt(L1G*L2G);
%% Configuration H
k2 = .025;
EcartH1 = 3*ecart;
EcartH2 = 3*ecart;
L1H = calcul_inductance(L,EcartH1,rayon);
L2H = calcul_inductance(L,EcartH2,rayon);
M8 = k2*sqrt(L1H*L2H);
%% Les inductances mutuelles
M = [M1, M2, M3, M4, M5, M6, M7, M8];
%% Calcul des fonctions de transfert
%% Configuration A
for i = 1:1:length(f)
  HA(i) = (Rne*(Rfil + 1i*2*pi*f(i)*M1))/((Rne+Rfe)*Rs);
end
HA;
%% Configuration B
for i = 1:1:length(f)
  HB(i) = (Rne*(Rfil + 1i*2*pi*f(i)*M2))/((Rne+Rfe)*Rs);
end
%% configuration C
for i = 1:1:length(f)
  HC(i) = (Rne*1i*2*pi*f(i)*M3)/((Rne+Rfe)*Rs);
end
HC;
%% Configuration D
for i = 1:1:length(f)
  HD(i) = (Rne*1i*2*pi*f(i)*M4)/((Rne+Rfe)*Rs);
end
HC;
%% Configuration E
for i = 1:1:length(f)
  HE(i) = (Rne*1i*2*pi*f(i)*M5)/((Rne+Rfe)*Rs);
end
HE;
%% Configuration F
for i = 1:1:length(f)
  HF(i) = (Rne*1i*2*pi*f(i)*M6)/((Rne+Rfe)*Rs);
end
HF;
%% Configuration G
for i = 1:1:length(f)
  HG(i) = (Rne*1i*2*pi*f(i)*M7)/((Rne+Rfe)*Rs);
end
HG;
%% Configuration H
for i = 1:1:length(f)
  HH(i) = (Rne*1i*2*pi*f(i)*M8)/((Rne+Rfe)*Rs);
end
HH;
%% Figures

figure
semilogx(20*log10(abs(HA)))
grid on
grid minor
hold on
semilogx(20*log10(abs(HB)))
semilogx(20*log10(abs(HC)))
semilogx(20*log10(abs(HD)))
semilogx(20*log10(abs(HE)))
semilogx(20*log10(abs(HF)))
semilogx(20*log10(abs(HG)))
semilogx(20*log10(abs(HH)))
legend('HA','HB','HC','HD','HE','HF','HG','HH')
title(' Résultats théoriques pour toutes les configurations')
xlabel(' frequence [Hz]')
ylabel('Module en [dB]')

%figure expérimentale 
figure 
%Résultats expérimentaux
freq = [1 10 100 500 1000 10000 50000 75000 100000 125000 150000 175000 200000 300000 500000 1000000 2000000 3000000 4000000];
resultats_A = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.016 0.032 0.048 0.060 0.072 0.104 0.172 0.324 0.552 0.680 0.736];
gain_A = 20*log10(((resultats_A./5)));
resultats_B = [0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.012 0.016 0.024 0.036 0.044 0.052 0.076 0.124 0.24 0.416 0.524 0.58];
gain_B = 20*log10(((resultats_B./5)));
resultats_C = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.028 0.040 0.056 0.070 0.084 0.140 0.192 0.336 0.480 0.516 0.540];
gain_C = 20*log10(((resultats_C./5)));
resultats_D = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.016 0.028 0.052 0.100 0.124 0.140];
gain_D = 20*log10(((resultats_D./5)));
resultats_E = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.028 0.056 0.072 0.076];
gain_E = 20*log10(((resultats_E./5)));
resultats_F = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.014 0.016 0.024 0.040 0.080 0.140 0.176 0.188];
gain_F = 20*log10(((resultats_F./5)));
resultats_G = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.012 0.024 0.044 0.064 0.064 0.064];
gain_G = 20*log10(((resultats_F./5)));
resultats_H = [0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.008 0.012 0.020 0.024 0.028];
gain_H = 20*log10(((resultats_H./5)));
%courbes
figure
semilogx(freq, gain_A)
grid on
grid minor
hold on
semilogx(freq, gain_B)
semilogx(freq, gain_C)
semilogx(freq, gain_D)
semilogx(freq, gain_E)
semilogx(freq, gain_F)
semilogx(freq, gain_G)
semilogx(freq, gain_H)
xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Résultats expérimentaux pour toutes les configurations')
legend('HA','HB','HC','HD','HE','HF','HG','HH')

% %    


