close all
clc
clear all

load '1.mat'

Fs = 1000;                      %Frecuencia de muestreo
Ts = 1/Fs;
periodo=Fs/2;

ECG=sum(val);   %suma del total de derivaciones
[M N] = size (ECG(1,:));        %Tamano de la senal
     
 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
ECGMin = min(ECG);
ECG = ECG -ECGMin;
ECGMax = max(ECG);
ECG = ECG/(ECGMax);
figure, plot (ECG)             %graficado de la senal 


dirDec = 'r';         % Direction of decomposition
level  = 5;           % Level of decomposition
wname  = 'sym4';      % Near symmetric wavelet
decROW = mdwtdec(dirDec,ECG,level,wname);

A7_ROW  = mdwtrec(decROW,'a',level);

subplot(2,1,1);
plot(ECG(:,:)','r');
title('Original Data');
axis tight
subplot(2,1,2);
plot(A7_ROW(:,:)','b');
axis tight
title('Corresponding approximations at level 7');