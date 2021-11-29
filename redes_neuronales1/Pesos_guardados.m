close all
clc
clear all

load 'ecg_adrian_wave_separados1.mat'
ECG_fin1(17:23,:)=ECG_fin(1:7,:);
ECG_p_fin(17:23,:)=ECG_p(1:7,:);
ECG_qrs_fin(17:23,60:75)=ECG_qrs(1:7,60:75);
ECG_t_fin(17:23,:)=ECG_t(1:7,:);
ECG_fin2=zeros(1,128);
ECG_fin2(1:95+5)=ECG_fin(8,21:120);

Entradas = 128;

RI = zeros(Entradas,2);
for i=1:Entradas;
    RI(i,1)=0;
    RI(i,2)=1;
end

load('Pesos.mat');

net = newff(RI, [128*2, 128*2,128*2, 128*2 Entradas], {'tansig','tansig','tansig','tansig','tansig'}, 'traingdx'); % Generación de la red Neuronal
netTrain = setx(net,Pesos_RED);



YN = sim(netTrain, ECG_fin2');
%'Valores de salida producidos por la red' 

% 




figure, plot(YN)
axis([-inf inf 0 1]);
hold on
figure,
plot (ECG_fin2)
axis([-inf inf 0 1]);
