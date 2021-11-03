% ALİ BUĞRA OKTAY

clear;
clc;
close all;

f=@(x)x.^3 + 5*x -15; % denklem

xl=input('sol sinir : '); % sol sınır
xu=input('sag sinir : '); % sağ sınır

N=input('deneme sayisi : '); % deneme sayısı
es=input('hata degeri : '); % hata miktarı

x=xl:0.1:xu; % x ekseni
y=f(x);      % y ekseni 
 
figure(1)
plot(x,y,'b'); % giris denkleminin grafigi
title('Giris Denklemi Grafigi')
grid on % cizgiler koyar grafige


  if(f(xl)* f(xu)>0) % kok var mi kontrolu
      disp("bu aralikta kok yok.");
      return 
  end

i=0;

while(i<N)
     xr= xu - (f(xu)*(xl-xu))/(f(xl)-f(xu)); % tahmin değeri
    % xr=(xu*f(xl)-xl*f(xu))/(f(xl)-f(xu)); % ikisi de aynı fonksiyon
    
    ea=abs((xl-xr)/xl)*100; % hata değeri. abs() mutlak yapar
    
    if(f(xr)<0) % duruma gore sinir degisimi
        xl=xr;
    elseif (f(xr)==0)
        break;
    else
        xu=xr;
    end
    
    i=i+1;
    msg=sprintf('Iterasyon= %d, Tahmin = %f, Hata = %f',i,xr,ea);
    disp(msg);
    
    figure(2)
    plot(x,y,xr,f(xr),'o'); % tahmini kokun konumu grafigi
    title('Tahmin Grafigi')
    grid on
    
    figure(3)
    plot(x,y,ea,f(ea),'o'); % her yineleme icin hata degeri grafigi
    title('Hata Grafigi')
    grid on
    
    pause(1);
    
    if(ea<es) % durmak icin kontrol
        break;
    end
    
end
