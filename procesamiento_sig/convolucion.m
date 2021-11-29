close all
clear all
clc

sig=-10:10;%definicion de puntos de la señal
%Signal=2*cos(sig); %señal de prueba
%Signal=power(sig,3); %señal de prueba, señal al cubo
Signalx=[1 2 3 4 5]; %señal de prueba
Signalh=[-1 5 3 -2 1];
%Signalh=[1 -2 3 5 -1];

[~,rango_x]=size(Signalx);
[~,rango_h]=size(Signalh);
rango_t=rango_x+rango_h-1;
%r_t=zeros(1,rango_t);

t1=fliplr(Signalh);

signal_y=zeros(rango_x,rango_t);

for x=1:rango_h
    %operacion=t1(x)*Signalx;
    operacion=Signalh(x)*Signalx;
    signal_y(x,x:rango_h+x-1)=operacion;
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