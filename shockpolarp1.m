function shockpolarp1=shockpolarp1(m,x,p0)
%x is the amount to be shifted on x axis in degrees(for wedge problems)
%po is the pressure ratio  to be multiplied
%gamma=1.4 assumed
b=asin(1/m):0.0001:pi/2;
for i=1:1:numel(b)
f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
thet(1,i)=atan(f(1,i));
end
[xx,yy]=find(thet == max(thet(:)));
for i=1:1:yy
    thet1(1,i)=thet(1,i);
end
%% ratios
for i=1:1:yy
    if m*sin(b(1,i))>=1
        prat(1,i)=(1 + (1.4/1.2)*((m*sin(b(1,i)))^2 - 1))*p0;
    end
end
for i=1:1:yy
    b(1,i)=prat(1,i);
end
%a=reshape(aa,yy,2);
shockpolarp1=b;
