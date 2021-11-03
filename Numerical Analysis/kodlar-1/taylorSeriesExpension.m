x=-3:0.1:3;
f=@(x)exp(x);
y=f(x);

figure;
plot(x,y,'red'); % 'LineWidth',3
xlabel("x");
ylabel("y");

y_predict=zeros(size(y)); % buna bak


N=3;

% MacLaurin Series Formula

for n=0:N
y_predict=y_predict+(x.^n)./factorial(n); % ./ sanırım vektör bölmesi tarzı bir şey

end



hold on
plot(x,y_predict,"blue");

error=abs((y-y_predict)./y); % abs() mutlak değere alır 

msg=sprintf("error=%f",sum(error)); % sprintf string print

title(msg);
legend("true value","estimated value");
disp(sum(error));


grid
