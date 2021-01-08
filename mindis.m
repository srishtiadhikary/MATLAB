function mindis=mindis(y1,x1,y2,x2)
for i=1:1:numel(y1)
     for j=1:1:numel(y2)
        if abs(x1(1,i)-x2(1,j))<1 && abs(y1(1,i)-y2(1,j))<1
            d(i,j)=(y1(1,i)+y2(1,j))/2;
        else
            d(i,j)=0;
        end
    end
end
% [x,y]=find(d == min(d(:)));
% mindis=(y1(1,x)+y2(1,y))/2;
%mindis=mean(nonzeros(d))
nonzeros(d)