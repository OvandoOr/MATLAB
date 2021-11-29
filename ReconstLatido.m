clc
close all
clear all

Fs = 1000;                      %Frecuencia de muestreo
Ts = 1/Fs;

               
    file  = '5C302FFB-5063-4FE2-A2BB-08D24EB52E43m.mat';
    titulo = 'Moxi 6240 Moxi.M2 1180 DILT 83.6 ';
  
    

load (file);     %Cargar archivo con ciclo

[M N] = size (val(1,:));        %Tamano de la senal

Drug = zeros (1,N);             %generacion del vector de la senal

 for g=1:1:12                   %numero de derivaciones 
 Drug = Drug + val(g,:);        %suma del total de derivaciones
 end
 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
DrugMin = min(Drug);
Drug = Drug -DrugMin;
DrugMax = max(Drug);
Drug = Drug/(DrugMax);

%figure, plot (Drug)             %graficado de la senal 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%


 
 
 
%%%%%%%%%%%%%%% Segmentacion latido %%%%%%%%%%%%%%%%%%%%

g=200;
d=1;
t = Ts:Ts:(750*Ts);

 while g < N
 %while d < 2
     
    if Drug(g) < 0.1
      plot (t,Drug(g-230:g+519))
      g-230
      g+519
      
      legend (titulo)
      hold on
      g=g+100;
      Latido(d) = g;
      d=d+1;
      
    end
    
    g=g+1;
      
 end
 
  grid on
 axis ([0 .750 0 1])
 title('Latidos')
xlabel('Tiempo')
ylabel('Amplitud')

%%%%%%%%%%%%%%% Segmentacion latido %%%%%%%%%%%%%%%%%%%%


% 
% y = Drug(657:1406);
%  plot (t,Drug(657:1406))



 
 
 
 
 
 
 
 




 
 

