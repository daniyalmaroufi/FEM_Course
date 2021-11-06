function k=k_matrix_local(node,element)
len=length(node(:,1));

K=zeros(len*2);
for i=1:length(element(:,1))
    E(i)=element(i,4);
    A(i)=element(i,5);
    L(i)=((node(element(i,3),2)-node(element(i,2),2))^2+(node(element(i,3),3)-node(element(i,2),3))^2)^.5;
    k1=(E(i)*A(i)/L(i))*[1 -1; -1 1];
    ass=assmbling(i,k1,element(i,2),element(i,3),len);
    K=ass+K;
end
k=K;
