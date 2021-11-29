clear all;
close all 
clc
P=[-pi: 0.01 : pi];
T= [sin(P); cos(P)];
cuad=square(P);
dien=sawtooth(P);
trian=sawtooth(P,.5);


size(P)
size(T)

figure, plot (T(1,:))
hold on 
plot (T(2,:))
%'Valores minimos y maximos de P'
minmax(P);
%'Valores minimos y maximos de T'
minmax(T);
[PN,PS] = mapminmax(P);
[TN,TS] = mapminmax(T);
[PN, minp, maxp, TN, mint, maxt] = premnmx(P, T); %'Valores minimos y maximos de PN'
minmax(PN)
%'Valores minimos y maximos de TN'
minmax(TN)
for i=5:5:100
net = newff([-1 1], [i, 2], {'tansig', 'tansig'},'trainlm'); 
%net = train (net,PN,TN)
end
%net.trainParam.goal=0.0001; 
%net.trainParam.epochs=1500;


%%%prueba de red neuronal
netTrain=train(net, PN, TN)
%'Valores de entrada para simular la red' 
X=[-pi: 0.005 : pi];
XN= tramnmx(X, -3.1416, 3.1384);

YN = sim(netTrain, XN);
%'Valores de salida producidos por la red' 
%Y = postmnmx(YN, -3.14, 3.146); 
figure, plot(YN');