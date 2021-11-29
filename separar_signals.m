close all
clc
clear all

load 'ecgerick1.mat'
%load '1.mat'


Fs = 128;                      %Frecuencia de muestreo
Ts = 1/Fs;
periodo=Fs/2;

ECG=ecgerick(:)';
%ECG=sum(val);   %suma del total de derivaciones
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
figure

 while g < N
    if ECG(g) > 0.85 %busca los puntos mas altos de la normalizacion para marcar el punto mas alto del latido
      if g>N-periodo
%          plot (ECG(g-periodo:end)) 
%          latidos=latidos+1; %aumenta los latidos
%          g=g+periodo/2;
      else
          plot (ECG(g-periodo:g+periodo-1))%a partir del punto mas alto grafica 500 puntos hacia atras y 500 hacia delante
          hold on %mantiene la grafica para que se encimen las señales
          ECG_fin(latidos+1,:)=ECG(g-periodo:g+periodo-1);
          g=g+periodo/2; %se salta un segmento del ecg para evitar usar el mismo pico dos veces
          latidos=latidos+1; %aumenta los latidos
      end
    end  
    g=g+1; 
 end
 
 p=(ECG_fin(:,20:60));
 figure,
 plot(0:40,p);
 qrs=(ECG_fin(:,60:75));
 figure,
 plot(0:15,qrs);
 t=(ECG_fin(:,75:end));
 figure,
 plot(0:53,t);
%%%%%%%%%%%%%%% Segmentacion latido %%%%%%%%%%%%%%%%%%%%
ECG_p=zeros(8,128); ECG_qrs=zeros(8,128); ECG_t=zeros(8,128);
for sep=1:latidos 
    
    ECG_separado=ECG_fin(sep,:);
    min_p=p(sep,1); max_p=p(sep,end);
    min_qrs=qrs(sep,1); max_qrs=qrs(sep,end);
    min_t=t(sep,1); max_t=t(sep,end);
    
    ECG_p(sep,20:60)=p(sep,:); ECG_p(sep,1:19)=min_p; ECG_p(sep,61:end)=max_p;
    
    ECG_qrs(sep,60:75)=qrs(sep,:); ECG_qrs(sep,1:59)=min_qrs; ECG_qrs(sep,76:end)=max_qrs;
    
    ECG_t(sep,75:end)=t(sep,:); ECG_t(sep,1:74)=min_t; %ECG_t(sep,116:end)=max_t;
    
end


 figure,
 subplot(3,1,1)
 plot(1:128,ECG_p);
 axis([-inf inf 0 1])
 %figure,
 subplot(3,1,2)
 plot(1:128,ECG_qrs);
 axis([-inf inf 0 1])
 %figure,
 subplot(3,1,3)
 plot(1:128,ECG_t);
 axis([-inf inf 0 1])
