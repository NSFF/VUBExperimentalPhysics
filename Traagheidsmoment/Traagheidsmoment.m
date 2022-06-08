clc
clear all

g= 9.81; %m/s^2

l_meetlat= 50*10^-2; %m
w_meetlat= 5.2*10^-2; %m

m_frictie_meetlat= 'kleiner dan 5.2 +/- 0.05 gram';
m_frictie_meetlat_m_1= 8.2*10^-3; %+/- 0.05g
m_frictie_meetlat_m_2= 8.2*10^-3; %+/- 0.05g

m_1= 276.8*10^-3; %kg
m_2= 279.2*10^-3; %kg
m_meetlat= 583.7*10^-3; %kg

m_onz= 0.05*10^-3;

r_tandwiel= (2.55*10^-2)/2; %m
r_tandwiel_onz= 0.05*10^-2; %m

r_m_1= 20*10^-2; %m
r_m_2= 18*10^-2; %m
r_m_1_onz= 0.01;
r_m_2_onz= 0.01;

m_hanger_meetlat_m_1= 25.2*10^-3; %kg
m_hanger_meetlat_m_1_onz= 0.05*10^-3; %kg

a_meetlat_m_1= [0.00292 0.00269 0.00278 0.00277 0.00300];
a_meetlat_m_1_onz= [4.9 3.4 3.3 2.5 4.9].*10^-5;

a_mean_meetlat_m_1= mean(a_meetlat_m_1)
a_mean_meetlat_m_1_onz= mad(a_meetlat_m_1)

a_meetlat= [0.00518 0.00523 0.00158 0.00536 0.00558]; %m/s^2
a_meetlat_onz= [6.2 5.0 4.6 6.9 6.3].*10^-5;

a_mean_meetlat= mean(a_meetlat)
a_mean_meetlat_onz= mad(a_meetlat)

a_meetlat_m_2= [0.00418 0.00397 0.00326 0.00316 0.00346]; %m/s^2
a_meetlat_m_2_onz= [14 9.5 4.8 4.1 7.8].*10^-5; 

a_mean_meetlat_m_2= mean(a_meetlat_m_2)
a_mean_meetlat_m_2_onz= mad(a_meetlat_m_2)

I_meetlat_m_1_experimenteel= (r_tandwiel^2*(m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_1)))/a_mean_meetlat_m_1
I_meetlat_m_1_experimenteel_onz=sqrt(r_tandwiel_onz^2*(2*r_tandwiel*m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_1)/a_mean_meetlat_m_1)^2+m_hanger_meetlat_m_1_onz^2*(r_tandwiel^2*(g-a_mean_meetlat_m_1)/a_mean_meetlat_m_1)^2+a_mean_meetlat_m_1_onz^2*(r_tandwiel^2*m_hanger_meetlat_m_1*g/(a_mean_meetlat_m_1^2))^2)

I_meetlat_m_2_experimenteel= (r_tandwiel^2*(m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_2)))/a_mean_meetlat_m_2
I_meetlat_m_2_experimenteel_onz=sqrt(r_tandwiel_onz^2*(2*r_tandwiel*m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_2)/a_mean_meetlat_m_2)^2+m_hanger_meetlat_m_1_onz^2*(r_tandwiel^2*(g-a_mean_meetlat_m_2)/a_mean_meetlat_m_2)^2+a_mean_meetlat_m_2_onz^2*(r_tandwiel^2*m_hanger_meetlat_m_1*g/(a_mean_meetlat_m_2^2))^2)

I_meetlat_experimenteel= (r_tandwiel^2*(m_hanger_meetlat_m_1*(g-a_mean_meetlat)))/a_mean_meetlat
I_meetlat_experimenteel_onz= sqrt(r_tandwiel_onz^2*((2*r_tandwiel*m_hanger_meetlat_m_1*(g-a_mean_meetlat))/a_mean_meetlat)^2+ m_hanger_meetlat_m_1_onz^2*((r_tandwiel^2*(g-a_mean_meetlat))/a_mean_meetlat)^2+a_mean_meetlat_onz^2*((r_tandwiel^2*g)/a_mean_meetlat^2)^2)

