clc
clear all
close all


N_Train =100;
Entradas = 40;
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
    RI(i,1)=-1;
    RI(i,2)=1;
end


Best_perform_ant=1;

s_PN = size ((PN(:,1)));
Ruido = rand (s_PN(1),1);
X = PN(:,1) + (Ruido*0.2);


[XN,XS] = mapminmax(X);
%figure, plot (XN);

for i=1:5
    net = newff(RI, [30, 30 Entradas], {'tansig','tansig','tansig'}, 'traingdx'); % Generación de la red Neuronal
    

    [netTrain Pr] = train(net, PN_R, P);                       %entrenamiento de la red neuronal

    Best_Perform(i) = Pr.best_perf


    if(Best_Perform(i)<Best_perform_ant)
        Pesos_RED = getx(netTrain);      %Guardado de los pesos en una variable
        save ('Pesos.mat', 'Pesos_RED'); %Gardado de los pesos en un archivo .mat
        Best_perform_ant=Best_Perform(i);
    end

    YN = sim(netTrain, XN);
    figure, plot(YN)
    hold on
    plot (P(:,1))
    %error(i,:)=mean(abs((YN-P(:,1))/abs(P(:,1)))*100);
end 
figure,
plot(Best_Perform)
