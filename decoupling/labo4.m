clc
close all
f = logspace(1,15);
CL = 100e-12;
Cinv = 130e-12;
Ceq = CL+Cinv;
%% Section 1-b
mu = 4*pi*1e-7;
vp = 3e8; 
r = 0.001;
a = 0.05;
b = 1;
L = (mu/pi)*(b*log(a/r)+a*log(b/r));
%% Section 1-c

C = 1/(L*vp^2) % capacite en F
%% Section 1-d
fr = 1/(2*pi*sqrt(L*Ceq))%Frquence de resonnance en [Hz]
%%Section 1-e
w = 2*pi*f;
Hjw = zeros(1,length(f));
for i=1:length(f)
    Hjw(1,i) = abs(20*log(i*(L*w(i)-1/(Ceq*w(i)))));
end
Hjw;
%%Section 2
%% Section 2-b
r = 0.001;
a1 = 0.05;
b1 = 0.03;
L1 = (mu/pi)*(b1*log(a/r)+a1*log(b1/r));
%% Section 2-c

C1 = 1/(L1*vp^2) % capacite en F
%% Section 2-d
fr1 = 1/(2*pi*sqrt(L1*C1))% Frquence de resonnance en [Hz]
%%Section 1-e
Hjw1 = zeros(1,length(f));
for i=1:length(f)
    Hjw1(1,i) = abs(20*log(i*(L1*w(i)-1/(CL*w(i)))));
end
Hjw1;
%% Section 3
%% Section 3-b
L3 = 10e-12;
Ceq = CL+Cinv+4.4e-6;
%% Section 3-c
fr2 = 1/(2*pi*sqrt(L3*Ceq)) % Frquence de resonnance en [Hz]
%% Section 3-d
Hjw2 = zeros(1,length(f));
for i=1:length(f)
    Hjw2(1,i) = abs(20*log(i*(L3*w(i)-1/(Ceq*w(i)))));
end
Hjw2;



%% les figures
%% figure section1
% %% toutes les figures pratiques ensemble
figure
semilogx(w,Hjw)
grid on
grid minor
legend('Impedance caracteristique')
title('Courbe section 1')
xlabel('frequence [Hz]');
ylabel('Impedance en [dB]');
%% figure Section 2
figure
semilogx(w,Hjw1)
grid on
grid minor
legend('Impedance caracteristique')
title('Courbe section 2')
xlabel('frequence [Hz]');
ylabel('Impedance en [dB]');
%% Figure Section 3
figure
semilogx(w,Hjw2)
grid on
grid minor
legend('Impedance caracteristique')
title('Courbe section 3')
xlabel('frequence [Hz]');
ylabel('Impedance en [dB]');
