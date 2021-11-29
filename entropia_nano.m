clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m =10;                            
n =10;                           %N?mero de bits  
                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


N = 2^n;                          %n?mero de eventos
M = 2^m;                          %Cantidad de datos                      


% for f = 1:1:3
%     switch f
%         case 1
%           file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel.mat';  
%         case 2
%           file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel1.mat'; 
%         case 3
%           file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel2.mat';     
%     end
% % h= [1 2 3 4 1 2 3 4];
% 
% load(file);
% 
% nano = signal_fin;
% 
% for o = 1:1:5;
% 
% x = 1:1024;    % M puntos
% h = nano(o,x);                 % Senal
% 
% %h = awgn (h,o*5);           %adici?n de ruido
% 
% 
% 
% 
% %%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
% hMin = min(h);
% h = h - (hMin);
% hMax = max(h);
% h = h/(hMax);
% 
% 
% 
% %%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
% 
% h = (h * (N-1));                    % resoluci?n de n bits
% 
% 
% 
% % figure, plot (h) title('Senal Discretizada') xlabel('Numero de Muestras')
% % ylabel('Valor Binario')
% % 
% % 
% % 
% % figure, hist(h,N) title('Histograma') xlabel('Valor Binario')
% % ylabel('Tasa de incidencia')
% 
% hHist2=hist(h,N);
% 
% 
% for i=1:N
%     if hHist2(i)==0
%         hHist2(i)=1;
%     end
% end
% 
% 
% EntropyROM(o) = n - sum(hHist2.*log2(hHist2))/N;
% 
% if EntropyROM ~= 0
%     EntropyROM(o);
% end
% end
%     if f == 1
%         Entro_fin=EntropyROM;
%     else
%         Entro_fin=cat(2,Entro_fin,EntropyROM);
%     end
% %hold on
% 
% end
% figure, plot(Entro_fin); grid on title('Entropia de gel')
% xlabel('Medicion') ylabel('Entropia')



for f = 1:1:3
    switch f
        case 1
          file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano.mat';  
        case 2
          file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano1.mat'; 
        case 3
          file  = 'C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano2.mat';     
    end
% h= [1 2 3 4 1 2 3 4];

load(file);

nano = signal_fin;

for o = 1:1:5;

x = 1:1024;    % M puntos
h = nano(o,x);                 % Senal

%h = awgn (h,o*5);           %adici?n de ruido




%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
hMin = min(h);
h = h - (hMin);
hMax = max(h);
h = h/(hMax);



%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%

h = (h * (N-1));                    % resoluci?n de n bits



%figure, plot (h)
%title('Senal Discretizada')
%xlabel('Numero de Muestras')
%ylabel('Valor Binario')



%figure, hist(h,N)
%title('Histograma')
%xlabel('Valor Binario')
%ylabel('Tasa de incidencia')

hHist2=hist(h,N);


for i=1:N
    if hHist2(i)==0
        hHist2(i)=1;
    end
end


EntropyROM1(o) = n - sum(hHist2.*log2(hHist2))/N;

if EntropyROM1 ~= 0
    EntropyROM1(o);
end
end
    if f == 1
        Entro_fin1=EntropyROM1;
    else
        Entro_fin1=cat(2,Entro_fin1,EntropyROM1);
    end
%hold on

end
%figure, plot(Entro_fin);
%hold on
plot(Entro_fin1);
grid on
legend('Gel','Nanopartículas')
title('Entropia de nano')
xlabel('Medicion')
ylabel('Entropia')
%Entropia_gel=sum(Entro_fin,2)
Entropia_nano=sum(Entro_fin1,2)
%Porcentaje_de_mejora=abs(Entropia_gel*100-Entropia_nano*100)/Entropia_gel
grid on;