clc;
clear;
close all;
 
f=@(x)log(x);
 
tv=f(2);
 
x=[1,4,6,5];
b=[0 0 0 0 0 0 0];
 
i=1;
while(i<=7)
    if i==1
        b(i)=f(x(i));
    elseif(i<=4)
        b(i)=(f(x(i))-f(x(i-1)))/(x(i)-x(i-1));
    elseif i>4 && i<7
        b(i)=(b(i-2)-b(i-3))/(x(i-2)-x(i-4));
    else
        b(i)=(b(i-1)-b(i-2))/(x(i-3)-x(i-6));
    end
 
    msg=sprintf('Iter= %d, b = %f',i,b(i));
    disp(msg);
    
    i=i+1;
end
 
g=@(a)b(1)+(a-x(1))*b(2)+(a-x(1))*(a-x(2))*b(5)+ (a-x(1))*(a-x(2))*(a-x(3))*b(7);
 
ev=g(2);
error=abs((tv-ev)/tv)*100;
error_message=sprintf('Estimation Value = %f, True Value = %f, Error = %f',ev,tv,error);
disp(error_message);