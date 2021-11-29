close all
clear all
clc

sig=1:60;%definicion de puntos de la señal
sig(1:60)=1;
sig(21:40)=5;
Signalx=sig;
Signalh=[2 4 6 8 10];

[~,rango_x]=size(Signalx);
[~,rango_h]=size(Signalh);
rango_t=rango_x+rango_h-1;
%r_t=zeros(1,rango_t);

t1=fliplr(Signalh);

signal_y=zeros(rango_x,rango_t);

for x=1:rango_h
    %operacion=t1(x)*Signalx;
    operacion=Signalh(x)*Signalx;
    signal_y(x,x:rango_x+x-1)=operacion;
end

x=sum(signal_y);
compro=conv2(Signalx,Signalh);
figure,
% plot(Signalx);
% hold on 
% plot(Signalh);
% hold on 
plot(x);
hold on 
plot(compro);
grid on