I_m_1_experimenteel= I_meetlat_m_1_experimenteel-I_meetlat_experimenteel
I_m_1_experimenteel_onz= sqrt(r_tandwiel_onz^2*(((2*r_tandwiel*m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_1))/a_mean_meetlat_m_1)-((2*m_hanger_meetlat_m_1*(g-a_mean_meetlat))/a_mean_meetlat))^2+m_hanger_meetlat_m_1_onz^2*((r_tandwiel^2*(g-a_mean_meetlat_m_1)/a_mean_meetlat_m_1)-(r_tandwiel^2*(g-a_mean_meetlat)/a_mean_meetlat))^2+a_mean_meetlat_m_1_onz^2*((r_tandwiel^2*m_hanger_meetlat_m_1*g)/a_mean_meetlat_m_1^2)^2+a_mean_meetlat_onz^2*((r_tandwiel^2*m_hanger_meetlat_m_1*g)/a_mean_meetlat)^2)

I_m_2_experimenteel= I_meetlat_m_2_experimenteel-I_meetlat_experimenteel
I_m_2_experimenteel_onz= sqrt(r_tandwiel_onz^2*(((2*r_tandwiel*m_hanger_meetlat_m_1*(g-a_mean_meetlat_m_2))/a_mean_meetlat_m_2)-((2*m_hanger_meetlat_m_1*(g-a_mean_meetlat))/a_mean_meetlat))^2+m_hanger_meetlat_m_1_onz^2*((r_tandwiel^2*(g-a_mean_meetlat_m_2)/a_mean_meetlat_m_2)-(r_tandwiel^2*(g-a_mean_meetlat)/a_mean_meetlat))^2+a_mean_meetlat_m_2_onz^2*((r_tandwiel^2*m_hanger_meetlat_m_1*g)/a_mean_meetlat_m_2^2)^2+a_mean_meetlat_onz^2*((r_tandwiel^2*m_hanger_meetlat_m_1*g)/a_mean_meetlat)^2)

I_m_1_theoretisch= m_1*r_m_1^2
I_m_1_Theoretisch_onz= sqrt(m_onz^2*r_m_1^4+r_m_1_onz^2*(2*m_1*r_m_1)^2)

I_m_2_theoretisch= m_2*r_m_2^2
I_m_1_Theoretisch_onz= sqrt(m_onz^2*r_m_2^4+r_m_2_onz^2*(2*m_2*r_m_2)^2)

I_meetlat_theoretisch = 1/12 * m_meetlat *(l_meetlat^2 + w_meetlat^2)
I_meetlat_theoretisch_onz= 1/12*sqrt(m_onz^2*(l_meetlat^2+w_meetlat^2)^2+r_tandwiel_onz^2*(2*m_meetlat*l_meetlat)^2+r_tandwiel_onz^2*(2*m_meetlat*w_meetlat)^2)


%%%%%%%%%%%%%%%%    proef 2     %%%%%%%%%%%%%%%%%%%%

r_schijf= (22.8*10^-2)/2;
r_ring_2= 6*10^-2;
r_ring_1= 5.1*10^-2;

r_onz= r_tandwiel_onz;

m_schijf= 1.451; %kg
m_ring= 1.433; %kg
m_hang_proef_2= 55.2*10^-3; %kg

m_frictie_schijf= 7.2*10^-3; %kg
m_frictie_schijf_ring= 10.2*10^-3; %kg

a_schijf= [0.0156 0.0156 0.0157 0.0157 0.0158]; %m/s^2
a_schijf_onz= [1.5 1.4 1.7 1.0 1.4]*10^-5;

a_mean_schijf= mean(a_schijf)
a_mean_schijf_onz= mad(a_schijf)

a_schijf_ring= [0.00979 0.00992 0.00962 0.00990 0.00975];
a_schijf_ring_onz= [1.2 1.2 2.6 1.1 2.1].*10^-5;

