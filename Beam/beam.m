clear all
clc
%reading inputs from files
% nodefile=input('input the name of file containing nodes coordinates :','s'); 
% elementfile=input('input the name of file concerning elements inormations:','s');
% BCffile=input('input the file name for force boundary conditions:','s');
% BCdfile=input('input the file name for displacement boundary conditions:','s');

foldername='ex1';

nodefile=strcat('./',foldername,'/nodes.txt');
elementfile=strcat('./',foldername,'/elements.txt');
BCffile=strcat('./',foldername,'/BCfs.txt');
BCdfile=strcat('./',foldername,'/BCds.txt');

a=dlmread(nodefile,' ');
node(:,1)=a(:,1);       %no. of node
node(:,2)=a(:,2);       %x coordination of node
node(:,3)=a(:,3);       %y coordination of node

b=dlmread(elementfile,' ');
element(:,1)=b(:,1);     %no. of element
element(:,2)=b(:,2);     %belongs to no. of first node in the element.
element(:,3)=b(:,3);     %belongs to no. of socond node in the element.
element(:,4)=b(:,4);     %belongs to Young modulus in the element.
element(:,5)=b(:,5);     %belongs to the moment of inertia in the element.
% element(:,6)=b(:,6);

c=dlmread(BCffile,' ');
force(:,1)=c(:,1);      %an identifier for type of load(1=nodal, 2=distributed in x-direction, 3=temperature).
force(:,2)=c(:,2);      %belongs to no. of node under load or the element under load.
force(:,3)=c(:,3);      %belongs to the amount of force in y-direction or increase in temperature.
force(:,4)=c(:,4);      %belongs to the amount of moment in z-direction or increase in temperature.

d=dlmread(BCdfile,' ');
disp(:,1)=d(:,1);       %belongs to no. of node under constraint.
disp(:,2)=d(:,2);       %belongs to the displacement in the x/y-direction.
disp(:,3)=d(:,3);       %an identifier for direction of constraint(1=y, 2=theta).



%calculations of stiffness matrix
K=k_matrix_global(node,element);


s=K;

F=BCf(force,node,element,disp,K,1);

s=BCd(s,disp);

nodal_disp=inv(s)*F;

% for i=1:length(node(:,1))
%     A(i,1)=i;
%     A(i,2)=nodal_disp(i);
% end

% outdisp=input('insert the name of file of type .txt for nodal displacement:','s');
% dlmwrite(outdisp, A, 'delimiter', '\t','precision', 6, 'newline', 'pc');

R=K*nodal_disp-BCf(force,node,element,disp,K,0);


% calculation of tension in the elements
% sigma=elements_tension(node,element,angles,nodal_disp);
