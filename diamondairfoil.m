m=3;
aoa=5*(pi/180);
tw=10*(pi/180);
tau=tw-aoa;
tal=tw+aoa;
%% upper half of airfoil
bu=beta(3,tau*(180/pi),1.4,0)*(pi/180);
[mu,T1,P1,rho1,m2,Pt1,Ray1]=flownormalshock(1.4,m*sin(bu),'mach');
m2u=m2/sin(bu-tau);
m3u=InvPrandtlMeyer((0.3490658 + prandtlmeyer(m2u))*(180/pi));
P3u=P1*((1+0.2*m2u*m2u)/(1+0.2*m3u*m3u))^(3.5);
%% lower half of airfoil
bl=beta(3,tal*(180/pi),1.4,0)*(pi/180);
[ml,T2,P2,rho2,m3,Pt2,Ray2]=flownormalshock(1.4,m*sin(bl),'mach');
m2l=m3/sin(bl-tal);
m3l=InvPrandtlMeyer((0.3490658 + prandtlmeyer(m2l))*(180/pi));
P3l=P2*((1+0.2*m2l*m2l)/(1+0.2*m3l*m3l))^(3.5);
%% deflection angle

        
    