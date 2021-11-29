close all
clear all
clc

fs=1000;
T=1/fs;
t=0:T:1;

x=chirp(t,2,1,10);

ruido=.1*sin(2*pi*t*60);
x_ruido=x+ruido;
x_ruido=x_ruido-min(x_ruido);
x_ruido=x_ruido/max(x_ruido);
x_ruido=(x_ruido*2)-1;

plot(x)
hold on,
plot(x_ruido)
figure,

spectrogram(x_ruido,256,250,256,fs,'yaxis')

[b,a]=butter(4,25/(fs/2));
x_filtrado=filter(b,a,x_ruido);
figure,
plot(x_filtrado)
hold on,
plot(x_ruido)

figure,

spectrogram(x_filtrado,256,20,256,fs,'yaxis')
