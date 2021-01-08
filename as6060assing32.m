m=4;
b=asin(1/m):0.01:(pi/2);
for i=1:1:numel(b)
    f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
    thet(1,i)=atan(f(1,i));
end
s=find(thet==max(thet));
for i=1:1:s
    thetu(1,i)=thet(1,i);
end
thetl=fliplr(thetu);
for i=1:1:s
    betau(1,i)=beta(m,thetu(1,i)*(180/pi),1.4,0);
    betal(1,i)=beta(m,thetl(1,i)*(180/pi),1.4,0);
    if m*sin(betau(1,i))>1
        [m2i(1,i),T3(1,i),P2(1,i),rho3(1,i),m3(1,i),Pt3(1,i),Ray3(1,i)]=flownormalshock(1.4,m*sin(betau(1,i)),'mach');
        m33(1,i)=abs(m3(1,i)/sin(betau(1,i)-thetu(1,i)));
    else
        m33(1,i)=0;
    end
    if m*sin(betal(1,i))>1
        [m4i(1,i),T4(1,i),P4(1,i),rho4(1,i),m4(1,i),Pt4(1,i),Ray4(1,i)]=flownormalshock(1.4,m*sin(betal(1,i)),'mach');
        m44(1,i)=abs(m4(1,i)/sin(betal(1,i)-thetl(1,i)));
    else
        m44(1,i)=0;
    end
end
for i=1:1:s
    for j=1:1:s
        if m33(1,i)>1 || m44(1,j)>1
            if thetu(1,i)>thetamax(m33(1,i)) || thetl(1,j)>thetamax(m44(1,j))
                thetaw1(1,i)=thetu(1,i);
                thetaw2(1,i)=thetl(1,j);
            else
                thetaw1(1,i)=0;
                thetaw2(1,i)=0;
            end
        end
    end
end
a1=nonzeros(thetaw1);
a2=nonzeros(thetaw2);
for i=1:1:numel(a2)
    a11(i,1)=a1(i,1);
end
plot(a11*(180/pi),a2*(180/pi))
                
              