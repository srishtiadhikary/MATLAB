n=0:0.01:3;
for i=1:1:numel(n)
    v(1,i)=sqrt(n(1,i)*658.9629);
end
v2=v(1,301):0.01:66.69;
for i=1:1:numel(v2)
    n2(1,i)=3;
end
n3=0:0.01:3;
for i=1:1:numel(n3)
    v3(1,i)=66.69;
end
% x=[31.765,44.46,44.45,41.7,41.7,41.7,48.1614];
% y=[1.4,0.89816,1,1,0.99,0.99,3.999];
plot(v,n)
ylim([0 5])
xlabel('Veq')
ylabel('n')
title('V-n plot')
hold on
plot(v2,n2)
hold on
plot(v3,n3)
hold on
%scatter(x,y,20)
scatter(31.765,1.4,20)
%text(31.8,1.46,'pull up maneuver','fontsize',7)
hold on
scatter(44.46,0.89816,20)
%text(44.6,0.9,'climb','fontsize',7)
hold on
scatter(44.5,1,20)
%text(44.6,1.2,'start cruise','fontsize',7)
hold on
scatter(41.7,1,20)
%text(42,1.2,'end cruise','fontsize',7)
hold on
scatter(41.7,0.99,20)
%text(41.8,0.9,'start and end glide','fontsize',7)
hold on
scatter(48.16,3.99,20)
%text(49,4.1,'turn','fontsize',7)
legend('Clmax','n max','dive speed','pull up','climb','start cruise','endcruise','start and end glide','turn')
hold off