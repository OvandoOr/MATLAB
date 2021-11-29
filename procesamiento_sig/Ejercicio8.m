close all
clear all
clc

Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 50;             % Length of signal
t = (0:L-1)*T;        % Time vector
Frecuencia_signals=100;

%S = 0.7*sin(2*pi*10*t) + sin(2*pi*20*t);  

armonicos =20; %numero de armonicos deseados
w0=-pi:.01:pi; %periodo T=2pi
Periodo=1000;
f_t = square(w0*Periodo); %señal cuadrada de -T/2 a T/2
[~,s]=size(w0*Periodo); %barrido de frecuencias de -T/2 a T/2
f=zeros(Periodo,armonicos);  %crea un arreglo de ceros de n x m (filas,columnas) que almacenara a cada armonico 
x=zeros(Periodo,1);       %crea un arreglo de ceros de n x m (filas,columnas) que almacenara la suma de los armonicos

for n=1:1:((armonicos*2)-1); %for que hace la sumatoria de la serie de Fourier. Al ser de la señal cuadrada, recordemos que solo tenemos sumatoria de n impar. Por eso vamos de 1(impar):en incrementos de 2(para que sean puros numeros impares):hasta (armonicos*2)-1 para generar el ultimo armonico de la suma como impar.
    if rem(n,2)
    f(:,n)=(sin(w0*n*Periodo))/n; %sacamos mediante la ecuacion obtenida de los coeficientes cada uno de los armonicos. f(:,n) significa f(fila,columna). Es decir, evaluara la funcion (4/(n*pi))*sin(w0*n) para cada punto de w0 (que son 629 puntos) y almacenara cada punto en cada posicion de las filas de f(:) de la columna n (f(:,n). Entonces de cada armonico le correspondera una columna n.
    x=x+f(:,n); %sumamos los armonicos

    end
end %finalisamos el ciclo For
x=x*4/pi;
figure,plot(x); %graficamos la serie de Fourier de la señal