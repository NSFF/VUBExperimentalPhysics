clc
clear all


Delta_x= [7.8 16.8 23.7 30.8 39.7 45.2 51.9 55.9 66].*10^-2;
Onz_Delta_x= [0.4243 0.4243 0.4243 0.4243 0.4243 0.4243 0.4243 0.4243 0.4243].*10^-2;

Delta_t= [0.21 0.5 0.67 0.87 1.13 1.29 1.48 1.59 1.9].*10^-3;
Onz_Delta_t= [0.0071 0.0071 0.0071 0.0071 0.0071 0.0071 0.0071 0.0071 0.0071].*10^-3;

modelfun_temp= @(a,x)((331+0.60*a(1))*x+a(2));
modelfun_fit1= @(a,x)(a(1)*x+a(2));
beta0_fit1= [343 0];%waarden waar je denkt dat de punten zullen liggen
beta0_temp= [23 0];
[omega_fit R J covB_fit MSE_fit]= nlinfit(Delta_t,Delta_x,modelfun_fit1,beta0_fit1);
[omega_temp R J covB_temp MSE_temp]= nlinfit(Delta_t,Delta_x,modelfun_temp,beta0_temp);

Temp= omega_temp(1)
Onzekerheid_temp= sqrt(diag(covB_temp))
B_temp= omega_temp(2)
v_geluid= omega_fit(1)
Onzekerheid_fit= sqrt(diag(covB_fit))
B_fit= omega_fit(2)

hold all
plot(Delta_t,v_geluid*Delta_t+B_fit)
errorbar(Delta_t,Delta_x,Onz_Delta_x,'.')
legend({'348.4x + 0.0021','data'},'Location','north')
title('Positie in functie van de tijd')
ylabel('Positie (m)')
xlabel('tijd (s)')
