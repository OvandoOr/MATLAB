%ECG entropia
%1 nivel wavelet eliminar detalle 1 y reconstruir y entropia
%2 nivel wavelet eliminar detalle 2 y reconstruir y entropia
%----------------------------------------------------------
%6 nivel
%grafica de filtrado x=nivel y=entropia
%3 ondoletas diferentes en misma grafica de diferencias
%grafica descomposicion en 12 bits

close all
clear all
clc


file  = '5C302FFB-5063-4FE2-A2BB-08D24EB52E43m.mat';

load (file);     %Cargar archivo con ciclo

[M N] = size (val(1,:));        %Tamano de la senal

Drug = zeros (1,N);             %generacion del vector de la senal

 for g=1:1:12                   %numero de derivaciones 
 Drug = Drug + val(g,:);        %suma del total de derivaciones
 end   
 
 DrugMin = min(Drug);
Drug = Drug -DrugMin;
DrugMax = max(Drug);
Drug = Drug/(DrugMax);

y=Drug;
figure, plot (y)                % Graficado de la se�al chirp   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


level=7;                                  % DWT level

mwavelet='bior3.7';                           % Wavelet basis function

ACDC='d';                                 % approximation or detail



[y_c,l] = wavedec(y,level,mwavelet);
%wave_ref = wrcoef(ACDC,c,l,mwavelet,level);

b = size(y_c);

y_c(round(676/8:end))=0;

y = waverec(y_c,l,mwavelet);
figure(10),
%plot(Drug,'b');
hold on;
plot(y,'r');
   