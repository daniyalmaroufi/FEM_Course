function K=k_matrix_global(node,element,angles)

len=length(node(:,1));

K=zeros(len*2);
for i=1:length(element(:,1))
    E(i)=element(i,4);
    A(i)=element(i,5);
    L(i)=((node(element(i,3),2)-node(element(i,2),2))^2+(node(element(i,3),3)-node(element(i,2),3))^2)^.5;
    C=cos(angles(i));
    S=sin(angles(i));
    K0=(E(i)*A(i)/L(i))*[C^2 C*S -C^2 -C*S;
        C*S S^2 -C*S -S^2;
        -C^2 -C*S C^2 C*S;
        -C*S -S^2 C*S S^2];
    ass=assemble_T(i,K0,element(i,2),element(i,3),len);
    K=ass+K;
end

end
