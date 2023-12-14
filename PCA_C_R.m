clc;
clear;
load('C:\Users\Morteza\Desktop\PhD\Mun_C.mat')
A=Rmunsell*Rmunsell';
[V,w]=eig(A);

for k=1:31
    v = V(1:k,:)';
    CC=(inv(v'*v))*v'*Rmunsell;
    R=v*CC;
    RMS=sqrt(sum((R-Rmunsell).^2));
    average(k)=mean(RMS);
end
plot(average)
v=[V(:,31),V(:,30),V(:,29)];
figure(2);plot(400:10:700,v)