clear;
clc;
close all;

f=@(x)log(x);

X=[1,4,6];
Y=[f(X(1)),f(X(2)),f(X(3))];

n=length(X)-1;

tv=f(2);

x=[1,2,3]; % burada kaç isterasyon olsun diyoruz.

result_out=0;
for i=1:n+1
   
   result_in=1;
    for j=1:n+1
        if (j~=i)
            result_in=result_in*(x(i)-X(j))/(X(i)-X(j));
        end
    end
    
   result_out=result_out+Y(i)*result_in;
   
   ev=result_out;
   error=abs((tv-ev)/tv)*100;
   msg=sprintf('Iter= %d, Estimation Value = %f, True Value = %f, Error = %f',i,ev,tv,error);
   disp(msg);
  
end

