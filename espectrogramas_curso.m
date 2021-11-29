close all
clear all
clc

fs=20000;
T=1/fs;
t=0:T:1;

sig=chirp(t,1,1,5000);
%chirp(periodo,frec_inicial,tiempo_en_llegar,frec_fin,tipo_chirp(opcional))

spectrogram(sig,128,120,128,fs,'yaxis')
title('Chirp Lineal')

sig_log=chirp(t,1,1,5000,'logarithmic');
%chirp(periodo,frec_inicial,tiempo_en_llegar,frec_fin,tipo_chirp(opcional))
figure,
spectrogram(sig_log,128,120,128,fs,'yaxis')
title('Chirp Logaritmica')


sig_cuad=chirp(t,1,1,5000,'quadratic');
%chirp(periodo,frec_inicial,tiempo_en_llegar,frec_fin,tipo_chirp(opcional))
figure,
spectrogram(sig_cuad,128,120,128,fs,'yaxis')
title('Chirp cuadratica')


