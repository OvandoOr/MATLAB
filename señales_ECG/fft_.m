close all
clear all
clc

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
t=0:T:1;

file  = 'erickecg.mat';
load(file);
ans=sin(2*pi*t*60)
[x,y]=size(ans);
L = y;             % Length of signal
t = (0:L-1)*T;        % Time vector

S=ans(1:L);


X = S ;


Y = fft(X);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure, plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')