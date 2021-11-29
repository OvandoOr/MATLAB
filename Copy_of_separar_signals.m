close all
clc
clear all

load '1.mat'

Fs = 1000;                      %Frecuencia de muestreo
Ts = 1/Fs;
periodo=Fs/2;
L = 1000;             % Length of signal
%t = (0:L-1)*T;        % Time vector

ECG=sum(val);   %suma del total de derivaciones
[M N] = size (ECG(1,:));        %Tamano de la senal
     
 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
ECGMin = min(ECG);
ECG = ECG -ECGMin;
ECGMax = max(ECG);
ECG = ECG/(ECGMax);
figure, plot (ECG)             %graficado de la senal 
%%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Segmentacion latido %%%%%%%%%%%%%%%%%%%%
g=periodo; %punto de inicio, se usa para evitar 
latidos=0; %variable para contar los latidos
d=1;
figure
 while g < N
    if ECG(g) > 0.85 %busca los puntos mas altos de la normalizacion para marcar el punto mas alto del latido
      if g>N-periodo
         plot (ECG(g-periodo:end)) 
         latidos=latidos+1; %aumenta los latidos
         g=g+periodo/2;
      else
          fin_ECG(:,d)=ECG(g-periodo:g+periodo-1);
          plot (ECG(g-periodo:g+periodo))%a partir del punto mas alto grafica 500 puntos hacia atras y 500 hacia delante
          hold on %mantiene la grafica para que se encimen las señales
          g=g+periodo/2; %se salta un segmento del ecg para evitar usar el mismo pico dos veces
          latidos=latidos+1; %aumenta los latidos
          d=d+1;
      end
    end  
    g=g+1; 
 end
 
 segmento_p=fin_ECG(251:450,:);
 segmento_qrs=fin_ECG(451:550,:);
 segmento_t=fin_ECG(551:end,:);
 figure,plot(segmento_p);
 title('segmento p')
 figure,plot(segmento_qrs);
 title('segmento qrs')
 figure,plot(segmento_t);
 title('segmento t')
 
 fin_p=segmento_p(:,1);
 fin_qrs=segmento_qrs(:,1);
 fin_t=segmento_t(:,1);
 for i=2:d-1
     fin_p=cat(1,fin_p,segmento_p(:,i));
     fin_qrs=cat(1,fin_qrs,segmento_qrs(:,i));
     fin_t=cat(1,fin_t,segmento_t(:,i));
 end
 
%  NFFT_p = 2^nextpow2(L);
%  NFFT = 2^nextpow2(L);
%  NFFT = 2^nextpow2(L);
%  
% cuadrada_fft = fft(cuadrada,NFFT);
% P2_cuadrada = abs(cuadrada_fft/NFFT);
% P1_cuadrada = P2_cuadrada(1:NFFT/2+1);
% P1_cuadrada(2:end-1) = 2*P1_cuadrada(2:end-1);
% 
% triangular_fft = fft(triangular,NFFT);
% P2_triangular = abs(triangular_fft/NFFT);
% P1_triangular = P2_triangular(1:NFFT/2+1);
% P1_triangular(2:end-1) = 2*P1_triangular(2:end-1);
% 
% diente_sierra_fft = fft(diente_sierra,NFFT);
% P2_diente_sierra = abs(diente_sierra_fft/NFFT);
% P1_diente_sierra = P2_diente_sierra(1:NFFT/2+1);
% P1_diente_sierra(2:end-1) = 2*P1_diente_sierra(2:end-1);
% 
% sumatoria_fft = fft(sumatoria,NFFT);
% P2_sumatoria = abs(sumatoria_fft/NFFT);
% P1_sumatoria = P2_sumatoria(1:NFFT/2+1);
% P1_sumatoria(2:end-1) = 2*P1_sumatoria(2:end-1);
% 
% f = Fs*(0:(NFFT/2))/NFFT;
% 
% figure, plot(f,P1_cuadrada) 
% % title('Espectro señal cuadrada')
% % xlabel('f (Hz)')
% % ylabel('|P1(f)|')
% 
% hold  on
% plot(f,P1_triangular) 
% % title('Espectro señal triangular')
% % xlabel('f (Hz)')
% % ylabel('|P1(f)|')
% 
% hold  on
% plot(f,P1_diente_sierra) 
% % title('Espectro señal diente de sierra')
% % xlabel('f (Hz)')
% % ylabel('|P1(f)|')
% 
% 
% %%%funcion histogramas y demas de entropia


