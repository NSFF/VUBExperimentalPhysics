E= 6.04;
Delta_V= [2.24 5.06 5.92 6.02];
Im= [57.7 14.79 1.745 0.183].*10^-3; %mili-ampère
R=[33.4 328 3270 32600];

RiA= Delta_V./Im-R
I0=Im.*(1+RiA./R)
Isys=I0-Im