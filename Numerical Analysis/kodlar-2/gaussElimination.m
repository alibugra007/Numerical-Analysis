clear;
clc;

matris_katsayi=[2 -4 1;
                6 2 -1;
               -2 6 -2;];

matris_sonuc=[4;9;5;];

matris=[matris_katsayi,matris_sonuc];

[ROWS,COLS]=size(matris_katsayi);

for row=1:ROWS-1
   matris(row,:)=matris(row,:)/matris(row,row);
   for row2=row+1:ROWS
       matris(row2,:)=matris(row2,:)-matris(row,:)*matris(row2,row);
   end
end

matris_kokler=zeros(1,ROWS);
sol=zeros(ROWS,1);

for row=ROWS:-1:1
    total=0;
    idx=COLS;
    while(idx>row)
        total=total+matris(row,idx)*matris_kokler(idx);
        idx=idx-1;
    end
    matris_kokler(row)=matris(row,end)-total;
    
end

%disp(x);

disp("Matrisin kokleri:");
disp(matris_katsayi\matris_sonuc);

        
        
        
        
        
        
        
        
        
        

   