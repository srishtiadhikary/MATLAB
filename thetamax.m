function thetamax=thetamax(m)
b=asin(1/m):0.01:(pi/2);
for i=1:1:numel(b)
f(1,i)=2*(1/tan(b(1,i)))*((m*m*sin(b(1,i))*sin(b(1,i)) -1)/(m*m*(1.4 + cos(2*b(1,i))) +2));
thet(1,i)=atan(f(1,i));
end
thetamax=max(thet); 