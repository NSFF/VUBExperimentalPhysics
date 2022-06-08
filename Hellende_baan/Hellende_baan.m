m_wagen= 0.3004; %kg
g=9.81;

m_neerwaarts_1= 2.1*10^-3; %kg
m_neerwaarts_4=12.1*10^-3;
m_neerwaarts_5=13.2*10^-3;
m_neerwaarts_2=10.2*10^-3;
m_neerwaarts_3=11.3*10^-3;

m_neerwaarts= [m_neerwaarts_1 m_neerwaarts_2 m_neerwaarts_3 m_neerwaarts_4 m_neerwaarts_5];

m_opwaarts_1=24.3*10^-3; %kg
m_opwaarts_2=26.3*10^-3;
m_opwaarts_3=28.2*10^-3;
m_opwaarts_4=29.3*10^-3;
m_opwaarts_5=31.3*10^-3;

m_opwaarts= [m_opwaarts_1 m_opwaarts_2 m_opwaarts_3 m_opwaarts_4 m_opwaarts_5];

a_neerwaarts_1= mean([-0.607 -0.597 -0.594]); %m/s
a_neerwaarts_1_sigmas= [0.0066 0.0021 0.0029];
a_neerwaarts_1_sigma= sqrt(((a_neerwaarts_1_sigmas(1)^2)*(1/9))+((a_neerwaarts_1_sigmas(2)^2)*(1/9))+((a_neerwaarts_1_sigmas(3)^2)*(1/9)));

a_neerwaarts_2= mean([-0.267 -0.251 -0.271]);
a_neerwaarts_2_sigmas=[0.0014 0.0012 0.0028];
a_neerwaarts_2_sigma= sqrt(((a_neerwaarts_2_sigmas(1)^2)*(1/9))+((a_neerwaarts_2_sigmas(2)^2)*(1/9))+((a_neerwaarts_2_sigmas(3)^2)*(1/9)));

a_neerwaarts_3= mean([-0.234 -0.226 -0.238]);
a_neerwaarts_3_sigmas= [0.0018 0.0025 0.0013];
a_neerwaarts_3_sigma= sqrt(((a_neerwaarts_3_sigmas(1)^2)*(1/9))+((a_neerwaarts_3_sigmas(2)^2)*(1/9))+((a_neerwaarts_3_sigmas(3)^2)*(1/9)));

a_neerwaarts_4= mean([-0.332 -0.328 -0.343]);
a_neerwaarts_4_sigmas= [0.0019 0.0039 0.0016];
a_neerwaarts_4_sigma= sqrt(((a_neerwaarts_4_sigmas(1)^2)*(1/9))+((a_neerwaarts_4_sigmas(2)^2)*(1/9))+((a_neerwaarts_4_sigmas(3)^2)*(1/9)));

a_neerwaarts_5= mean([-0.301 -0.317 -0.315]);
a_neerwaarts_5_sigmas= [0.0049 0.0016 0.0013];
a_neerwaarts_5_sigma= sqrt(((a_neerwaarts_5_sigmas(1)^2)*(1/9))+((a_neerwaarts_5_sigmas(2)^2)*(1/9))+((a_neerwaarts_5_sigmas(3)^2)*(1/9)));

a_neerwaarts= [a_neerwaarts_1 a_neerwaarts_4 a_neerwaarts_5 a_neerwaarts_2 a_neerwaarts_3];
a_neerwaarts_sigma= [a_neerwaarts_1_sigma a_neerwaarts_2_sigma a_neerwaarts_3_sigma a_neerwaarts_4_sigma a_neerwaarts_5_sigma];

a_opwaarts_1= mean([0.0106 0.0120 0.0133]);
a_opwaarts_1_sigmas= [3.6 5.7 4.7]*10^-4;
a_opwaarts_1_sigma= sqrt(((a_opwaarts_1_sigmas(1)^2)*(1/9))+((a_opwaarts_1_sigmas(2)^2)*(1/9))+((a_opwaarts_1_sigmas(3)^2)*(1/9)));

