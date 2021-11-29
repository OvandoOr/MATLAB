close all
clear all
clc

fs=20000;
T=1/fs;
t=0:T:.5;

sig=chirp(t,1,.5,5000);
%chirp(periodo,frec_inicial,tiempo_en_llegar,frec_fin,tipo_chirp(opcional))

t1=0:T:1;
sig1=chirp(t1,5000,1,1);
sig=[sig,sig1];

spectrogram(sig,128,120,128,fs,'yaxis')
title('Chirp Lineal')


