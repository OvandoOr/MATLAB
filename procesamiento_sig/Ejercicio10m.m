close all
clear all
clc

armonicos = 5; %numero de armonicos deseados
w0=-pi:.01:pi; %periodo T=2pi
[~,s]=size(w0); %barrido de frecuencias de -T/2 a T/2
f=zeros(s,armonicos);  %crea un arreglo de ceros de n x m (filas,columnas) que almacenara a cada armonico 
x=zeros(s,1);       %crea un arreglo de ceros de n x m (filas,columnas) que almacenara la suma de los armonicos
for n=1:1:((armonicos*2)-1); %for que hace la sumatoria de la serie de Fourier. Al ser de la señal cuadrada, recordemos que solo tenemos sumatoria de n impar. Por eso vamos de 1(impar):en incrementos de 2(para que sean puros numeros impares):hasta (armonicos*2)-1 para generar el ultimo armonico de la suma como impar.
    an = (((1-((-1)^n))/(pi*(n^2)))*(cos(n*w0)));
    bn = ((1/n)*sin(n*w0));
    f(:,n)=an+bn; %sacamos mediante la ecuacion obtenida de los coeficientes cada uno de los armonicos. f(:,n) significa f(fila,columna). Es decir, evaluara la funcion (4/(n*pi))*sin(w0*n) para cada punto de w0 (que son 629 puntos) y almacenara cada punto en cada posicion de las filas de f(:) de la columna n (f(:,n). Entonces de cada armonico le correspondera una columna n.
    x=x+f(:,n); %sumamos los armonicos
end %finalisamos el ciclo For
x=x+pi/4; %% a sub cero
figure, plot(w0,x); title('Fourier de una señal')