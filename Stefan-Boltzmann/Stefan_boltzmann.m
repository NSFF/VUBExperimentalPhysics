clc
clear all

%% data

V= [0.784 0.993 1.190 1.388 1.586 1.783 1.980 2.18 2.37 2.57 2.77 2.97 3.16 3.36 3.56 3.76 3.96 4.15 4.34 4.55 4.74 4.94 5.14 5.34 5.54 5.74 5.94 6.11]; % V
V_stat_onz= [0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01];
V_sys_onz= 0.005.*V+V_stat_onz;
V_onz= sqrt(V_stat_onz.^2+V_sys_onz.^2)

I= [0.159 0.179 0.196 0.213 0.229 0.243 0.256 0.270 0.282 0.293 0.305 0.316 0.326 0.336 0.347 0.356 0.364 0.373 0.382 0.391 0.400 0.408 0.417 0.425 0.433 0.441 0.448 0.455]; % A
I_stat_onz= [0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001];
I_sys_onz= 0.01.*I+I_stat_onz;
I_onz= sqrt(I_stat_onz.^2+I_sys_onz.^2);

V_0= 0.642;
I_0= 0.142;

T_0= 26.5+273.15; %K
T_0_onz= 0.5;
R_0= 1.3;
R_0_onz= 0.01;
%R_0= V_0/I_0; % Ohm

T_0_ref= 20+273.15; % K

alpha= 0.0045; % (K)^-1
rho_0= 5.6*10^-8; % Ohm*m
epsilon= 1;
sigma= 5.67*10^-8; % W*m^-2*K^-4
%% formula

P= I.*V;
P_stat_onz= sqrt(I_stat_onz.^2.*V.^2+V_stat_onz.^2.*I.^2);
P_sys_onz= sqrt(I_sys_onz.^2.*V.^2+V_sys_onz.^2.*I.^2);
P_onz= sqrt(P_stat_onz.^2+P_sys_onz.^2);

R= V./I;
R_stat_onz= sqrt(V_stat_onz.^2.*(1./I).^2+I_stat_onz.^2.*(V./(I.^2)).^2);
R_sys_onz= sqrt(V_sys_onz.^2.*(1./I).^2+I_sys_onz.^2.*(V./(I.^2)).^2);

R_onz= sqrt(R_stat_onz.^2+R_sys_onz.^2);

T= ((R-R_0)./(alpha.*R_0))+T_0_ref
T_onz= sqrt(R_onz.^2*(1./(alpha.*R_0))^2+R_0_onz.^2*(R./(alpha.*R_0^2)).^2);

plot(P,T.^4)
%% fit
w= P_onz./mean(P_onz)

modelfun= @(a,T)(a(1)*(T.^a(2)-(a(3).^a(2))));
beta0= [10^-15 4 299.65];

[Omega R J covB MSE]= nlinfit(T,P,modelfun,beta0,'Weights',w);

fit_onz= sqrt(diag(covB))
fit_onz(2)
fit_onz(3)

Omega
Omega(1)
A= Omega(1)/sigma
A_onz= sqrt(fit_onz(1)^2*(1/sigma)^2)
%% plot
figure
hold on
errorbar(I,V,V_onz,'-r')
legend('data','Location', 'north')
title('Spanning over de gloeilamp in functie van de stroomsterkte')
xlabel('Stroomsterkte (A)')
ylabel('Spanning (V)')
hold off

figure
hold on
plot(Omega(1).*(T.^Omega(2)-Omega(3).^Omega(2)),T)
errorbar(P,T,T_onz,'.')

%legend('gefitte waarden','data') dit moet aangepast worden
title('Temperatuur in functie van het vermogen')
legend('gefitte waarden','data','Location', 'north')
xlabel('Vermogen (W)')
ylabel('Temperatuur (K)')
hold off
