clc;clear
syms x y

xs = [4,4,0,2,2,4];
ys = [0,4,4,4,2,2];

us = [0.002,0.005,0.005,0,0.0003,0.0005];
vs = [0,0.0002,0.005,0.001,0.0001,0.001];

E = 45e6;
nu = 0.2;
t = 0.3;

xc = 4*2/3;
yc = 4*2/3;

X =  [1 xs(1) ys(1) xs(1)^2 xs(1)*ys(1) ys(1)^2 0 0 0 0 0 0;
      1 xs(2) ys(2) xs(2)^2 xs(2)*ys(2) ys(2)^2 0 0 0 0 0 0;
      1 xs(3) ys(3) xs(3)^2 xs(3)*ys(3) ys(3)^2 0 0 0 0 0 0;
      1 xs(4) ys(4) xs(4)^2 xs(4)*ys(4) ys(4)^2 0 0 0 0 0 0;
      1 xs(5) ys(5) xs(5)^2 xs(5)*ys(5) ys(5)^2 0 0 0 0 0 0;
      1 xs(6) ys(6) xs(6)^2 xs(6)*ys(6) ys(6)^2 0 0 0 0 0 0;
      0 0 0 0 0 0 1 xs(1) ys(1) xs(1)^2 xs(1)*ys(1) ys(1)^2;
      0 0 0 0 0 0 1 xs(2) ys(2) xs(2)^2 xs(2)*ys(2) ys(2)^2;
      0 0 0 0 0 0 1 xs(3) ys(3) xs(3)^2 xs(3)*ys(3) ys(3)^2;
      0 0 0 0 0 0 1 xs(4) ys(4) xs(4)^2 xs(4)*ys(4) ys(4)^2;
      0 0 0 0 0 0 1 xs(5) ys(5) xs(5)^2 xs(5)*ys(5) ys(5)^2;
      0 0 0 0 0 0 1 xs(6) ys(6) xs(6)^2 xs(6)*ys(6) ys(6)^2];


a = inv(X)*([us vs]');

Mstar = [1 x y x^2 x*y y^2 0 0 0 0 0 0;
         0 0 0 0 0 0 1 x y x^2 x*y y^2];

Mprime = [0 1 0 2*x y 0 0 0 0 0 0 0;
          0 0 0 0 0 0 0 0 1 0 x 2*y;
          0 0 1 0 x 2*y 0 1 0 2*x y 0];

N = Mstar * inv(X);
B = Mprime * inv(X);

strain = Mprime * a

area = 4*4/2;

beta = diff(N(1,1:6),x)*2*area;

gamma = diff(N(1,1:6),y)*2*area;


strain = 1/(2*area)*[sum(beta.*us);
                   sum(gamma.*vs);
                   sum(gamma.*us)+sum(beta.*vs)]

stress = E/(1-nu^2)*[1 nu 0;nu 1 0;0 0 (1-nu)/2]*strain

% subtituting coordinates of centroid
centroid_strain = vpa(subs(strain,[x,y],[xc,yc]))
centroid_stress = vpa(subs(stress,[x,y],[xc,yc]))

