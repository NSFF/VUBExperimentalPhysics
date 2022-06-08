clc
clear all

%%%%%%% Proef 1 %%%%%%%%

C=7.1*10^-5; %Nm/rad
mu_0= 4*pi*10^-7;
L=31.5*10^-2; %m
N= 80;
I=1.0; %A

N_list_proef_1= [N N 2*N 2*N];
I_list_proef_1= [I 2*I 0.5*I I];
Theta_proef_1= [63 124 63 125].*(2*pi/360);
var_1= 0.5;
Theta_proef_1_onz= sqrt(var_1^2+var_1^2)*2*pi/360

%M= [];
%for grr= 1:numel(N_list_proef_1)
%    M(grr)= -(Theta(grr)*L)/(mu_0*N_list_proef_1(grr)*I_list_proef_1(grr));
%end
%M;

%%%%%%% proef 2 %%%%%%

I_list_proef_2= [0.5*I I 1.5*I 2*I];
Theta_proef_2= [32 62 94 124]*2*pi/360;
B_proef_2=[];
for grr= 1:numel(I_list_proef_2)
    B_proef_2(grr)=(mu_0*I_list_proef_2(grr)*N)/L;
end
B_proef_2
%stroomsterkte beschouwen we als foutloos
var_2= 5*10^-4;

B_proef_2_onz=[];
for grr= 1:numel(B_proef_2)
    B_proef_2_onz(grr)= sqrt(var_2^2*((mu_0*I_list_proef_2(grr)*N)/L^2)^2);
end
B_proef_2_onz

M_proef_2=[];
for grr= 1:numel(I_list_proef_2)
    M_proef_2(grr)=C*Theta_proef_2(grr)/B_proef_2(grr);
end
M_proef_2;
M_proef_2_onz= [];
for grr= 1:numel(I_list_proef_2)
   M_proef_2_onz(grr)= sqrt((C/B_proef_2(grr))^2*Theta_proef_1_onz^2+((C*Theta_proef_2(grr))/B_proef_2(grr))^2*B_proef_2_onz(grr)); 
end
M_proef_2_onz;
M_proef_2= ((M_proef_2(1)/M_proef_2_onz(1)^2)+(M_proef_2(2)/M_proef_2_onz(2)^2)+(M_proef_2(3)/M_proef_2_onz(3)^2)+(M_proef_2(4)/M_proef_2_onz(4)^2))/((1/M_proef_2_onz(1)^2)+(1/M_proef_2_onz(2)^2)+(1/M_proef_2_onz(3)^2)+(1/M_proef_2_onz(4)^2))

M_proef_2_onz= sqrt(1/((1/M_proef_2_onz(1)^2)+(1/M_proef_2_onz(2)^2)+(1/M_proef_2_onz(3)^2)+(1/M_proef_2_onz(4)^2)))

%%%%¨proef 3 %%%%
%%%% proef 4 %%%%


I_list_proef_4= [50 60 70 80 90]*10^-3;
Theta_proef_4= [46 49 52 54 58]*2*pi/360;
N= 200;

B_proef_4=[];
for grr= 1:numel(I_list_proef_4)
    B_proef_4(grr)=(mu_0*2*80)/L;
end
B_proef_4
%stroomsterkte beschouwen we als foutloos
var_2= 5*10^-4;

B_proef__onz=[];
for grr= 1:numel(B_proef_4)
    B_proef_4_onz(grr)= sqrt(var_2^2*((mu_0*2*80)/L^2)^2);
end
B_proef_4_onz

M_proef_4=[];
for grr= 1:numel(I_list_proef_4)
    M_proef_4(grr)=C*Theta_proef_4(grr)/B_proef_4(grr);
end
M_proef_4
M_proef_4_onz= [];
for grr= 1:numel(I_list_proef_4)
   M_proef_4_onz(grr)= sqrt((C/B_proef_4(grr))^2*Theta_proef_1_onz^2+((C*Theta_proef_4(grr))/B_proef_4(grr))^2*B_proef_4_onz(grr)); 
end
M_proef_4_onz

r_1= 27.5*10^-3;
r_2= 30*10^-3;
M_theoretisch= [];
for grr= 1:numel(I_list_proef_4)
    M_theoretisch(grr)= 200*I_list_proef_4(grr)*pi*(r_1^2+r_2^2)/2;
end
M_theoretisch
