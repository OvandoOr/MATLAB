
close all
clear all
clc


%file  = '1_ADS.mat';
file  = '5C302FFB-5063-4FE2-A2BB-08D24EB52E43m.mat';

load (file);     %Cargar archivo con ciclo

%val=recSession.tdata(:,1,1);

[M N] = size (val(1,:));        %Tamano de la senal

Drug = zeros (1,N);             %generacion del vector de la senal


 for g=1:1:12                   %numero de derivaciones 
 Drug = Drug + val(g,:);        %suma del total de derivaciones
 end   
%Drug=val';
DrugMin = min(Drug);
Drug = Drug -DrugMin;
DrugMax = max(Drug);
Drug = Drug/(DrugMax);
%x = 0:.0001:2*pi;

A       = 1;          %amplitud
F1      = 100;          %frecuencia analógica
F2      = 3000;
F3      = 2000;
Fs      = 10000;       %Frecuencia de muestreo
Ts      = 1/Fs;       %Tiempo de muestreo
T_exp   = 2.3;          % tiempo de experimentación en segundos

x = Ts:Ts:T_exp; 





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Generaci�n de se�al %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %y1 = sawtooth (x*F1*2*pi);
% y1 = sin (x*F2*2*pi);
% %y1 = chirp(x,3500,1.9,1500);     % Se�al chirp de 26 Hz hasta 6 kHz, cruzando al segundo 1.534 la frecuencia de 4.6 kHz
% y2 = chirp(x,26,1.534,2600,'logarithmic');     % Se�al chirp de 26 Hz hasta 6 kHz, cruzando al segundo 1.534 la frecuencia de 4.6 kHz
% y= y1+y2;
y=Drug;
%save ('examen.mat','y')



%y2 = chirp(t,200,1.534,4600, 'logarithmic');
figure, plot (y)                % Graficado de la se�al chirp   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Generaci�n de se�al %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure, spectrogram(y,64,0,512,Fs,'yaxis')    %espectrograma con una ventana de 256 datos, un traslape de 125 datos, con una frecuencia de muestreo de 12 kHz 







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


level=6;                                  % DWT level

mwavelet='db1';                           % Wavelet basis function

ACDC='d';                                 % approximation or detail



[y_c,l] = wavedec(y,level,mwavelet);
%wave_ref = wrcoef(ACDC,c,l,mwavelet,level);

b = size(y_c);
div=4;

     figure,subplot (5,1,1)
     hold on;
     sano = plot (y_c(1:round(b(2)/16/div)),'Color','black')
     grid on;
      tl=title (strcat ('Wavelet "DB2" '));
     set(tl,'fontsize',11,'fontweight','bold');

     yl=ylabel ('Aprox 6');
     set(yl,'fontsize',11,'fontweight','bold');
     %axis([0 round(b(2)/16/div) -5 5]);
     
     subplot (5,1,2)
     hold on;
     plot (y_c(round(b(2)/16/div):round(b(2)/8/div)),'Color','black')
     grid on;
   
     yl=ylabel ('Det 6');
     set(yl,'fontsize',11,'fontweight','bold');
     %axis([0 round(b(2)/16/div) -1 1]);
     
     subplot (5,1,3)
     hold on;
     plot (y_c(round(b(2)/8/div):round(b(2)/4/div)),'Color','black')
     grid on;
   
     yl=ylabel ('Det 5');
     set(yl,'fontsize',11,'fontweight','bold');
     %axis([0 round(b(2)/8/div) -1 1]);
     
     subplot (5,1,4)
     hold on;
     plot (y_c(round(b(2)/4/div):round(b(2)/2/div)),'Color','black')
     grid on;

     yl=ylabel ('Det 4');
     set(yl,'fontsize',11,'fontweight','bold');
     %axis([0 round(b(2)/4/div) -1 1]);
      
      
     subplot (5,1,5)
     hold on;
     
     plot (y_c(round(b(2)/2/div):round(b(2)/div)),'Color','black')
     
     
     yl=ylabel ('Det 3');
     set(yl,'fontsize',11,'fontweight','bold');
     grid on;
     %axis([0 round(b(2)/2/div) -1 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%