close all
clear all
clc

Fs=50;
reducion_muestreo=1;
bits=8;
potencia_bits=(2^bits)-1;

T_fs=1/Fs;
t=T_fs:T_fs:1;
Frecuencia=5;
Frecuencia2=50;
w0=2*pi;


dataIn = sin(w0*t*Frecuencia)+sin(w0*t*Frecuencia2);%guardamos nuestra se�al en la variable dataIn


%%normalizacion
min_datos=min(dataIn);%obtenemos el valor minimo de la se�al
datos_restados=dataIn-min_datos;%le restamos a la se�al el valor minimo 
max_datos=max(datos_restados);%obtenemos valor maximo de la se�al restada
datos_norm=datos_restados/max_datos;%le dividimos a la se�al el valor maximo de la se�al restada
datos_digitales_sin_potencia=datos_norm*potencia_bits;%digitalizamos la se�al por la potencia de 2 del numero de bits que queremos
datos_digitales=floor(datos_digitales_sin_potencia);%redondeamos nuestra se�al hacia el valor menos para que no queden decimales

%%proceso de submuestreo
cont=1;%contador de la nueva se�al
[x,y]=size(datos_digitales);%obtenemos el tama�o de nuestra se�al
for i=1:reducion_muestreo:y-reducion_muestreo 
    datos_submuestreados(1,cont)=datos_digitales(1,i);%cada ciertos pasos de la se�al original guardamos el punto de la se�al original para simular un submuestreo
    cont=cont+1;
end

plot(datos_digitales_sin_potencia)%ploteamos los datos
figure,
stairs(datos_submuestreados)%ploteamos los datos de forma escalonada
