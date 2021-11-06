function f=BCf(force,node,element,disp,K)
F=zeros(length(node(:,1))*2,1);

for i=1:length(element(:,1))
    L(i)=((node(element(i,3),2)-node(element(i,2),2))^2+(node(element(i,3),3)-node(element(i,2),3))^2)^.5;
end

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
% for i=1:length(F(:,1))
%     for j=1:length(disp(:,1))
%         if i~=disp(j,1)
%             F(i,1)=F(i,1)-K(i,j)*disp(j,2);
%         else
%             F(i,1)=disp(j,2);
%         end
%     end
% end

f=F;

end