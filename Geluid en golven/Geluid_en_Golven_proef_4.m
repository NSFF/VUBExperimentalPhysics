clc
clear all
L= [83.5 70.8 58 45.5 33]*10^-2;
n= 7:-1:3;
D= L./n;
D_std= std(D)
D_mean= mean(D)

Lambda= 2*D_mean
Lambda_onz= sqrt(D_std^2*4)

Lengte= 8*Lambda/2
Lengte_onze=sqrt(Lambda_onz^2*9)

vg= Lambda*1360
vg_onze=sqrt(Lambda_onz^2*(1360)^2)