function thetasonic=thetasonic(m)
b=asin(1/m):0.01:(pi/2);
for i=1:1:numel(b)
f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
thet(1,i)=atan(f(1,i));
end
for i=1:1:numel(b)
    if m*sin(b(1,i))>1
        [m2i(1,i),T3(1,i),P2(1,i),rho3(1,i),m3(1,i),Pt3(1,i),Ray3(1,i)]=flownormalshock(1.4,m*sin(b(1,i)),'mach');
        m33(1,i)=m3(1,i)/sin(b(1,i)-thet(1,i));
    else
        m33(1,i)=0;
    end
    if abs(m33(1,i)-1)<=10^-2
        cc(1,i)=thet(1,i);
    else
        cc(1,i)=0;
    end
end
thetasonic=mean(nonzeros(cc));