close all
clear all
clc

fs=1024;
T=1/fs;
t=T:T:8;
frecuencia=60;
fc=55;
fc1=65;
orden=3;
load('ECG_jose_ruido.mat')
signal_original=ECG_jose;
[b,a] = butter(orden,[fc fc1]/512,'stop');
dataOut = filter(b,a,signal_original);
signal=dataOut;

%signal=.2*sin(2*pi*t*20)+ECG_jose;
plot(signal_original)
figure,
plot(signal)



[x,y]=size(signal);

t_fft=(0:y-1)*T;

sig_fft=fft(signal);

P2=abs(sig_fft/T);
P1= P2(1:y/2+1);
P1(2:end-1)=2*P1(2:end-1);

f=fs*(0:(y/2))/y;

figure,plot(f,P1)
title('Frecuencias de la señal')
xlabel('Frecuencia')
ylabel('Amplitud')
