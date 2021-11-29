
close all
clear all
clc


arch=1;
if arch==1 
    file= 'BRAYAN_fft.mat';
elseif arch==2
    file= 'Eduardo_fft.mat'
elseif arch==3
    file= 'Edwin_fft.mat'
elseif arch==4
    file= 'Hector_fft.mat'
elseif arch==5
    file= 'Rodrigo_fft.mat'
end

load (file);     %Cargar archivo con ciclo
ecg_analog=ecg_analog(1:1024*2)';
[M N] = size (ecg_analog(1,:));        %Tamano de la senal

Drug = ecg_analog;         %generacion del vector de la senal

DrugMin = min(Drug);
Drug = Drug -DrugMin;
DrugMax = max(Drug);
Drug = Drug/(DrugMax);
% x = Ts:Ts:T_exp; 
y=Drug;
% figure, spectrogram(y,64,0,512,Fs,'yaxis')    %espectrograma con una ventana de 256 datos, un traslape de 125 datos, con una frecuencia de muestreo de 12 kHz 
level=5;                                  % DWT level
mwavelet='bior3.5';                           % Wavelet basis function
%coif3
ACDC='d';                                 % approximation or detail



[y_c,l] = wavedec(y,level,mwavelet);
%wave_ref = wrcoef(ACDC,c,l,mwavelet,level);
sig=y_c;
b = size(Drug);
o=level;
y_c(round(b(2)/2^o:end))=0;
plot(sig(1:round(b(2)/2^o)),'r');
xsize=round(b(2)/2^o);
y = waverec(y_c,l,mwavelet);
figure(10),
subplot(2,1,1)
plot(Drug,'b');
subplot(2,1,2)
plot(y,'r');
     
% figure,
% plot (sig(1:round(b(2)/2^o)),'Color','black')

figure,subplot (4,1,1)
hold on;
sano = plot (sig(1:round(b(2)/2^o)),'Color','black')
grid on;
tl=title (strcat ('Wavelet "DB2" '));
set(tl,'fontsize',11,'fontweight','bold');

yl=ylabel ('Aprox 3');
set(yl,'fontsize',11,'fontweight','bold');
%axis([0 1250 -1 3]);


subplot (4,1,2)
hold on;
plot (sig(round(b(2)/2^(o)):round(b(2)/2^(o-1))),'Color','black')
grid on;

yl=ylabel ('Det 3');
set(yl,'fontsize',11,'fontweight','bold');
%axis([0 1250 -.2 .2]);

subplot (4,1,3)
hold on;
plot (sig(round(b(2)/2^(o-1)):round(b(2)/2^(o-2))),'Color','black')
grid on;

yl=ylabel ('Det 2');
set(yl,'fontsize',11,'fontweight','bold');
%axis([0 2500 -.2 .2]);


subplot (4,1,4)
hold on;

plot (sig(round(b(2)/2^(o-2)):b(2)/2^(o-3)),'Color','black')


yl=ylabel ('Det 1');
set(yl,'fontsize',11,'fontweight','bold');
grid on;
%axis([0 5000 -.02 .02]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%