a_opwaarts_2= mean([0.0648 0.0677 0.0681]);
a_opwaarts_2_sigmas= [0.0011 0.0011 0.0011];
a_opwaarts_2_sigma= sqrt(((a_opwaarts_2_sigmas(1)^2)*(1/9))+((a_opwaarts_2_sigmas(2)^2)*(1/9))+((a_opwaarts_2_sigmas(3)^2)*(1/9)));

a_opwaarts_3= mean([0.124 0.124 0.124]);
a_opwaarts_3_sigmas= [0.0014 0.0012 0.0018];
a_opwaarts_3_sigma= sqrt(((a_opwaarts_3_sigmas(1)^2)*(1/9))+((a_opwaarts_3_sigmas(2)^2)*(1/9))+((a_opwaarts_3_sigmas(3)^2)*(1/9)));

a_opwaarts_4= mean([0.152 0.151 0.151]);
a_opwaarts_4_sigmas= [0.0015 0.0025 0.0021];
a_opwaarts_4_sigma= sqrt(((a_opwaarts_4_sigmas(1)^2)*(1/9))+((a_opwaarts_4_sigmas(2)^2)*(1/9))+((a_opwaarts_4_sigmas(3)^2)*(1/9)));

a_opwaarts_5= mean([0.206 0.207 0.204]);
a_opwaarts_5_sigmas= [0.0025 0.0030 0.0024];
a_opwaarts_5_sigma= sqrt(((a_opwaarts_5_sigmas(1)^2)*(1/9))+((a_opwaarts_5_sigmas(2)^2)*(1/9))+((a_opwaarts_5_sigmas(3)^2)*(1/9)));

a_opwaarts= [a_opwaarts_1 a_opwaarts_2 a_opwaarts_3 a_opwaarts_4 a_opwaarts_5];
a_opwaarts_sigma= [a_opwaarts_1_sigma a_opwaarts_2_sigma a_opwaarts_3_sigma a_opwaarts_4_sigma a_opwaarts_5_sigma];

modelfun_1= @(a,x)(a(1)*x+a(2));
beta0_1=[30 30];
beta_1=nlinfit(m_neerwaarts,a_neerwaarts,modelfun_1,beta0_1);
hold on
%plot(m_neerwaarts,-(beta(1)*m_neerwaarts+beta(2)))
[omega_1,R_1,J_1,covB_1,MSE_1]=nlinfit(m_neerwaarts,a_neerwaarts,modelfun_1,beta0_1);
%errorbar(m_neerwaarts,-a_neerwaarts,a_neerwaarts_sigma)
%legend('gefitte waarden','experimentele waarden','Location','north')
%title('Versnelling in functie van de hangmassa')
%ylabel('Versnelling (m/s²)')
%xlabel('Massa (kg)')

Onzekerheid_fit_1=sqrt(diag(covB_1));
Onzekerheid_rico=Onzekerheid_fit_1(1);
Onzekerheid_M_1= sqrt(Onzekerheid_rico^2*(g/((beta_1(1))^2))^2)
Onzekerheid_b=Onzekerheid_fit_1(2);
M_1=g/beta_1(1)
m_min= (beta_1(2)*M_1)/g
Onzekerheid_m_min= sqrt(Onzekerheid_M_1^2*(beta_1(2)/g)^2+Onzekerheid_b^2*((g/beta_1(1))/g)^2)

beta0=[0 0.3];
modelfun= @(a,x)(((x-a(1))./(x+a(2))).*g);
beta=nlinfit(m_opwaarts,a_opwaarts,modelfun,beta0);
[omega,R,J,covB,MSE]=nlinfit(m_neerwaarts,a_neerwaarts,modelfun,beta0);
Onzekerheid_fit=sqrt(diag(covB));
Onzekerheid_m_plus=Onzekerheid_fit(1)
Onzekerheid_M=Onzekerheid_fit(2)
M=beta(2)
m_plus=beta(1)
plot(m_opwaarts,((m_opwaarts-beta(1))./(m_opwaarts+beta(2))).*g)
errorbar(m_opwaarts,a_opwaarts,a_opwaarts_sigma)
legend('gefitte waarden','experimentele waarden','Location','north')
title('Versnelling in functie van de hangmassa')
ylabel('Versnelling (m/s²)')
xlabel('Massa (kg)')

theta= asin((m_min+m_plus)/(2*0.3097))

hold off
