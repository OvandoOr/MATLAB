close all
clear all
clc

fc = 35;
orden = 10;
Fs=128;

file  = 'erickecg.mat';
load(file);
dataIn = ans;

figure,plot(dataIn);

[b,a] = butter(orden,fc/(Fs/2),'low');

dataOut = filter(b,a,dataIn);

figure,
plot(dataIn);
hold on
plot(dataOut);

filename = 'erickecg_pb_35';
save(filename,'dataOut')