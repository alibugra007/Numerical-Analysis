% ALİ BUĞRA OKTAY

clear;
clc;
close all;

f=@(x)exp(-x) - 2*x + 3 ; % denklemin saf hali

g=@(x)(exp(-x) + 3) / 2 ; % denklemin x yalnız bırakılmış hali

xl=input('sol sinir : '); % sol sınır
xu=input('sag sinir : '); % sağ sınır

N=input('deneme sayisi : '); % deneme sayısı
es=input('hata degeri : '); % hata miktarı

if(f(xl) * f(xu)>0) % kok kontrol
      disp("Error, root does not exist between this limits.");
      return
end

x=xl:0.1:xu; % x ekseni
y=f(x);      % y ekseni

figure(1)
plot(x,y,'b'); % giris denkleminin grafigi
title('Giris Denklemi Grafigi')
grid on

x0=0; % başlangıç değeri (biz veriyoruz)
xold=x0;

i=0;
 while(i<N)
   
   xnew=g(xold); % tahmin değeri oluşturuldu.
   
   ea=abs((xnew-xold)/xnew)*100; % hata değeri. abs() mutlak yapar
   
   xold=xnew; % bir sonraki iterasyonda bir önceki değeri kullanmak için atama yaptık.
   
    i=i+1;
    msg=sprintf('Iterasyon= %d, Tahmin = %f, Hata = %f',i,xnew,ea);
    disp(msg);
    
    figure(2)
    plot(x,y,xnew,f(xnew),'o'); % tahmini kokun grafigi
    title('Tahmin Grafigi')
    grid on 
    
    figure(3)
    plot(x,y,ea,f(ea),'o'); % her yineleme icin hata degeri grafigi
    title('Hata Grafigi')
    grid on
   
    pause(1);
     
    if(ea<es)
        break;
    end
  
 
end