clear all 
close all
clc

F=10;
T=1/F;
t=0:T/100:F*T;
y=sin(2*pi*F*t);

subplot(3,1,1);
plot(t,y);
title('señal de entrada');
xlabel('t');
ylabel('Amplitud');

Fs=40;
Ts=1/Fs;
n=0:Ts:F*T;
muestreo=sin(2*pi*F*n);
subplot(3,1,2);
stem(n,muestreo);
title('Muestreo de señal');
xlabel('n');
ylabel('Amplitud');

t1=linspace(0,F*T,(F*T)/(T/100));
reconstruccion=interp1(n,muestreo,t1,'spline');
subplot(3,1,3);
plot(n,muestreo,'o',t1,reconstruccion,'-','linewidth',1.5);
title('Reconstruccion de señal');
