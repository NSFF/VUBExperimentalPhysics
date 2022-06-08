I= ([9.94 15.11 20.8 25.8 31.0].*10^-3);
Delta_V= [2.28 3.47 4.64 5.77 6.92];
E= [2.97 4.52 6.04 7.51 9.01];
x1= 0:0.5:10;

%plot(Delta_V,I)
poly2= polyfit(Delta_V,I,1);
y2=poly2(1).*x1+poly2(2);
plot(x1,y2)
hold on

%mean(E)/Ri


for j=1:5
x=[Delta_V(j) E(j)];
y=[I(j) 0];
poly=polyfit(x,y,1);

y1=poly(1).*x1+poly(2);
Ri2(j)=E(j)/poly(2);
plot(x1,y1)
hold on
end
axis([0 10 0 0.150]) 
%plot(x,y)
legend('karakteristiek van de weerstand','belastingslijn E= 3.0V','belastingslijn E= 4.5V','belastingslijn E= 6.0V','belastingslijn E= 7.5V','belastingslijn E= 9.0V')
title('Stroomsterkte in functie van het spanningsverval')
ylabel('Stroomsterkte (A)')
xlabel('Spanningsverval (V)')
%plot(Delta_V, (E-Delta_V)./Ri)
hold off
Ri2;
Ri1= (E-Delta_V)./I;

Ri2_mean=mean(Ri2);
Ri2_mad=mad(Ri2);

Ri1_mean=mean(Ri1);
Ri1_mad=mad(Ri1);

