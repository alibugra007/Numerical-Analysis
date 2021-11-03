clc;
clear;

A=[12 -3 6;
   2 1 -4;
   5 4 -2;];

b=[4;7;9];

Ab=[A,b];

n=length(A);

L=eye(n); % elementer matris oluşturur.

for i=2:3
    islem=Ab(i,1)/Ab(1,1);
    L(i,1)=islem;
    Ab(i,:)=Ab(i,:)-islem*Ab(1,:);
end

i=3;

islem=Ab(i,2)/Ab(2,2);
L(i,2)=islem;

Ab(i,:)=Ab(i,:)-islem*Ab(2,:);

U=Ab(1:n,1:n);
