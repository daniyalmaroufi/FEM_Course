function f=assmble_T(i,k,initial,final,leng);
f=zeros(leng*2);
m=2*initial-1;
n=2*final-1;

f(m,m)=k(1,1);
f(m,m+1)=k(1,2);
f(m+1,m)=k(2,1);
f(m+1,m+1)=k(2,2);

f(n,n)=k(3,3);
f(n,n+1)=k(3,4);
f(n+1,n)=k(4,3);
f(n+1,n+1)=k(4,4);

f(m,n)=k(1,3);
f(m,n+1)=k(1,4);
f(m+1,n)=k(2,3);
f(m+1,n+1)=k(2,4);

f(n,m)=k(3,1);
f(n,m+1)=k(3,2);
f(n+1,m)=k(4,1);
f(n+1,m+1)=k(4,2);
