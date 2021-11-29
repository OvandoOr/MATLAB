close all
clear all
clc

fs=1024;
T=1/fs;
t=0:T:1;
load('ECG_jose_ruido.mat')
sig_original=ECG_jose;

plot(sig_original)
figure,

spectrogram(sig_original,256,250,256,fs,'yaxis')

[b,a]=butter(4,15/(fs/2));
sig_filtrado=filter(b,a,sig_original);
figure,
%plot(sig_original)
hold on,
plot(sig_filtrado)

figure,

spectrogram(sig_filtrado,256,250,256,fs,'yaxis')