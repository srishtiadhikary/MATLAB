function normalsbli(m)
% assuming P1= 1 atm
%% first oblique shock
P2=1+(6*0.7*sqrt(2*0.0014))*m*m*((m*m -1)^(-0.25));
beta2=asin((1/m)*sqrt((P2*1.2-1.2)/1.4 + 1));
[~,~,~,~,m2n,~,~]=flownormalshock(1.4,m*sin(beta2),'mach');
theta2=tbm(m,beta2*(180/pi));
m2=m2n/sin(beta2-theta2);
%% normal shock 
[~,~,P4,~,~,~,~]=flownormalshock(1.4,m,'mach');
%% second oblique shock and slipline
P3=P4/P2;
beta3=asin((1/m2)*sqrt((P3*1.2-1.2)/1.4 + 1));
theta3=tbm(m2,beta3*(180/pi))*(180/pi);
