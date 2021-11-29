clear all;
close all 
clc
P=(-pi: 0.01 : pi);


cose=cos(P);
cuad=square(P);
dien=sawtooth(P);
trian=sawtooth(P,.5);
T= [cose;cuad;dien;trian];%señales




% for signal=1:4
%     if signal==1
%         T= cos(P);%coseno
%     elseif signal==2
%         T=square(P); %cuadrada 
%     elseif signal==3
%         T=sawtooth(P);%diente de sierra
%     elseif signal==4
%         T=sawtooth(P,.5); %triangular     
%     end
    size(P)
    size(T)
    %figure, plot (T(1,:))
    figure, plot (P,T)
    axis([-inf inf -1.2 1.2])
    hold on 
    %plot (T(2,:))
    %'Valores minimos y maximos de P'
    minmax(P);
    %'Valores minimos y maximos de T'
    minmax(T);
    [PN,PS] = mapminmax(P);
    [TN,TS] = mapminmax(T);
    %[PN, minp, maxp, TN, mint, maxt] = premnmx(P, T); %'Valores minimos y maximos de PN'
    minmax(PN)
    %'Valores minimos y maximos de TN'
    minmax(TN)

    for i=60:5:60
    net = newff([-1 1], [i, 4], {'tansig', 'tansig'},'trainlm'); 
    %net = train (net,PN,TN)
    %%%prueba de red neuronal
    netTrain=train(net, PN, TN)
    end
    %net.trainParam.goal=0.0001; 
    %net.trainParam.epochs=1500;

% end

%'Valores de entrada para simular la red' 
%X=[-pi: 0.005 : pi];
X=[-pi: 0.005 : pi];
[XN,~]= mapminmax(X);
sig=[XN XN XN];
%XN= tramnmx(X, -3.1416, 3.1384);
%XN=X;

YN = sim(netTrain, XN);

%'Valores de salida producidos por la red' 
%Y = postmnmx(YN, -3.14, 3.146); 
figure, plot(YN');
axis([-inf inf -1.2 1.2])

P=X;
[x1 y1]=size(X);
figure,
plot(YN(1,:))
hold on
plot(cos(P))
legend("señal","simulada")

%porcentaje_cos=(((sum(YN(1,:))-sum(cos(P)))/sum(cos(P)))*100)
porcentaje_cos=(abs(YN(1,:)-cos(P))/abs(cos(P)))*100 % el bueno


figure,
plot(YN(2,:))
hold on
plot(square(P))
legend("señal","simulada")
porcentaje_square=abs(((square(P)-YN(2,:))/square(P))*100)

%porcentaje_square=(((sum(YN(2,:))-sum(square(P)))/sum(square(P)))*100)


figure,
plot(YN(3,:))
hold on
plot(sawtooth(P))
legend("señal","simulada")
porcentaje_sawtooth=abs(((sawtooth(P)-YN(3,:))/sawtooth(P))*100)


figure,
plot(YN(4,:))
hold on
plot(sawtooth(P,.5))
legend("señal","simulada")
porcentaje_triang=abs(((sawtooth(P,.5)-YN(4,:))/sawtooth(P,.5))*100)

