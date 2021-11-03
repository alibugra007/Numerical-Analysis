
clear;
clc;
close all;

f=@(x)x.^2 -6*x + 15;
R=(sqrt(5)-1)/2;

xl=input('sol sinir : '); % sol sınır
xu=input('sag sinir : '); % sağ sınır

N=input('deneme sayisi : '); % deneme sayısı

x=xl:0.1:xu; % x ekseni
y=f(x);      % y ekseni 

i=0;

d=R*(xu-xl);
x1=xl+d;
x2=xu-d;

while(i<N)
    
    xold=xu-xl;
    
    if(f(x1)>f(x2))
        xu=x1; % yeni xu
        d=R*(xu-xl); % yeni d
        x1=x2; % yeni x1
        x2=xu-d; % yeni x2
        
        error=abs((1-R)*(xold)/x1)*100;
        msg=sprintf('Iter = %d, x1 = %f, x2 = %f, f(x1) = %f, f(x2) = %f, error = %f',i,x1,x2,f(x1),f(x2),error);
        disp(msg);
        
        plot(x,y,x1,f(x1),'o'); % x y grafiğinin üzerine o şeklinde m f(m) e göre yeri değişen daire yazılıyor.
        pause(3)
        
    else
        xl=x2; % yeni xl
        d=R*(xu-xl);  % yeni d
        x2=x1;  % yeni x2
        x1=xl+d;  % yeni x1
        
        error=abs((1-R)*(xold)/x2)*100;
        msg=sprintf('Iter = %d, x1 = %f, x2 = %f, f(x1) = %f, f(x2) = %f, error = %f',i,x1,x2,f(x1),f(x2),error);
        disp(msg);
        
        plot(x,y,x2,f(x2),'o'); % x y grafiğinin üzerine o şeklinde m f(m) e göre yeri değişen daire yazılıyor.
        pause(3);

    end
   
    
    i=i+1;
    
end




