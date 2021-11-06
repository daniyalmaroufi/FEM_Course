function f=assmbling(i,k,initial,final,leng);
f=zeros(leng*2);
m=2*initial-1;
n=2*final;
f(m,m)=k(1,1);
f(m,n)=k(1,2);
f(n,m)=k(2,1);
f(n,n)=k(2,2);
