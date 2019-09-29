clear all;
close all;
clc;
ff = 10:1e5:4e9; % plage de frequence à utiliser
w = zeros(1,length(ff)); 
A2 = [4.55e-3 45.8e-3 2.9e-3 1.25e-3 49.1e-3];  % Valeurs des separations configuration A2
A5 = [4.55e-3 45.8e-3 1.25e-3 6.2e-3 44.15e-3]; % Valeurs des separations configuration A5
A7 = [4.55e-3 45.8e-3 4.55e-3 9.5e-3 40.85e-3]; % Valeurs des separations configuration A7
B2 = [4.55e-3 1.25e-3 2.9e-3]; % Valeurs des separations configuration B2
B5 = [4.55e-3 6.2e-3 1.25e-3]; % Valeurs des separations configuration B5
BN = [4.55e-3 50.75e-3 45.8e-3]; % Valeurs des separations configuration B7
D4 = [1.25e-3 2.90e-3 4.55e-3 1.25e-3 2.90e-3];
DN = [1.25e-3 2.90e-3 50.75e-3 49.1e-3 47.45e-3];
%% valeurs données de l'ennoncé
R1 = 50; % resistance interne de la source
R0 = 1e6; % resistance interne de l'oscilloscope
C0 = 70e-12; % capacite interne de l'oscilloscope
%% calcul valeurs de capacités
%% configuration A2
sch_1 = calcul(A2); % calcul capacite configuration A2 de la source vers l'oscilloscope
G1A2 = sch_1(1,1)+sch_1(1,2); % capacite de Cg1
CA2 = sch_1(1,3);  % Capacite d'interface entre les 2 parties
G2A2 = sch_1(1,4)+sch_1(1,5); %capacite de Cg2
%% configuration A5
sch_2 = calcul(A5); 
G1A5 = sch_2(1,1)+sch_2(1,2);
CA5 = sch_2(1,3);
G2A5 = sch_2(1,4)+sch_2(1,5);
%% configuration A7
sch_3 = calcul(A7); % calcul capacite configuration A7 de la source vers l'oscilloscope
G1A7 = sch_3(1,1)+sch_3(1,2);
CA7 = sch_3(1,3);
G2A7 = sch_3(1,4)+sch_3(1,5);
%% configuration B2
sch_4 = calcul(B2); % calcul capacite configuration B2 de la source vers l'oscilloscope
G1B2 = sch_4(1,1);
CB2 = sch_4(1,2);
G2B2 = sch_4(1,3);
%% configuration B5
sch_5 = calcul(B5); % calcul capacite configuration B5 de la source vers l'oscilloscope
G1B5 = sch_5(1,1);
CB5 = sch_5(1,2);
G2B5 = sch_5(1,3);
%% configuration BN
sch_6 = calcul(BN); % calcul capacite configuration BN de la source vers l'oscilloscope
G1BN = sch_6(1,1);
CBN = sch_6(1,2);
G2BN = sch_6(1,3);
%% configuration D4
sch_7 = calcul(D4); % calcul capacite configuration BN de la source vers l'oscilloscope
G1D4 = sch_7(1,1)+sch_7(1,2);
CD4 = sch_7(1,3);
G2D4 = sch_7(1,4)+sch_7(1,5);
%% configuration DN
sch_8 = calcul(DN); % calcul capacite configuration BN de la source vers l'oscilloscope
G1DN = sch_8(1,1)+sch_8(1,2);
CDN = sch_8(1,3);
G2DN = sch_8(1,4)+sch_8(1,5);

%% Calcul des fonctions de transfert
%% calcul fonction transfert configurationA2
A= R0*(C0+G2A2+CA2);
B= R0*R1*(G1A2*(CA2+C0+G2A2)+CA2*(G1A2+C0));
C= R1*(CA2+G1A2)+R0*(C0+G2A2+CA2);
D= R0*CA2;
E = R0*(CA2+G2A2+C0);
        H1A2= tf([0,A,1],[B,C,1]);
