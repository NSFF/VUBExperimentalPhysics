t_proef1= [3.000 5.077 6.929 10.145 14.952 19.960 29.954 35.063 45.011 50.093 59.986 75.073 89.932 105.100 119.990];
V_proef1= [1.0 1.7 2.0 2.7 3.5 4.0 4.6 4.9 5.1 5.2 5.2 5.3 5.3 5.3 5.3].*3;
R=29.1*10^6 %RC(1/beta(2))/R =>C

%%%%%%%%%%%%%%%%%%%%%
Vt= 2.0;
V0= 19.5;
t_C3= [11.954 12.378 12.425 12.213 12.280];
t_C2= [8.843 8.680 8.858 8.919 8.559];
t_C1= [17.783 17.667 17.711 17.718 17.793];
t_C1_C2_paral= [26.345 25.850 26.185 26.277 26.352];
t_C1_C2_serie= [6.082 6.256 6.233 6.377 6.257];

t_C3_mean= mean(t_C3);
t_C2_mean= mean(t_C2);
t_C1_mean= mean(t_C1);
t_C1_C2_paral_mean= mean(t_C1_C2_paral);
t_C1_C2_serie_mean= mean(t_C1_C2_serie);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
modelfun= @(a,x) a(1)*(1-exp(-a(2)*x));
beta0= [20 0];
beta=nlinfit(t_proef1,V_proef1,modelfun,beta0)
%[omega,R,J,covB,MSE]= nlinfit(t_proef1,V_proef1,modelfun,beta0);
%sqrt(diag(covB));
hold on
plot_functie=beta(1).*(1-exp(-beta(2).*t_proef1));
plot(t_proef1,plot_functie)
plot(t_proef1,V_proef1)
plot([0,120],[16,16],'black-.')
legend({'gefitte waarden','gemeten waarden'},'Position',[0.6,0.75,0.25,0.1])
title('Spanningsverschil in functie van de tijd')
ylabel('Spanningsverschil (V)')
xlabel('tijd (s)')
axis([0 120 0 16.5])
hold off

C3= (1/beta(2))/R
Onzekerheid_C3= 6.187435616*10^-9

Ri= mean([11.954 12.378 12.425 12.213 12.280])/(C3*log(19.5/2))

t_C1_C2_serie_mean
C_serie_test= t_C1_mean*t_C2_mean/(t_C1_mean+t_C2_mean)
t_C1_C2_paral_mean
C_paral_test= t_C1_mean+t_C2_mean
