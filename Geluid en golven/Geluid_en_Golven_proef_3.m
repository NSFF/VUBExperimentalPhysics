clc
clear all

vg=348.4351;
vg_onz= 2.5898;

freq_0= 182
freq= [182 340 560 700 820 990 1175 1360];
n= 1:8;

freq_grondtoon_delen= freq./n;
grondtoon_mean= mean(freq_grondtoon_delen)
grondtoon_std= std(freq_grondtoon_delen)

L= vg/(2*grondtoon_mean)
L_onz= sqrt(vg_onz^2*(1/(2*grondtoon_mean))^2+grondtoon_std^2*(vg/(2*grondtoon_mean^2))^2)