function f=BCf(force,node,element,disp,K,ff)
F=zeros(length(node(:,1))*2,1);


for i=1:length(force(:,1))
    flag=force(i,1);
    a=force(i,2);
    b=force(i,3);
    c=force(i,4);
    if flag==1
        F(2*a-1,1)=b+F(2*a-1,1);
        F(2*a,1)=c+F(2*a,1);
    end
    % if flag==2
    %     F(element(a,2),1)=L(a)*b*0.5+F(element(a,2),1);
    %     F(2*element(a,3)-1,1)=L(a)*b*0.5+F(2*element(a,3)-1,1);
    % end
    %  if flag==3
    %     F(element(a,2),1)=-1*element(a,4)*element(a,5)*element(a,6)*b+F(element(a,2),1);
    %     F(element(a,3),1)=1*element(a,4)*element(a,5)*element(a,6)*b+F(element(a,3),1);
    % end
end

if ff==1
for j=1:length(disp(:,1))
    a=disp(j,1);
    b=disp(j,2);
    c=disp(j,3);
    if c==1
        F(2*a-1,1)=b;
    end
    if c==2
        F(2*a,1)=b;
    end
end
end



f=F;

end