clear all
close all
clc

fs=20;
Frecuencia_sig=2;
T=1/fs;
t=0:T:1;
fase=pi/3;
w0=2*pi;
A=1;

x=A*cos((w0*t*Frecuencia_sig));
plot(t,x);

hold on,
stem(t,x)
grid on
xlabel('tiempo');
ylabel('Funcion coseno');

figure,
t1=0:T/1000:1;
x1=A*cos((w0*t1*Frecuencia_sig));
plot(t1,x1);

hold on,
stem(t,x)
grid on
xlabel('tiempo');
ylabel('Funcion coseno');