H2A2 = tf([0,D,0],[0,E,1]);
HA2 = H1A2*H2A2;
%% calcul fonction de transfert configuration A5
A1= R0*(C0+G2A5+CA5);
B1= R0*R1*(G1A5*(CA5+C0+G2A5)+CA5*(G1A5+C0));
C1= R1*(CA5+G1A5)+R0*(C0+G2A5+CA5);
D1= R0*CA5;
E1 = R0*(CA5+G2A5+C0);
H1A5= tf([0,A1,1],[B1,C1,1]);
H2A5 = tf([0,D1,0],[0,E1,1]);
HA5 = H1A5*H2A5;
%% calcul de fonction de transfert A7
A2= R0*(C0+G2A7+CA7);
B2= R0*R1*(G1A7*(CA7+C0+G2A7)+CA7*(G1A7+C0));
C2= R1*(CA7+G1A7)+R0*(C0+G2A7+CA7);
D2= R0*CA7;
E2 = R0*(CA7+G2A7+C0);
H1A7= tf([0,A2,1],[B2,C2,1]);
H2A7 = tf([0,D2,0],[0,E2,1]);
HA7 = H1A7*H2A7;
%% calcul fonction de transfert B2
A3= R0*(C0+G2B2+CB2);
B3= R0*R1*(G1B2*(CB2+C0+G2B2)+CB2*(G1B2+C0));
C3= R1*(CB2+G1B2)+R0*(C0+G2B2+CB2);
D3= R0*CB2;
E3 = R0*(CB2+G2B2+C0);
H1B2= tf([0,A3,1],[B3,C3,1]);
H2B2 = tf([0,D3,0],[0,E3,1]);
HB2 = H1B2*H2B2;
%% calcul fonction de transfert B5
A4= R0*(C0+G2B5+CB5);
B4= R0*R1*(G1B5*(CB5+C0+G2B5)+CB5*(G1B5+C0));
C4= R1*(CB5+G1B5)+R0*(C0+G2B5+CB5);
D4= R0*CB5;
E4 = R0*(CB5+G2B5+C0);
H1B5= tf([0,A4,1],[B4,C4,1]);
H2B5 = tf([0,D4,0],[0,E4,1]);
HB5 = H1B5*H2B5;
%% calcul fonction de transfert configuration BN
A5= R0*(C0+G2BN+CBN);
B5= R0*R1*(G1BN*(CBN+C0+G2BN)+CBN*(G1BN+C0));
C5= R1*(CBN+G1BN)+R0*(C0+G2BN+CBN);
D5= R0*CBN;
E5 = R0*(CBN+G2BN+C0);
H1BN= tf([0,A5,1],[B5,C5,1]);
H2BN = tf([0,D5,0],[0,E5,1]);
HBN = H1BN*H2BN;
%% calcul fonction de transfert configuration C2
Rfe = 15e3;
R = (R0*Rfe)/(R0+Rfe);
A6= R*(C0+G2B2+CB2);
B6= R*R1*(G1B2*(CB2+C0+G2B2)+CB2*(G1B2+C0));
C6= R1*(CB2+G1B2)+R*(C0+G2B2+CB2);
D6= R*CB2;
E6 = R*(CB2+G2B2+C0);
H1C2= tf([0,A6,1],[B6,C6,1]);
H2C2 = tf([0,D6,0],[0,E6,1]);
HC2 = H1C2*H2C2;
%% calcul fonction de transfert configuration C5
A7= R*(C0+G2B5+CB5);
B7= R*R1*(G1B5*(CB5+C0+G2B5)+CB5*(G1B5+C0));
C7= R1*(CB5+G1B5)+R*(C0+G2B5+CB5);
D7= R*CB5;
E7 = R*(CB5+G2B5+C0);
H1C5= tf([0,A7,1],[B7,C7,1]);
H2C5 = tf([0,D7,0],[0,E7,1]);
HC5 = H1C5*H2C5;
%% calcul fonction de transfert configuration CN
A8= R*(C0+G2BN+CBN);
B8= R*R1*(G1BN*(CBN+C0+G2BN)+CBN*(G1BN+C0));
C8= R1*(CBN+G1BN)+R*(C0+G2BN+CBN);
D8= R*CBN;
E8 = R*(CBN+G2BN+C0);
H1CN= tf([0,A8,1],[B8,C8,1]);
H2CN = tf([0,D8,0],[0,E8,1]);
HCN = H1CN*H2CN;
%% calcul fonction de transfert D4
A9= R*(C0+G2D4+CD4);
B9= R*R1*(G1D4*(CD4+C0+G2D4)+CD4*(G1D4+C0));
C9= R1*(CD4+G1D4)+R*(C0+G2D4+CD4);
D9= R*CD4;
E9 = R*(CD4+G2D4+C0);
H1D4= tf([0,A9,1],[B9,C9,1]);
H2D4 = tf([0,D9,0],[0,E9,1]);
HD4 = H1D4*H2D4;
%% calcul fonction de transfert DN
A10= R*(C0+G2DN+CDN);
B10= R*R1*(G1DN*(CDN+C0+G2DN)+CDN*(G1DN+C0));
C10= R1*(CDN+G1DN)+R*(C0+G2DN+CDN);
D10= R*CDN;
E10 = R*(CDN+G2DN+C0);
H1DN= tf([0,A10,1],[B10,C10,1]);
H2DN = tf([0,D10,0],[0,E10,1]);
HDN = H1DN*H2DN;
%% calcul fonction de transfert configuration E4
Rfe1 = 50;
R5 = (R0*Rfe1)/(R0+Rfe1);
A11= R5*(C0+G2D4+CD4);
B11= R5*R1*(G1D4*(CD4+C0+G2D4)+CD4*(G1D4+C0));
C11= R1*(CD4+G1D4)+R5*(C0+G2D4+CD4);
D11= R5*CD4;
E11 = R5*(CD4+G2D4+C0);
H1E4= tf([0,A11,1],[B11,C11,1]);
H2E4 = tf([0,D11,0],[0,E11,1]);
HE4 = H1E4*H2E4;
%% calcul fonction de transfert configuration EN
A12= R5*(C0+G2DN+CDN);
B12= R5*R1*(G1DN*(CDN+C0+G2DN)+CDN*(G1DN+C0));
C12= R1*(CDN+G1DN)+R5*(C0+G2DN+CDN);
D12= R5*CDN;
E12 = R5*(CDN+G2DN+C0);
H1EN= tf([0,A12,1],[B12,C12,1]);
H2EN = tf([0,D12,0],[0,E12,1]);
HEN = H1EN*H2EN;
%% calcul des modules des fonctions de transfert
%% calcul de module configuration A2
num =[0 2.478e-10 3.126e-6 0];
denom = [2.241e-18 6.283e-9 15.85e-5 1];
HjwA2 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwA2(i) = numjw/denomjw;
end
HjwA2;
HdbA2 = 20*log10(abs(HjwA2));
% %% Calcul module configuration A5
num = [0 3.632e-10 4.621e-6 0];
denom = [2.647e-18 6.178e-9 15.72e-5 1];
HjwA5 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwA5(i) = numjw/denomjw;
end
HjwA5;
HdbA5 = 20*log10(abs(HjwA5));
%% Calcul module configuration A7
num = [0 2.042e-10 2.672e-6 0];
denom = [1.986e-18 5.837e-9 15.28e-5 1];
HjwA7 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwA7(i) = numjw/denomjw;
end
HjwA7;
HdbA7 = 20*log10(abs(HjwA7));
%% calcul module configuration B2
num = [0 3.593e-10 4.621e-6 0];
denom = [2.113e-18 6.045e-9 15.55e-5 1]; 
HjwB2 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwB2(i) = numjw/denomjw;
end
HjwB2;
HdbB2 = 20*log10(abs(HjwB2));
%% calcul module configuration B5
num = [0 1.873e-10 2.431e-6 0];
denom = [1.474e-18 5.937e-9 15.41e-5 1];
HjwB5 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwB5(i) = numjw/denomjw;
end
HjwB5;
HdbB5 = 20*log10(abs(HjwB5));
%% calcul module configuration BN
num = [0 1.101e-10 2.431e-6 0];
denom = [1.113e-18 5.335e-9 14.61e-5 1];
HjwBN = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwBN(i) = numjw/denomjw;
end
HjwBN;
HdbBN = 20*log10(abs(HjwBN));
%% calcul module configuration C2
num = [0 7.846e-14 6.829e-8 0];
denom = [4.615e-22 1.321e-12 2.298e-6 1];%% données à changer
HjwC2 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwC2(i) = numjw/denomjw;
end
HjwC2;
HdbC2 = 20*log10(abs(HjwC2));
%% calcul module configuration C5
num = [0 4.091e-14 3.592e-8 0];
denom = [3.219e-22 1.297e-12 2.278e-6 1];
HjwC5 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwC5(i) = numjw/denomjw;
end
HjwC5;
HdbC5 = 20*log10(abs(HjwC5));
%% calcul module configuration CN
num = [0 2.405e-14 2.228e-8 0];
denom = [2.431e-22 1.166e-12 2.159e-6 1];
HjwCN = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwCN(i) = numjw/denomjw;
end
HjwCN;
HdbCN = 20*log10(abs(HjwCN));
%% calcul module configuration D4
num = [0 4.316e-11 6.015e-7 0]; %% données à changer
denom = [4.939e-19 5.192e-9 14.14e-5 1];%% données à changer
HjwD4 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwD4(i) = numjw/denomjw;
end
HjwD4;
HdbD4 = 20*log10(abs(HjwD4));
%% calcul module configuration DN
num = [0 2.454e-14 2.228e-8 0];
denom = [5.656e-22 1.215e-15 2.204e-6 1];
HjwDN = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwDN(i) = numjw/denomjw;
end
HjwDN;
HdbDN = 20*log10(abs(HjwDN));
% calcul module configuration HE4
num = [0 5.372e-19 1.336e-10 0];
denom = [8.35e-27 2.034e-17 8.563e-9 1];
HjwE4 = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwE4(i) = numjw/denomjw;
end
HjwE4;
HdbE4 = 20*log10(abs(HjwE4));
% calcul module configuration HEN
num = [0 2.809e-19 7.536e-11 0];
denom = [6.473e-27 1.735e-17 7.917e-9 1];
HjwEN = zeros(1,length(ff));
for i =1:1:length(ff)
    w(i) = 2*pi*ff(i);
    jw = 1i*w(i);
    numjw = num(1)*jw.^3+ num(2)*jw.^2+num(3)*jw+num(4);
    denomjw = denom(1)*jw.^3+denom(2)*jw.^2+denom(3)*jw+denom(4);
    HjwEN(i) = numjw/denomjw;
