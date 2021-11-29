close all
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_bits = 16;
n =2^n_bits;                             
N = 10000;  % numeros datos                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    file  = 'ecg_analog.mat';
    titulo = 'Moxi 6240 Moxi.M2 1180 DILT 83.6 ';
  
    

load (file);     %Cargar archivo con ciclo
ecg_analog=ecg_analog';
[M N] = size (ecg_analog(1,:));        %Tamano de la senal

%Drug = zeros (1,N);             %generacion del vector de la senal
Drug = ecg_analog;
%  for g=1:1:12                   %numero de derivaciones 
%  Drug = Drug + val(g,:);        %suma del total de derivaciones
%  end
 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
DrugMin = min(Drug);
Drug = Drug -DrugMin;
DrugMax = max(Drug);
Drug = Drug/(DrugMax);

%figure, plot (Drug)             %graficado de la senal 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


level=6;                                  % DWT level
ACDC='d';                                 % approximation or detail
Drug = floor (Drug*(n-1));


for wave=1:3
    if wave==1
        mwavelet='db7';
    elseif wave==2
        mwavelet='bior3.3';
    elseif wave==3
        mwavelet='sym5';
    end


    [y_c,l] = wavedec(Drug,level,mwavelet);


    g = N;
    for o =1:7

        y_c(g:end) = 0;



        y = waverec(y_c,l,mwavelet);
        % figure, plot (Drug,'b')
        % hold on
        % plot (y,'r')

        b = size(y_c);

         sig_level=y_c(1:g);
%         figure, plot (sig_level)
%         title('Senal Discretizada')
%         xlabel('Numero de Muestras')
%         ylabel('Valor Binario')
% 
%         figure, hist(sig_level,g)
%         title('Histograma')
%         xlabel('Valor Binario')
%         ylabel('Tasa de incidencia')

        hHist3=hist(sig_level,g);


        for i=1:g
            if hHist3(i)==0
                hHist3(i)=1;
            end
        end


        EntropyROM1(wave,o) = log2(g) - sum(hHist3.*log2(hHist3))/g;
        %%%segunda parte

        figure, plot (y)
        title('Senal Discretizada')
        xlabel('Numero de Muestras')
        ylabel('Valor Binario')

        % figure, hist(y,N)
        % title('Histograma')
        % xlabel('Valor Binario')
        % ylabel('Tasa de incidencia')

        hHist2=hist(y,N);


        for i=1:N
            if hHist2(i)==0
                hHist2(i)=1;
            end
        end


        EntropyROM(wave,o) = log2(N) - sum(hHist2.*log2(hHist2))/N;

        g = floor(g/2);
    end
end

%close all;
figure,
%subplot (3,1,1)
plot(EntropyROM(1,:))
hold on
%subplot (3,1,2)
plot(EntropyROM(2,:))
hold on
%subplot (3,1,3)
plot(EntropyROM(3,:))
legend('db1','bior3.3','sym5')
tl=title (strcat ('Entropía de la reconstrucción'));
set(tl,'fontsize',11,'fontweight','bold');

figure,

%subplot (3,1,1)
plot(EntropyROM1(1,:))
hold on
%subplot (3,1,2)
plot(EntropyROM1(2,:))
hold on
%subplot (3,1,3)
plot(EntropyROM1(3,:))
legend('db1','bior3.3','sym5')
tl=title('Entropía de la descomposición');
set(tl,'fontsize',11,'fontweight','bold');

