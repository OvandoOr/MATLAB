close all
clear all
clc

fs=200;
%frecuencia=200;
T=1/fs;
t=T:T:5;%definicion de puntos de la señal, rango de la señal
load('ecg_nuevo.mat')
%Signal=sin(2*pi*t*frecuencia); %señal de prueba
Signal=ans;
plot(t,Signal)
title('Señal original')

Fs = fs;  % Sampling Frequency
Fpass = 0;               % Passband Frequency
Fstop = 60;              % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor
% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

figure,
sig=conv(Hd.Numerator,Signal);
conv_filter=Hd.Numerator;
plot(sig)
hold on
title('Señal filtrada convolucion')
% plot(Signal)
% figure,
% sig_filtro=filter(Hd,Signal);
% plot(sig)
% hold on
% plot(Signal)
% title('Señal original y convolucion')