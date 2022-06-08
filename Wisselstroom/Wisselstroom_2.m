clc
clear all
freq_proef1S = [1 2 3 4 5]*10^3;
V_proef1S    = [0.8862 1.337 1.530 1.620 1.668];
I_proef1S    = [24.0 18.57 14.31 11.39 9.42];

freq_proef1C = [1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 7.0 8.0 9.0 11.0];
V_proef1C    = [1.774 1.711 1.668 1.619 1.563 1.504 1.444 1.382 1.327 1.270 1.214 1.162 1.113 1.022 0.9483 0.8170];
I_proef1C    = [5.00 7.41 9.63 11.64 13.44 15.08 16.50 17.76 18.86 19.80 20.64 21.38 21.30 22.2 23.0 24.0]*10^-3; %A

freq_proef2  = [0.3 0.5 0.7 1.0 1.3 1.5 1.7 2.0 2.2 2.5 3.0 3.5 3.7 4.0 4.3 4.5 4.8 5.0 5.3 5.5 5.8 6.0]*10^3; %Hz
VR1          = [15.2 25.4 35.4 50.1 64.2 72.8 80.9 91.4 97.0 103.2 107.8 106.6 105.0 102.2 98.5 96.1 92.5 89.8 86.2 83.6 80.2 78.4]*10^-3; %V
VC1          = [1.769 1.765 1.761 1.745 1.719 1.700 1.660 1.591 1.536 1.437 1.251 1.061 0.9917 0.892 0.8023 0.7475 0.6736 0.629 0.5694 0.5334 0.4851 0.465]; %V
VL1          = [16.4 45.1 88.2 178.5 297.2 389.8 490.5 651.1 760. 918.5 1150 1328 1385 1454 1510 1543 1580 1602 1623 1640 1660 1668]*10^-3; %V
VRLC         = [1753 1721 1672 1556 1424 1305 1171 947 784.6 534.2 163.4 295.1 413.6 577.4 720.2 804.0 914.2 978.7 1063.6 1113 1176 1215]*10^-3; %V
I2           = [1.52 2.54 3.56 5.04 6.44 7.31 8.11 9.13 9.67 10.23 10.7 10.59 10.45 10.17 9.83 9.58 9.23 8.97 8.62 8.38 8.04 7.82]*10^-3; %A

%Proef 2
VR1_0  = VR1*sqrt(2);
VC1_0  = VC1*sqrt(2);
VL1_0  = VL1*sqrt(2);
VRLC_0 = VRLC*sqrt(2);
I2_0   = I2*sqrt(2);

XL = VL1_0./I2_0;
XC = VC1_0./I2_0;
phi  = atan((VL1_0-VC1_0)./VR1_0);


modelfun = @(var,x)(atan(((2*pi*x)*var(1) - 1./(2*pi*x*var(2)))/var(3))+ var(4)+ var(5));
beta = [0.005 0.000001 10 0 0];
shitwaarden = nlinfit(freq_proef2, phi, modelfun, beta);
Lshit=shitwaarden(1)
Cshit=shitwaarden(2)
Rshit=shitwaarden(3)
[omega, R, J, CovB, MSE] = nlinfit(freq_proef2, phi, modelfun, beta);
onzekerheid = sqrt(diag(CovB));
%L = omega(1,1)
%C = omega(1,2)
%R = omega(1,3)
L_onz = onzekerheid(1)
C_onz = onzekerheid(2)
R_onz = onzekerheid(3)
%%%%%%%%%%%%%%
Z = sqrt(10^2 + (XL-XC).^2);
modelfun2 = @(var,x)(1./(sqrt(var(3)^2+(2*pi*x*var(1)-(1./(2*pi*x*var(2)))).^2))+var(4)+var(5));
beta2 = [0.005 0.000001 10 0 0];
[omega2, R, J, CovB, MSE] = nlinfit(freq_proef2, 1./Z, modelfun2, beta2);



onzekerheid2 = sqrt(diag(CovB));
L2 = omega2(1,1)
C2 = omega2(1,2)
R2 = omega2(1,3)
L_onz2 = onzekerheid2(1)
C_onz2 = onzekerheid2(2)
R_onz2 = onzekerheid2(3)


hold on
plot(freq_proef2,(atan(((2*pi*freq_proef2)*Lshit - 1./(2*pi*freq_proef2*Cshit))/Rshit)))
plot(freq_proef2, phi, 'r.')
legend('gefitte waarden','experimentele waarden','Location','north')
title('Fasehoek in functie van de frequentie')
ylabel('Fasehoek (rad)')
xlabel('Frequentie (Hz)')

%plot(freq_proef2, 1./Z)
%plot(freq_proef2,(1./(sqrt(R2^2+(2*pi*freq_proef2*L2-(1./(2*pi*freq_proef2*C2))).^2))),'r.')
%legend('gefitte waarden','experimentele waarden')
%title('Admittantie in functie van de frequentie')
%ylabel('Admittantie (Siemens (S))')
%xlabel('Frequentie (Hz)')
hold off

resonantie_freq= sqrt(1./(L2*C2))./(2*pi)
res_freq_onzekerheid= sqrt(L_onz2^2*(sqrt(L2*C2)/(2*L2^2*C2))^2+C_onz2^2*(sqrt(L2*C2)/(2*L2*C2^2))^2)