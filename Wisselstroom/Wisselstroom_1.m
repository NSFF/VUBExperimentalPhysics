clc
clear all
freq_proef1S = [ 1 2 3 4 5]*10^3;% Hz
V_proef1S = [0.8862 1.337 1.530 1.620 1.668]; %V
I_proef1S = [24.0 18.57 14.31 11.39 9.42]*10^-3; %A

V_proef1S_0= V_proef1S*sqrt(2);
I_proef1S_0= I_proef1S*sqrt(2);

X_l_proef1S= V_proef1S_0./I_proef1S_0;
modelfun= @(a,x)a(1)*x+a(2);
beta0= [1 0];
[omega,R,J,covB,MSE]= nlinfit(freq_proef1S,X_l_proef1S,modelfun,beta0);
omega;
grr1=sqrt(diag(covB));
Onzekerheid_omega1=grr1(1);
Onzekerheid_omega2=grr1(2);
L_proef1S_onzekerheid= sqrt(Onzekerheid_omega1^2*(1/(2*pi))^2)
L_proef1S= omega(1)/(2*pi)

hold on
plot(freq_proef1S,omega(1)*freq_proef1S+omega(2))
plot(freq_proef1S,X_l_proef1S,'.')

legend('gefitte waarden','experimentele waarden','Location','north')
title('Inductieve reactantie in functie van de frequentie')
ylabel('Inductieve reactantie (\Omega)')
xlabel('Frequentie (Hz)')
hold off


freq_proef1C = [1.0 1.5 2.0 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 7.0 8.0 9.0 11.0]*10^3;
V_proef1C    = [1.774 1.711 1.668 1.619 1.563 1.504 1.444 1.382 1.327 1.270 1.214 1.162 1.113 1.022 0.9483 0.8170];
I_proef1C    = [5.00 7.41 9.63 11.64 13.44 15.08 16.50 17.76 18.86 19.80 20.64 21.38 21.30 22.2 23.0 24.0]*10^-3; %A

V_proef1C_0= V_proef1C*sqrt(2);
I_proef1C_0= I_proef1C*sqrt(2);

X_C_proef1C= V_proef1C_0./I_proef1C_0;

modelfun2= @(a,x)(a(1)./x);
beta02=1;
[omega2,R2,J2,covB2,MSE2]= nlinfit(freq_proef1C,X_C_proef1C,modelfun2,beta0);
omega2;

Onzekerheid_omega2=sqrt(diag(covB2))
Onzekerheid_C= sqrt(Onzekerheid_omega2(1,1)^2*(1/((2*pi)*omega2(1)^2))^2)
Onzekerheid_X_C= sqrt(Onzekerheid_omega2(1,1)^2*(1./freq_proef1C).^2);

C= 1/(2*pi*omega2(1))

figure
hold on
plot(freq_proef1C,omega2(1)./freq_proef1C)
errorbar(freq_proef1C,X_C_proef1C,Onzekerheid_X_C)
legend('gefitte waarden','experimentele waarden','Location','north')
title('Capacitieve reactantie  in functie van de frequentie')
ylabel('Capacitieve reactantie (\Omega)')
xlabel('Frequentie (Hz)')
hold off


