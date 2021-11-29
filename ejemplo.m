clear all 
close all 
clc
tic

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signals\Signal_gel2.mat');
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_nano.mat');

gel = Signal_gel;
nano = Signal_nano;




min_gel     = min(gel);
min_nano    = min(nano);



gel_n = gel + abs(min_gel);
nano_n = nano + abs(min_nano);

max_gel_n     = max(gel_n);
max_nano_n    = max(nano_n);

gel_n = gel_n / max_gel_n;
nano_n = nano_n / max_nano_n;

nano_bits = round(nano_n * 4095);
gel_bits = round(gel_n * 4095);

figure, plot(gel_n)
hold on
plot(nano_n)


figure, plot(nano_bits)

rango = 0:4095;
x1= hist (nano_bits,rango);
hold on
x2 =hist (gel_bits,rango);


figure, plot(x1)
hold on
plot(x2)


toc
