% BURADA AMAÇ DENKLEMLE BULUNAMAYAN VS. KÖKLERİ KAPALI ARALIKLA BULMAK
% SOLDAN VE SAĞDAN ARALIĞI SÜREKLİ AZALTARAK
clear;
clc;
close all;

%bisection initialization

f=@(x)2*x + x.^3 -15;

xl=-3; % sol sınır
xu=10; % sağ sınır

N=100; % deneme sayısı
es=0.00001; % hata miktarı

x=xl:0.1:xu;
y=f(x);



  if(f(xl)* f(xu)>0) % kök var mı kontrolü
      disp("error");
      return 
  end

i=0;

while(i<=N)
    m=(xl+xu)/2; % aradeğer bulunur 
    
    ea=abs((xl-m)/xl)*100; % hata değeri
    
    if((f(xl) * f(xu))<0)
        xu=m;
    else
        xl=m;
    end
    
    i=i+1;
    msg=sprintf('Iter= %d, Estimation = %f, Error= %f',i,m,ea);
    disp(msg);
    plot(x,y,m,f(m),'o'); % x y grafiğinin üzerine o şeklinde m f(m) e göre yeri değişen daire yazılıyor.
    pause(0.2);
    
    if(ea<es)
        break;
    end
    
end
