close all
clc
clear all

load 'C-A-L1.mat'

Fs = 44100;                      %Frecuencia de muestreo


figure, plot (w);

figure,
spectrogram(w,100,0,8192,Fs,'yaxis')
title('ECG')
 