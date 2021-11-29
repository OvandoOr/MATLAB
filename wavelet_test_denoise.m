% len = 2^11;
% h = [4  -5  3  -4  5  -4.2   2.1   4.3  -3.1   5.1  -4.2];
% t = [0.1  0.13  0.15  0.23  0.25  0.40  0.44  0.65  0.76  0.78  0.81];
% h  = abs(h);
% w  = 0.01*[0.5 0.5 0.6 1 1 3 1 1 0.5 0.8 0.5];
% tt = linspace(0,1,len);
% xref = zeros(1,len);
% for j=1:11
%     xref = xref+(h(j)./(1+((tt-t(j))/w(j)).^4));
% end
% 
% rng default
% x = xref + 0.5*randn(size(xref));
% plot(x)
% axis tight
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

x=ECG;

wt = modwt(ECG,5);
wtrec = zeros(size(wt));
wtrec(4:5,:) = wt(4:5,:);
y = imodwt(wtrec,'sym4');

plot(y);
hold on
plot(ECG);
figure,
plot(wt(4:5,:));