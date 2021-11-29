close all
clear all
clc
Fs=128;
datos_promedio=2;
cont=1;

file  = 'erickecg.mat';
load(file);
dataIn = ans;
figure,plot(dataIn);
[x,y]=size(dataIn);
for i=1:datos_promedio:y-datos_promedio
    segmento_inicial=datos_promedio*(cont-1)
    segmento_final=datos_promedio*cont
    datos_fin(cont)=mean(dataIn(segmento_inicial+1:segmento_final+1));
    cont=cont+1;
end

figure,
plot(dataIn);
figure,
plot(datos_fin);
