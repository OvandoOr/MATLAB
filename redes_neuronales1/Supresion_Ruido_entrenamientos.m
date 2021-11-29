clc
clear all
close all

ECG_fin1=zeros(23*5,128);
ECG_p_fin=zeros(23*5,128);
ECG_qrs_fin=zeros(23*5,128);
ECG_t_fin=zeros(23*5,128);

load 'ecg_adrian_wave_separados.mat'
ECG_fin1(1:8,1:100)=ECG_fin(:,21:120);
ECG_p_fin(1:8,:)=ECG_p;
ECG_qrs_fin(1:8,60:75)=ECG_qrs(:,60:75);
ECG_t_fin(1:8,:)=ECG_t;

load 'ecg_adrian_wave_separados2.mat'
ECG_fin1(9:16,:)=ECG_fin;
ECG_p_fin(9:16,:)=ECG_p;
ECG_qrs_fin(9:16,60:75)=ECG_qrs(:,60:75);
ECG_t_fin(9:16,:)=ECG_t;

load 'ecg_adrian_wave_separados1.mat'
ECG_fin1(17:23,:)=ECG_fin(1:7,:);
ECG_p_fin(17:23,:)=ECG_p(1:7,:);
ECG_qrs_fin(17:23,60:75)=ECG_qrs(1:7,60:75);
ECG_t_fin(17:23,:)=ECG_t(1:7,:);

ECG_fin1(24:46,1:100)=ECG_fin1(1:23,21:120);
ECG_fin1(47:69,1:80)=ECG_fin1(1:23,41:120);
ECG_fin1(70:92,1:90)=ECG_fin1(1:23,31:120);
ECG_fin1(93:115,1:85)=ECG_fin1(1:23,36:120);
ECG_fin1(93+23:115+23,1:95)=ECG_fin1(1:23,26:120);
ECG_fin1(93+23*2:115+23*2,1:75)=ECG_fin1(1:23,46:120);
ECG_fin1(93+23*3:115+23*3,1:70)=ECG_fin1(1:23,51:120);


ECG_qrs_fin(24:46,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(47:69,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(70:92,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(93:115,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(93+23:115+23,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(93+23*2:115+23*2,:)=ECG_qrs_fin(1:23,:);
ECG_qrs_fin(93+23*3:115+23*3,:)=ECG_qrs_fin(1:23,:);

ECG_fin2=zeros(1,128);
ECG_fin2(1:75)=ECG_fin(8,46:120);
%N_Train =100;
for k=1:1
if k==1
    N_Train =24;
elseif k==2
    N_Train =100;
elseif k==3
    N_Train =500;
elseif k==4
    N_Train =1000;
elseif k==5
    N_Train =2000;
end
Entradas = 128;
Rango = 2.0*pi;
Puntos = Rango/Entradas; 
N_Puntos = Rango/N_Train;
P = zeros(Entradas, N_Train); 
PN = zeros(Entradas, N_Train);
P_R = zeros(Entradas, N_Train);

for i=1 : N_Train
    fase = (i-1)*N_Puntos; 
    for j=1 : Entradas;
        P(j, i) = sin(fase+(j-1)*Puntos);
    end
end
 
[PN,PS] = mapminmax(P);
s_P = size ((P(:,1)));


for a = 1:1:N_Train
    Ruido = rand (s_P(1),1);
    P_R(:,a) = P(:,a) + (Ruido*0.2);
end


[PN_R,PS] = mapminmax(P_R);
% figure,plot(PN(:,1));
% figure,plot(P);



%Crear rangos de entrada
RI = zeros(Entradas,2);
for i=1:Entradas;
    RI(i,1)=0;
    RI(i,2)=1;
end


Best_perform_ant=1;

s_PN = size ((PN(:,1)));
Ruido = rand (s_PN(1),1);
X = PN(:,1) + (Ruido*0.2);


[XN,XS] = mapminmax(X);
%figure, plot (XN);

for i=1:5
    net = newff(RI, [128*2, 128*2,128*2, 128*2 Entradas], {'tansig','tansig','tansig','tansig','tansig'}, 'traingdx'); % Generación de la red Neuronal
    

    [netTrain Pr] = train(net, ECG_fin1', ECG_qrs_fin');                       %entrenamiento de la red neuronal

    Best_Perform(i) = Pr.best_perf


    if(Best_Perform(i)<Best_perform_ant)
        Pesos_RED = getx(netTrain);      %Guardado de los pesos en una variable
        save ('Pesos.mat', 'Pesos_RED'); %Gardado de los pesos en un archivo .mat
        Best_perform_ant=Best_Perform(i);
        Best_perform_todos(k)=Best_perform_ant;
        YN = sim(netTrain, ECG_fin2');
         figure, plot(YN)
         axis([-inf inf 0 1])
    end

%     YN = sim(netTrain, ECG_fin(3,:)');
%      figure, plot(YN)
%     hold on
%     plot (P(:,1))
    error(k,i)=(abs((YN'-P(:,1)'))/abs(P(:,1)'))*100;
    %porcentaje_cos=(abs(YN(1,:)-cos(P))/abs(cos(P)))*100 % el bueno

end 
figure,
plot(Best_Perform)

end

figure,plot(ECG_fin(3,:))
%plot(Best_perform_todos)
% figure,
% plot(1:5,min(error));
% title("Error menor de diferentes numeros de trains")
% %axis([0 6 -inf inf])
% xticks(1:5);
% %xticklabels('manual')
% xticklabels({'50 ', '100', '500', '1000', '2000'})
% 
% 
% %set(gca,'XTickLabel',{'50', '100', '500', '1000', '2000'})
% figure,
% plot(error)
% title("Errores de diferentes numeros de trains")
% legend("50 entrenamientos","100 entrenamientos","500 entrenamientos","1000 entrenamientos","2000 entrenamientos")
