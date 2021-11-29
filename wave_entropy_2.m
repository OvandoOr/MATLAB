close all
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_bits = 12;
n =2^n_bits;                             
N = 10000;  % numeros datos                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    file  = '5C302FFB-5063-4FE2-A2BB-08D24EB52E43m.mat';
    titulo = 'Moxi 6240 Moxi.M2 1180 DILT 83.6 ';
  
    

load (file);     %Cargar archivo con ciclo

% [M N] = size (val(1,:));        %Tamano de la senal

Drug = zeros (1,N);             %generacion del vector de la senal

 for g=1:1:12                   %numero de derivaciones 
 Drug = Drug + val(g,:);        %suma del total de derivaciones
 end
 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
DrugMin = min(Drug);  %obtenemos valor minimo de la señal
Drug = Drug -DrugMin; %le restamos el valor minimo a toda la señal
DrugMax = max(Drug);  %obtenemos valor maximo de la señal
Drug = Drug/(DrugMax); %dividimos toda la señal por el valor maximo
%esto hara que toda la señal quede de un rango de 0 a 1

%figure, plot (Drug)             %graficado de la senal 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wavelets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


level=7;                                  % DWT level
ACDC='d';                                 % approximation or detail
Drug = floor (Drug*(n-1));                 %"digitalizamos" la señal multiplicando hasta el posible 
                                           %valor maxim dependiendo de la
                                           %resolucion en bits y
                                           %redondeando hacia abajo por que
                                           %los valores digitales no tienen
                                           %decimales

hHist4=hist(Drug,N); %histograma de la señal original


for i=1:N
    if hHist4(i)==0
        hHist4(i)=1;%para obtener la entropia no podemos tener valores en 0 en el histograma
    end             %este for se encarga de buscar todos los ceros de la señal y convertirlos a 1
end


EntropyDrug = log2(N) - sum(hHist4.*log2(hHist4))/N;%formula de entropia
EntropyROM4(1:7)=EntropyDrug;%creamos un vector con el mismo valor para que en la grafica aparezca como una linea recta
        
for wave=1:3 %este for selecciona la ondoleta madre
    if wave==1 %ondoleta madre primera vuelta
        mwavelet='db1';
    elseif wave==2 %ondoleta madre segunda vuelta
        mwavelet='db5';
    elseif wave==3 %ondoleta madre tercera vuelta
        mwavelet='db7';
    end
    %figure,

    [y_c,l] = wavedec(Drug,level,mwavelet);%funcion de wavelet para la descomposicion


    g = N/2;%dividimos la cantidad de datos de la señal para usar a g como indice inicial para separar lo que queremos en des/rec wavelet
    for o =1:7 %numero de niveles de descomposicion para las repeticiones
        
        [y_c_1,l_1] = wavedec(Drug,o,mwavelet);%descomposicion variable por cada repeticion basada en la variable o
        %genera la señal que se dejara en descomposicion para la grafica de
        %comparacion
        
        y_c(g:end) = 0;%señal para la rec dejamos en ceros las partes que no queremos que sean recontruidas para filtrar
                    
        y = waverec(y_c,l,mwavelet); %funcion de reconstruccion wavelet
        
        % figure, plot (Drug,'b')%grafica de señal original para comparar von la reconstruccion
        % hold on
        % plot (y,'r')

        b = size(y_c); %tamaño de la señal para la rec

        sig_level=y_c_1(1:g); %tomamos la parte que queremos graficar para la señal descompuesta
        [sig_a, sig_b] = size(sig_level);%tomamos los tamaños de la señal descompuesta
        
        %figure(wave+10),%indicamos en que figura se graficara para evitar que se mezcle con las otras graficas
        figure(1),
        hold on %permite que grafiquemos varias señales
        
        %plot(1:2^o:sig_b*2^o,sig_level) %señal descompuesta indicando en la grafica un rango especifico en y para que las señales puedan compararse
        plot(1:2^o:sig_b*2^o,sig_level+(o*20000)) %lo mismo de arriba pero con las señales mas separadas para comparar mas facil
        graphname= sprintf('Senal descompuesta %d',wave);%nombre grafica
        title(graphname)
        xlabel('Numero de Muestras')
        ylabel('Valor Binario')
        
%         figure, plot (sig_level) %señales por separado
%         title('Señal descompuesta')
%         xlabel('Numero de Muestras')
%         ylabel('Valor Binario')
% 
%         figure, hist(sig_level,g)
%         title('Histograma de señal descompuesta')
%         xlabel('Valor Binario')
%         ylabel('Tasa de incidencia')

        hHist3=hist(sig_level,g);%calculos para señal descompuesta del histograma iguales a las de arriba


        for i=1:g
            if hHist3(i)==0
                hHist3(i)=1;
            end
        end


        EntropyROM1(wave,o) = log2(g) - sum(hHist3.*log2(hHist3))/g;
       
        %%%segunda parte

        %figure(wave), %elegimos figura especifica para graficar
        figure(2),
        hold on
        plot (y +(o*10000)) %grafica señal reconstruida
%       plot (Drug)%comparar con original

        graphname= sprintf('Senal reconstruida %d',wave);%nombre grafica
        title(graphname)
        xlabel('Numero de Muestras')
        ylabel('Valor Binario')

        % figure, hist(y,N)
        % title('Histograma')
        % xlabel('Valor Binario')
        % ylabel('Tasa de incidencia')

        hHist2=hist(y,N);%calculos para señal reconstruida del histograma iguales a las de arriba


        for i=1:N
            if hHist2(i)==0
                hHist2(i)=1;
            end
        end


        EntropyROM(wave,o) = log2(N) - sum(hHist2.*log2(hHist2))/N;

        g = floor(g/2);%division de g para usarse para los indices de la señales de rec y des
    end
end

%close all;
figure,
%%%%graficas de entropia de reconstruccion
plot(EntropyROM4)
hold on
%subplot (3,1,1)
plot(EntropyROM(1,:))
hold on
%subplot (3,1,2)
plot(EntropyROM(2,:))
hold on
%subplot (3,1,3)
plot(EntropyROM(3,:))
%%%titulos y demas para la grafica
legend('Original','db4','db5','db7') 
tl=title (strcat ('Entropía de la reconstrucción'));
set(tl,'fontsize',11,'fontweight','bold');


%%%%graficas de entropia de descomposicion
figure,
plot(EntropyROM4)
hold on
%subplot (3,1,1)
plot(EntropyROM1(1,:))
hold on
%subplot (3,1,2)
plot(EntropyROM1(2,:))
hold on
%subplot (3,1,3)
plot(EntropyROM1(3,:))
legend('Original','db4','db5','db7')
tl=title('Entropía de la descomposición');
set(tl,'fontsize',11,'fontweight','bold');

%figure, plot (Drug)             %graficado de la senal original


