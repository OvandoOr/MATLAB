
close all
clc
clear all

[sig_x,Fs_x] = audioread('hall.wav');

[sig_h,Fs_h] = audioread('ladrido.wav');

Signalx=sig_x(:,1);
Signalh=sig_h(:,1);

[rango_x,~]=size(Signalx);
[rango_h,~]=size(Signalh);
%N=length(h);

hHist2_x=hist(Signalx,rango_x);
hHist2_h=hist(Signalh,rango_h);


for i=1:rango_x
    if hHist2_x(i)==0
        hHist2_x(i)=1;
    end
    
end

for i2=1:rango_h
    if hHist2_h(i2)==0
        hHist2_h(i2)=1;
    end
    
end

Entropy_x =  log2(rango_x) - sum(hHist2_x.*log2(hHist2_x))/rango_x;
Entropy_h =  log2(rango_h) - sum(hHist2_h.*log2(hHist2_h))/rango_h;

figure,
plot(hHist2_h,'DisplayName','hHist2_h')
title('voz con ruido');
figure,
plot(hHist2_x,'DisplayName','hHist2_x')
title('voz sin ruido');