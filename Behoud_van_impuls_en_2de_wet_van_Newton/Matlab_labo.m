a05=[2.1 2.1 1.7];
a10=[3.4 3.4 3.4];
a15=[4.7 5.1 4.7];
a20=[6.0 6.4 6.4];
a25=[8.1 8.6 9.7];
a30=[9.4 9.4 9.8];
a35=[10.7 11.5 10.7];

%a05_std./mean(a05);

F05=[-0.54 -0.51 -0.50];
F10=[-1.02 -1.00 -1.03];
F15=[-1.52 -1.50 -1.53];
F20=[-2.03 -2.01 -2.15];
F25=[-2.50 -2.51 -2.49];
F30=[-3.03 -3.04 -3.01];
F35=[-3.52 -3.53 -3.56];

%F05_std./(-mean(F05));

a05_std= std(a05);
a10_std= std(a10);
a15_std= std(a15);
a20_std= std(a20);
a25_std= std(a25);
a30_std= std(a30);
a35_std= std(a35);

A_std= mean([a05_std a10_std a15_std a20_std a25_std a30_std a35_std]./[mean(a05) mean(a10) mean(a15) mean(a20) mean(a25) mean(a30) mean(a35)]);

A_std_list= [a05_std a10_std a15_std a20_std a25_std a30_std a35_std];

F05_std=std(F05);
F10_std=std(F10);
F15_std=std(F15);
F20_std=std(F20);
F25_std=std(F25);
F30_std=std(F30);
F35_std=std(F35);

F_std_list= [F05_std F10_std F15_std F20_std F25_std F30_std F35_std];

F_std= mean([F05_std F10_std F15_std F20_std F25_std F30_std F35_std]./[mean(F05) mean(F10) mean(F15) mean(F20) mean(F25) mean(F30) mean(F35)]);

%A_std>F_std dus de onzekerheid is het grootst bij A_std en moet bij gevolg
%op de y-as

atgem= [1.9667 3.4000 4.8333 6.2667 8.8000 9.5333 10.9667];
Ftgem= [-0.5167 -1.0167 -1.5167 -2.0633 -2.5100 -3.0267 -3.5367];
modelfun= @(a,x)(a(1)*x+a(2));
beta0=[0.290 0];
beta=nlinfit(atgem,Ftgem,modelfun,beta0);
[omega,R,J,covB,MSE]=nlinfit(atgem,Ftgem,modelfun,beta0);
fit_function= (-Ftgem/beta0(1))+beta0(2);
%beta= polyfit(atgem,Ftgem,1)
plot(-Ftgem,fit_function)
hold on

errorbar(-Ftgem,atgem,A_std_list)
legend('gefitte waarden','experimentele waarden','Location','north')
title('Versnelling in functie van de kracht')
ylabel('Versnelling (m/s)')
xlabel('Kracht (N)')
hold off

std(a05)
std(F05)
mean(a05)
mean(F05)

