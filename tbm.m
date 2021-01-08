function Theta=tbm(m,bb)
b=bb*(pi/180);
f=2*(1/tan(b))*((m*m*sin(b)*sin(b) -1)/(m*m*(1.4 + cos(2*b)) +2));
thet=atan(f);
Theta=thet;
