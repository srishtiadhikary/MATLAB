m=2.8;
b=asin(1/m):0.01:(pi/2);
for i=1:1:numel(b)
f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
thet(1,i)=atan(f(1,i));
end
for i=1:1:numel(b)
    if m*sin(b(1,i))>1
        [m1(1,i),T1(1,i),P1(1,i),rho1(1,i),m2(1,i),Pt(1,i),Ray1(1,i)]=flownormalshock(1.4,m*sin(b(1,i)),'mach');
        m22(1,i)=m2(1,i)/sin(b(1,i)-thet(1,i));
    else 
        m22(1,i)=0;
    end
end
for i=1:1:numel(m22)
    if m22(1,i)>1
        aa(1,i)=1;
    else
        aa(1,i)=0;
    end
end
so=sum(aa);
%% detachment criterion
for i=1:1:so
    if m22(1,i)>1
        thet2(1,i)=thetamax(m22(1,i));
        if abs(thet(1,i)-thet2(1,i))<10^-2
            thetd(1,i)=thet(1,i);
        else
            thetd(1,i)=0;
        end
    else 
        thetd(1,i)=0;
    end
end
a=mean(nonzeros(thetd))*(180/pi)
a1=beta(m,a,1.4,0)

%% von neumann criterion
pr=(2.8*m^2 - 0.4)/2.4;
for i=1:1:so
    if thet(1,i)<thetamax(m22(1,i))
        b2(1,i)=beta(m22(1,i),thet(1,i)*(180/pi),1.4,0)*(pi/180);
    else
        b2(1,i)=0;
    end
    if m22(1,i)*sin(b2(1,i))>1
        [m2i(1,i),T3(1,i),P2(1,i),rho3(1,i),m3(1,i),Pt3(1,i),Ray3(1,i)]=flownormalshock(1.4,m22(1,i)*sin(b2(1,i)),'mach');
        pv(1,i)=P1(1,i)*P2(1,i);
    else
        pv(1,i)=0;
    end
    if abs(pv(1,i)-pr)<1
        thetav(1,i)=thet(1,i);
    else
        thetav(1,i)=0;
    end
end
b=mean(nonzeros(thetav))*(180/pi)
b1=beta(m,b,1.4,0)
%% sonic criterion
for i=1:1:so
    thet3(1,i)=thetasonic(m22(1,i));
    if abs(thet3(1,i)-thet(1,i))<10^-2
        thetas(1,i)=thet(1,i);
    else
        thetas(1,i)=0;
    end
end
c=mean(nonzeros(thetas))*(180/pi)
c1=beta(m,c,1.4,0)



