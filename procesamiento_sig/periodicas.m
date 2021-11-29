clear all
close all
clc

Fs=500;
T_fs=1/Fs;
t=T_fs:T_fs:1;
Frecuencia=5;
w0=2*pi;

sig=sin(w0*t*Frecuencia);

figure,
plot(t,sig);
title('Señal senoidal submuestreada')


t1=T_fs:.00001:1;
sig1=sin(w0*t1*Frecuencia);
figure,
plot(t1,sig1);
hold on,
stem(t,sig)
title('Señal senoidal')
