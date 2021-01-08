function shockpolar=shockpolar(m,x,p0)
%x is the amount to be shifted on x axis in degrees(for wedge problems)
%po is the pressure ratio  to be multiplied
%gamma=1.4 assumed
b=asin(1/m):0.0001:pi/2;
for i=1:1:numel(b)
f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
thet(1,i)=atan(f(1,i));
end
%% ratios
for i=1:1:numel(b)
    if m*sin(b(1,i))>=1
        prat(1,i)=(1 + (1.4/1.2)*((m*sin(b(1,i)))^2 - 1))*p0;
        rrat(1,i)=(2.4*(m*sin(b(1,i)))^2)/(0.4*(m*sin(b(1,i)))^2 + 2);
        trat(1,i)=prat(1,i)/rrat(1,i);
        [m1(1,i),T1(1,i),P1(1,i),rho1(1,i),m2(1,i),Pt(1,i),Ray1(1,i)]=flownormalshock(1.4,m*sin(b(1,i)),'mach');
        m33(1,i)=m2(1,i)/sin(b(1,i)-thet(1,i));
    end
end
plot(thet*(180/pi)+x,prat)
xlabel('theta in deg')
ylabel('downstream mach number')
hold on
plot(-thet*(180/pi)+x,prat)
hold off
xlim([-50 50])
for i=1:1:numel(b)
    a(1,i)=thet(1,i)*(180/pi)+x;
end
% %ta=tall(a);
% shockpolar=a;


