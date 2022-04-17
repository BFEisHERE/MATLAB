%a = linspace(1,2,10)
% 1 den 2 ye kadar 10 tane aralýk oluþturur
%x = 1:1:5
%birden 5 ye kadar 1 aralýk alýnarak gidilir 2 dahil olur
%duruma göre olmayada bilir
%x = 1:3:5

%************************************
% doðrusal olmayan denklemin bir grafik çizelim
% x = 0:pi/100:2*pi;
% y1=sin(x);
% y2=cos(x);
% plot(x,y1,'b')
% xlabel('x ekseni')
% ylabel('y ekseni')
% title('y = sin(x) grafiði')
% hold on; %yapýlmýþ iþlemleri tutmayý saðlar
% plot(x,y2,'r*') %'r*' çizim alanýný yýldýzlý ve red yapar
% grid on %grafik ekranýný çizgilere böler

%***************************************
%tek deðiþkenli denklemin çözümü

function ikiye_bolme %bisection method
clc;clear all;
a =0.6;b=0.8;
x=[a:0.01:b];
y=f(x);
it=1;
if f(a)*f(b)>0
    fprintf('x^3-10*x^2+5 ffonksiyonu (%4.2f,%4.2f) aralýðýnda kökü yoktur',a,b)
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
xlabel('x kýsmý');
ylabel('y kýsmý');
title(['x^3-10*x^2+5 denkleminin kökü ',num2str(m)])
grid on
fprintf('x^3-10*x^2+5 denkleminin kökð %6.4f ve iterasyonu &6.4f',m,it)

function y =f(x);
y =x.^3-10*x.^2+5;
