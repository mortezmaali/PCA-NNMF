clc;
clear;
load('C:\Users\Morteza\Desktop\PhD\Mun_C.mat')
A=Rmunsell*Rmunsell';
[v,w]=nnmf(A,31);
v = v ./ max(v);
for k=1:31
    vs = v(1:k,:)';
    CC=(inv(vs'*vs))*vs'*Rmunsell;
    R=vs*CC;
    RMS=sqrt(sum((abs(R-Rmunsell)).^2));
    average(k)=mean(abs(RMS));
end
plot(average)
V=[v(:,1),v(:,2),v(:,3)];
figure(2);plot(400:10:700,V)