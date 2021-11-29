close all
clc
clear all

load '1.mat'

Fs = 200;                      %Frecuencia de muestreo

ECG=sum(val);

figure, plot (ECG);

figure,
spectrogram(ECG,128,120,128,Fs,'yaxis')
title('ECG')
 