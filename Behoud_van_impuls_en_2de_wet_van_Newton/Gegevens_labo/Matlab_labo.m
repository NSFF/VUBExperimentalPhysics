a05=[2.1 2.1 1.7];
a10=[3.4 3.4 3.4];
a15=[4.7 5.1 4.7];
a20=[6.0 6.4 6.4];
a25=[8.1 8.6 9.7];
a30=[9.4 9.4 9.8];
a35=[10.7 11.5 10.7];

F05=[-0.54 -0.51 -0.50];
F10=[-1.02 -1.00 -1.03];
F15=[-1.52 -1.50 -1.53];
F20=[-2.03 -2.01 -2.15];
F25=[-2.50 -2.51 -2.49];
F30=[-3.03 -3.04 -3.01];
F35=[-3.52 -3.53 -3.56];

a05_std= std(a05);
a10_std= std(a10);
a15_std= std(a15);
a20_std= std(a20);
a25_std= std(a25);
a30_std= std(a30);
a35_std= std(a35);

F05_std=std(F05);
F10_std=std(F10);
F15_std=std(F15);
F20_std=std(F20);
F25_std=std(F25);
F30_std=std(F30);
F35_std=std(F35);

atgem = [1.9667 3.4000 4.8333 6.2667 8.8000 9.5333 10.9667];
Ftgem = [-0.5167 -1.0167 -1.5167 -2.0633 -2.5100 -3.0267 -3.5367];

beta = polyfit(atgem,Ftgem,1)

x = atgem
y =  -(beta(1) .* (atgem+beta(2)))

plot(x,y,1)
errorbar(x,y,)




