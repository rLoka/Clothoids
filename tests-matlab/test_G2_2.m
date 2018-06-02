addpath('../matlab');

close all ;

x0     = -1 ;
y0     =  0 ;
theta0 =  pi/10 ;
kappa0 =  0 ;

x1     = 1 ;
y1     = 0 ;
theta1 = -pi/10 ;
kappa1 = -0.3 ;

S1 = ClothoidList();
ok = S1.build2arcG2(x0,y0,theta0,kappa0,x1,y1,theta1,kappa1)

%S2 = ClothoidList();
%ok = S2.buildCLC(x0,y0,theta0,kappa0,x1,y1,theta1,kappa1)

figure(1);
S1.plot();
%hold on
%S2.plot();

axis equal;

