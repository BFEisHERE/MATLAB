%a = linspace(1,2,10)
% 1 den 2 ye kadar 10 tane aral�k olu�turur
%x = 1:1:5
%birden 5 ye kadar 1 aral�k al�narak gidilir 2 dahil olur
%duruma g�re olmayada bilir
%x = 1:3:5

%************************************
% do�rusal olmayan denklemin bir grafik �izelim
% x = 0:pi/100:2*pi;
% y1=sin(x);
% y2=cos(x);
% plot(x,y1,'b')
% xlabel('x ekseni')
% ylabel('y ekseni')
% title('y = sin(x) grafi�i')
% hold on; %yap�lm�� i�lemleri tutmay� sa�lar
% plot(x,y2,'r*') %'r*' �izim alan�n� y�ld�zl� ve red yapar
% grid on %grafik ekran�n� �izgilere b�ler

%***************************************
%tek de�i�kenli denklemin ��z�m�

function ikiye_bolme %bisection method
clc;clear all;
a =0.6;b=0.8;
x=[a:0.01:b];
y=f(x);
it=1;
if f(a)*f(b)>0
    fprintf('x^3-10*x^2+5 ffonksiyonu (%4.2f,%4.2f) aral���nda k�k� yoktur',a,b)
else
    m = (a+b)/2;
    while (abs(f(m))>eps) & ((b-a)/2>eps)
        plot(a,0,'or');
        line([a a],[0,f(a)],[1 1],'Marker','*','LineSyle','-','Color','b');
        hold on;
        plot(b,0,'or');
        line([b b],[0,f(b)],[1 1],'Marker','*','LineStyle','-','Color','b');
        hold on; it = it +1;
        
        if f(a)*f(m)<0 b=m;
        elseif f(m)*f(b)<0 a=m;
        end
        m = (a+b)/2;
    end 
end
plot(x,y);
xlabel('x k�sm�');
ylabel('y k�sm�');
title(['x^3-10*x^2+5 denkleminin k�k� ',num2str(m)])
grid on
fprintf('x^3-10*x^2+5 denkleminin k�k� %6.4f ve iterasyonu &6.4f',m,it)

function y =f(x);
y =x.^3-10*x.^2+5;