end
HjwEN;
HdbEN = 20*log10(abs(HjwEN));
%% tracer les differentes figures
%% configuration A

%Résultats expérimentaux
freq = [10 50 100 500 1000 10000 100000 1000000];
resultats_a2 = [0.56 0.56 0.8 1.16 1.2 1.2 1.2 1.2];
gain_a2 = 20*2*log10(((resultats_a2./5)));
resultats_a5 = [0.640 0.88 1.2 2.161 2.2 2.44 2.44 2.44];
gain_a5 = 20*2*log10(((resultats_a5./5)));
resultats_a7 = [0.54 0.72 0.9 1.6 1.6 1.6 1.68 1.48];
gain_a7 = 20*2*log10(((resultats_a7./5)));

%courbes 
figure
semilogx(HdbA2,'b')
grid on
grid minor
hold on
semilogx(HdbA5, 'y')
semilogx(HdbA7, 'c')

semilogx(freq,gain_a2)
semilogx(freq,gain_a5)
semilogx(freq,gain_a7)

xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Courbes configuration A')
legend('HdbA2','HdbA5','HdbA7','A2 experimental', 'A5 experimental','A7 experimental')

%% configuration B
%Résultats expérimentaux
freq = [10 50 100 500 800 1000 10000 100000 1000000];
resultats_B2 = [0.76 1.04 1.2 2.2 2.24 2.38 2.32 2.32 2.243];
gain_B2 = 20*log10(((resultats_B2./5)));
resultats_B5 = [0.56 0.64 0.72 1 1.04 1.04 1.16 1.16 1.161];
gain_B5 = 20*log10(((resultats_B5./5)));
resultats_BN = [0.64 0.72 0.72 0.98 1.04 1.02 1 1 1];
gain_BN = 20*log10(((resultats_BN./5)));
%courbes
figure
semilogx(HdbB2,'b')
grid on
grid minor
hold on
semilogx(HdbB5, 'y')
semilogx(HdbBN, 'c')
semilogx(freq,gain_B2)
semilogx(freq, gain_B5)
semilogx(freq, gain_BN)

xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Courbes configuration B')
legend('HdbB2','HdbB5','HdbBN','B2 experimental', 'B5 experimental','BN experimental')
%% configuration C
%Résultats expérimentaux
freq = [10 50 100 500 800 1000 10000 100000 1000000];
resultats_C2 = [0.024 0.024 0.024 0.024 0.028 0.032 0.096 0.696 1.76];
gain_C2 = 20*log10(((resultats_C2./5)));
resultats_C5 = [0.04 0.03 0.03 0.03 0.03 0.16 0.16 0.19 0.456];
gain_C5 = 20*log10(((resultats_C5./5)));
resultats_CN = [0.4 0.44 0.42 0.54 0.54 0.52 0.52 0.54 0.54];
gain_CN = 20*log10(((resultats_CN./5)));
%courbes
figure
semilogx(HdbC2,'b')
grid on
grid minor
hold on
semilogx(HdbC5, 'y')
semilogx(HdbCN, 'c')
semilogx(freq, gain_C2)
semilogx(freq, gain_C5)
semilogx(freq, gain_CN)

xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Courbes configuration C')
legend('HdbC2','HdbC5','HdbCN','C2 experimental', 'C5 experimental','CN experimental')

%% configuration D
%Résultats expérimentaux
freq = [10 50 100 500 800 1000 10000 100000 1000000];
resultats_D4 = [0.024 0.024 0.024 0.024 0.024 0.024 0.08 0.24 0.4];
gain_D4 = 20*log10(((resultats_D4./5)));
resultats_DN = [0.024 0.024 0.024 0.024 0.024 0.024 0.032 0.1 0.272];
gain_DN = 20*log10(((resultats_DN./5)));
%courbes
figure
semilogx(HdbD4,'b')
grid on
grid minor
hold on
semilogx(HdbDN, 'y')
semilogx(freq,gain_D4)
semilogx(freq,gain_DN)

xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Courbes configuration D')
legend('HdbD4','HdbDN','D4 experimental', 'DN experimental')


%% configuration E
%Résultats expérimentaux
freq = [10 50 100 500 800 1000 10000 100000 1000000];
resultats_E4 = [0.04 0.08 0.08 0.08 0.08 0.08 0.08 0.12 0.12];
gain_E4 = 20*log10(((resultats_E4./5)));
resultats_EN = [0.08 0.08 0.08 0.08 0.08 0.08 0.04 0.08 0.08];
gain_EN = 20*log10(((resultats_EN./5)));
%courbes
figure
semilogx(HdbE4,'b')
grid on
grid minor
hold on
semilogx(HdbEN, 'y')
semilogx(freq,gain_E4)
semilogx(freq,gain_EN)
xlabel('frequence en [Hz]');
ylabel('|Hdb| en [dB]')
title('Courbes configuration E')
legend('HdbE4','HdbEN','E4 experimental', 'EN experimental')
% %    


