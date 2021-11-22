function sigma=elements_tension(node,element,angles,nodal_disp)
sigma=zeros(length(node(:,1)),1);

for i=1:length(element(:,1))
    L=((node(element(i,3),2)-node(element(i,2),2))^2+(node(element(i,3),3)-node(element(i,2),3))^2)^.5;
    E=element(i,4);
    first=element(i,2);
    second=element(i,3);
    disp=[nodal_disp(2*first-1);nodal_disp(2*first);nodal_disp(2*second-1);nodal_disp(2*second)];
    C=cos(angles(i));
    S=sin(angles(i));
    sigma(i)=E/L*[-C -S C S]*disp;
end


end