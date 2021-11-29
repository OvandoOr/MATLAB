close all
clear all
clc

load('slp48m.mat')
signal=val;

[x,y]=size(signal);
fs=250;
duracion_sig=y/fs;
T=1/fs;
t=T:T:duracion_sig;

plot(t,signal)

figure,
spectrogram(signal,256,250,256,fs,'yaxis')


