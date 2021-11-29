fc = 50;
fs = 1000;
orden = 6 ;

load('1.mat');
dataIn = val(1,:);

figure,plot(dataIn);

[b,a] = butter(orden,fc/(fs/2),'low');

dataOut = filter(b,a,dataIn);

figure,plot(dataOut);