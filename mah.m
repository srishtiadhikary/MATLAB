%% differential solution
x=0:0.01:1;
for i=1:1:numel(x)
    c= (exp(x) + exp(2-x))/(1+exp(2));
end
%% finite difference method
h=0.01;
a=zeros(numel(x)+1);
a(1,1)=1;
for i=2:1:numel(x)
    a(i,i)=-(2+h*h);
    a(i,i-1)=1;
    a(i,i+1)=1;
end
a(numel(x)+1,numel(x)+1)=1;
a(numel(x)+1,numel(x)-1)=-1;
for i=1:1:numel(x)+1
    b(i,1)=0;
end
b(1,1)=1;
cc=inv(a)*b;
c1=transpose(cc);
for i=1:1:numel(x)
    c2(1,i)=c1(1,i);
end
e=c-c2;
plot(x,e)
% hold on
% scatter(x,c2)
% legend('differential equation', 'finite difference method')
xlabel('x')
ylabel('error')
