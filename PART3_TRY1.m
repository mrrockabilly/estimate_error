clear
clf reset
figure(1)
hold on


a=0; b=2;
N1=2.^[1:10]
n=size(N1,2);
simp=zeros(1,n);
trap=zeros(1,n);
error_trap=zeros(1,n);
error_simp=zeros(1,n);

for i=1:n,
N=2^i;
h=(b-a)/N;
x=a+[0:N]*h;
y=f(x);
x2=a+[0:N-1]*h+h/2;
y2=f(x2);
simp(i)=(y(1)+y(N+1)+2*sum(y(2:N))+4*sum(y2))*h/6;
trap(i)=(y(1)+y(N+1)+2*sum(y(2:N)))*h/2;
end
plot(N1,simp,'r-','linewidth',2.0)
plot(N1,trap,'b-','Markerfacecolor','b')

figure (2)

for i=1:n
    error_trap(i)=abs(simp(i)-4.23653115722100977637551654922475);
    error_simp(i)=abs(trap(i)-4.23653115722100977637551654922475);
    loglog(N1(i),error_trap(i),'+')
    hold on
    loglog(N1(i),error_simp(i),'*')
end

err_est=abs(trap(1:n-1)-trap(2:n))/(1-0.5)+1.0e-16
err_est_2=abs(simp(1:n-1)-simp(2:n))/(1-0.5)+1.0e-16;
loglog(2.^[1:9],err_est,'r-','linewidth',2.0)
loglog(2.^[1:9],err_est_2,'b-','linewidth',2.0)