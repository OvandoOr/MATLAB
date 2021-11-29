%ECG entropia
%1 nivel wavelet eliminar detalle 1 y reconstruir y entropia
%2 nivel wavelet eliminar detalle 2 y reconstruir y entropia
%----------------------------------------------------------
%6 nivel
%grafica de filtrado x=nivel y=entropia
%3 ondoletas diferentes en misma grafica de diferencias
%grafica descomposicion en 12 bits

clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%m =5;       
num_bits=15;
n = 2^num_bits;                           %N�mero de posibles datos  
N = 1024;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                         
% N = 2^n                          %n�mero de eventos
% M = 2^m                          %Cantidad de datos                      



% h= [1 2 3 4 1 2 3 4];

for o = 1:1:22

x = 0:(2*pi)/(N-1):2*pi;    % M puntos
h = square(x);                 % Senal

h = awgn (h,o*5);           %adici�n de ruido

%h = ones (1,M);
%h = 1:1:N;

%h = 0:31;

%h = [h]

%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
hMin = min(h);
h = h - (hMin);
hMax = max(h);
h = h/(hMax);



%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%

h = (h * (n-1));                    % resoluci�n de n bits
% h = (h *20);


%h = [1 3 4 3 11 13 15 3 7 7 6 1 3 4 3 11 13 15 3 7 7 6 ]

h = floor(h);

figure, plot (h)
title('Senal Discretizada')
xlabel('Numero de Muestras')
ylabel('Valor Binario')



figure, hist(h,n)
title('Histograma')
xlabel('Valor Binario')
ylabel('Tasa de incidencia')

hHist2=hist(h,n);


for i=1:n
    if hHist2(i)==0
        hHist2(i)=1;
    end
end


EntropyROM(o) = log2(N) - sum(hHist2.*log2(hHist2))/N;

% if EntropyROM ~= 0
%     EntropyROM(o)
% end
end



figure, plot(EntropyROM);
grid on
title('Entropia de Shannon')
xlabel('Medicion')
ylabel('Entropia')

grid on;

