clear all
close all
clc
tic

puntos=1000;
valor_plot=1:puntos;
y1=300;
y2=860;

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_gel.mat');
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_nano.mat');
gel = Signal_gel;
nano = Signal_nano;



min_gel = min(gel);
min_nano = min(nano);

gel_n= gel + abs(min_gel);
nano_n= nano + abs(min_nano);

max_gel = max(gel_n);
max_nano = max(nano_n);

gel_n= gel_n / max_gel;
nano_n= nano_n / max_nano;



x1=1+y1:puntos+y1;
x2=1+y2:puntos+y2;
Signal_g=gel_n(x1);
Signal_n=nano_n(x2);

nano_bits = round(nano_n * 4095);%transformacion a 12 bits
gel_bits = round(gel_n * 4095);

Signal_g_bits=gel_bits(x1);
Signal_n_bits=nano_bits(x2);

figure,plot(valor_plot,Signal_g,valor_plot,Signal_n);
title('Señales normalizadas')
grid on
hold on
figure,plot(valor_plot,Signal_g_bits,valor_plot,Signal_n_bits);
title('Señales 12 bits')
grid on

rango = 0:4095;
signal1= hist (Signal_g_bits,rango);
%hold on
signal2 =hist (Signal_n_bits,rango);

figure, plot(signal1)
hold on
plot(signal2)
title('Histogramas en 12 bits')
grid on

mean_g=mean(Signal_g_bits);
mean_n=mean(Signal_n_bits);
std_g=std(Signal_g_bits);
std_n=std(Signal_n_bits);
mean_g
mean_n
std_g
std_n
toc