close all
clear all
clc

load('ECG_jose.mat')
%sig=0:.01:1;%definicion de puntos de la se�al, rango de la se�al
%Signal=sin(2*pi*sig); %se�al de prueba
%sig=-3:1:3;
%Signal=[10 7 3 0 -3 -7 -10];
%sig=-1:.01:1;%definicion de puntos de la se�al
%Signal=power(sig,3); %se�al de prueba, se�al al cubo
%Signal=[0 0 0 0 1 1 1 0 -1 -1 0 0 0]; %se�al de prueba


Signal=ECG_jose(600:1280);
Signal=Signal';
[x,y]=size(Signal);
t=Signal;
t1=fliplr(Signal);

%%%par%%%%
Xp=.5*t+.5*t1;  
figure,

plot(Xp);% par
hold on 
%plot(Signal);
grid on
title('Parte par');
legend('Parte par','Se�al original')
%%%par%%%
%%%impar%%%
Xi=.5*t-.5*t1;
figure,
plot(Xi);% impar
hold on 
%plot(Signal);
grid on
title('Parte impar');
legend('Parte impar','Se�al original')


%%%impar%%%
%%%no simetrica%%%
Xns=Xp+Xi;
figure,
plot(Xns);%
hold on 
plot(Signal);
grid on
title('Suma par e impar');

