function K=k_matrix_global(node,element)

len=length(node(:,1));

K=zeros(len*2);

for i=1:length(element(:,1))
    E(i)=element(i,4);
    I(i)=element(i,5);
    L(i)=((node(element(i,3),2)-node(element(i,2),2))^2+(node(element(i,3),3)-node(element(i,2),3))^2)^.5;
    
    K0=(E(i)*I(i)/L(i)^3)*[12 6*L(i) -12 6*L(i);
                        6*L(i) 4*L(i)^2 -6*L(i) 2*L(i)^2;
                        -12 -6*L(i) 12 -6*L(i);
                        6*L(i) 2*L(i)^2 -6*L(i) 4*L(i)^2];
    ass=assemble_T(i,K0,element(i,2),element(i,3),len);
    K=ass+K;
end

end
