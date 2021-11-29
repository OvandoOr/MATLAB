close all
clear all
clc

load('Subject04_1_edfm_60.mat')
EEG_inactivo=val;
load('Subject04_2_edfm_60.mat')
EEG_activo=val;

[x,y]=size(EEG_inactivo);
fs=500;
duracion_sig=y/fs;
T=1/fs;
t=T:T:duracion_sig;

figure,
plot(t,EEG_inactivo)
hold on
plot(t,EEG_activo)

figure,
spectrogram(EEG_inactivo,256,250,256,fs,'yaxis')

figure,
spectrogram(EEG_activo,256,250,256,fs,'yaxis')

