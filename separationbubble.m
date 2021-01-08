function separationbubble(m,theta11)
%theta11 in degrees
%% region 1
theta1=theta11*(pi/180);
beta1=beta(m,13,1.4,0);
[m0,T1,P1,rho1,m1n,Pt1,Ray1]=flownormalshock(1.4,m*sin(beta1*(pi/180)),'mach');
m1=m1n/sin(beta1*(pi/180)-theta1);
%% region 2
P2=1+(6*0.7*sqrt(2*0.0014))*m*m*((m*m -1)^(-0.25));
beta2=asin((1/m)*sqrt((P2*1.2-1.2)/1.4 + 1));
[m02,T2,P22,rho2,m2n,Pt2,Ray2]=flownormalshock(1.4,m*sin(beta2),'mach');
theta2=tbm(m,beta2*(180/pi));
m2=m2n/sin(beta2-theta2);
%% region 3
s1=shockpolarp(m1,-theta11,P1); 
s2=-shockpolarp(m2,theta2*(180/pi),P2)+2*theta2*(180/pi);
pr1=shockpolarp1(m1,-theta11,P1);
pr2=shockpolarp1(m2,theta2*(180/pi),P2)+2*theta2*(180/pi);
%c=min(numel(s1),numel(s2));
% for i=1:1:c
%     s11(1,i)=s1(1,i);
%     s22(1,i)=s2(1,i);
%     pr11(1,i)=pr1(1,i);
%     pr22(1,i)=pr2(1,i);
% end
slip=mindis(s1,pr1,s2,pr2)*(pi/180)
% slip=-0.251097*(pi/180);
% theta3=(theta2-slip);
% beta3=beta(m2,theta3*(180/pi),1.4,0)*(pi/180);
% [m03,T3,P3,rho3,m3n,Pt3,Ray3]=flownormalshock(1.4,m2*sin(beta3),'mach');
% m3=m3n/sin(beta3-theta3);
% %% region 4
% k=(1/P3)^(1/3.5);
% m4=sqrt((1+0.2*m3*m3 -k)/(k*0.2));
% thetaturn=prandtlmeyer(m4)-prandtlmeyer(m3);
% %% region 5
% theta5=thetaturn-slip;
% beta5=beta(m4,theta5*(180/pi),1.4,0)*(pi/180);
% [m05,T5,P5,rho5,m5n,Pt5,Ray5]=flownormalshock(1.4,m4*sin(beta5),'mach');
% m5=m5n/sin(beta5-theta5);