a_mean_schijf_ring= mean(a_schijf_ring)
a_mean_schijf_ring_onz= mad(a_schijf_ring)

I_schijf_experimenteel= (r_tandwiel^2*m_hang_proef_2*(g-a_mean_schijf))/a_mean_schijf
I_schijf_experimenteel_onz= sqrt(r_tandwiel_onz^2*(2*r_tandwiel*m_hang_proef_2*(g-a_mean_schijf)/a_mean_schijf)^2+m_onz^2*(r_tandwiel^2*(g-a_mean_schijf)/a_mean_schijf)^2+a_mean_schijf_onz^2*(r_tandwiel^2*m_hang_proef_2*g/(a_mean_schijf^2))^2)

I_schijf_ring_experimenteel= (r_tandwiel^2*m_hang_proef_2*(g-a_mean_schijf_ring))/a_mean_schijf_ring
I_schijf_ring_experimenteel_onz= sqrt(r_tandwiel_onz^2*(2*r_tandwiel*m_hang_proef_2*(g-a_mean_schijf_ring)/a_mean_schijf_ring)^2+m_onz^2*(r_tandwiel^2*(g-a_mean_schijf_ring)/a_mean_schijf_ring)^2+a_mean_schijf_ring_onz^2*(r_tandwiel^2*m_hang_proef_2*g/(a_mean_schijf_ring^2))^2)

I_ring_experimenteel= I_schijf_ring_experimenteel- I_schijf_experimenteel
I_ring_experimenteel= sqrt(I_schijf_experimenteel_onz^2+I_schijf_ring_experimenteel_onz^2)

I_schijf_theoretisch= 0.5*m_schijf*r_schijf^2
I_schijf_theoretisch_onz= 0.5*sqrt(m_onz^2*(r_schijf^2)^2+r_onz^2*(2*r_schijf*m_schijf)^2)

I_ring_theoretisch= 0.5*m_ring*(r_ring_1^2+r_ring_2^2)
I_ring_theoretisch_onz= 0.5*sqrt(m_onz^2*(r_ring_1^2+r_ring_2^2)^2+r_onz^2*(2*m_ring*r_ring_1)^2+r_onz^2*(2*m_ring*r_ring_2)^2)

%%%%%%%%%%%%%     proef 3    %%%%%%%%%%%%%%%%%%%%%%

omega_begin= [4.09 3.28 5.26 7.15 5.23]; %rad/s
omega_eind= [2.41 2.11 3.39 4.57 3.12]; %rad/s

L_1= omega_begin.*I_schijf_experimenteel;
L_1_onz= I_schijf_experimenteel_onz.*omega_begin;

L_2= omega_eind.*I_schijf_ring_experimenteel;
L_2_onz= I_schijf_ring_experimenteel_onz.*omega_eind;

L_verhouding= mean(L_1./L_2)
L_verhouding_onz= mad(L_1./L_2)

KE_begin= mean(0.5* I_schijf_experimenteel.*omega_begin.^2)
KE_begin_onz= mad(0.5* I_schijf_experimenteel.*omega_begin.^2)

KE_eind= mean(0.5* I_schijf_ring_experimenteel.*omega_eind.^2)
KE_eind_onz= mad(0.5* I_schijf_ring_experimenteel.*omega_eind.^2)

KE_begin_test= 0.5* I_schijf_experimenteel.*omega_begin.^2
KE_eind_test= 0.5* I_schijf_ring_experimenteel.*omega_eind.^2
KE_verhouding_test=mean((KE_begin_test-KE_eind_test)./KE_begin_test)
KE_verhouding_test_onz=mad((KE_begin_test-KE_eind_test)./KE_begin_test)

KE_verhouding= (KE_begin-KE_eind)/KE_begin
KE_verhouding_onz= sqrt(KE_begin_onz^2*(KE_eind/KE_begin^2)^2+KE_eind_onz^2/KE_begin^2)


