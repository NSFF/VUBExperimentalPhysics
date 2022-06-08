clc 
clear all
frequentie= 16; %Hz
T_theoretisch= 62.5*10^-3; %ms
T_g= 30.4*10^-3;
T_g_onzekerheid= 0.005*10^-3; %ms alle t's
vg=348.4351;
vg_onz= 2.5898;

T1= 2.67*10^-3;
T4= 9.88*10^-3;
T5= 12.6*10^-3;

L5= vg*T5/5
L5_fout= sqrt(vg_onz^2*(T5/5)^2+T_g_onzekerheid^2*(vg/5)^2)
L4= vg*T4/4
L4_fout= sqrt(vg_onz^2*(T4/5)^2+T_g_onzekerheid^2*(vg/5)^2)
L1= vg*T1/1
L1_fout= sqrt(vg_onz^2*(T1/5)^2+T_g_onzekerheid^2*(vg/5)^2)
Lg= vg*T_g/11
Lg_fout= sqrt(vg_onz^2*(T_g/5)^2+T_g_onzekerheid^2*(vg/5)^2)

Echte_waarde= 93.7-3.5
Echte_waarde_fout= 0.4243
