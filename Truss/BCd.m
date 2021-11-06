function f=BCd(s,disp)
for i=1:length(disp(:,1))
    a=disp(i,1);
    c=disp(i,3);
    if c==1
    s(:,2*a-1)=0;
    s(2*a-1,:)=0;
    s(2*a-1,2*a-1)=1;
    else
    s(:,2*a)=0;
    s(2*a,:)=0;
    s(2*a,2*a)=1;
    end
    
end
f=s;
