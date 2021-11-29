close all
clear all
clc

fs=20000;
T=1/fs;
t=0:T:1;

signal1=chirp(t,3000,1,3000);

signal2=chirp(t,3000,1,1,'logarithmic');

signal3=chirp(t,0,1,6000);

signal_fin=[signal1,signal2,signal3];

spectrogram(signal_fin,128,120,128,fs,'yaxis')