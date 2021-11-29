close all
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n_bits = 16;
n =2^n_bits;                             
%N = 10000;  % numeros datos                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file  = '1_ADS.mat';
  
    

load (file);     %Cargar archivo con ciclo


mov=1;
val1=recSession.tdata(:,:,mov);
val1=val1';

for sig_num=1:1:1
 val=val1(sig_num,:);
[M, N1] = size (val(:)');        %Tamano de la senal

 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
valMin = min(val);  %obtenemos valor minimo de la señal
val = val -valMin; %le restamos el valor minimo a toda la señal
valMax = max(val);  %obtenemos valor maximo de la señal
val = val/(valMax); %dividimos toda la señal por el valor maximo
%esto hara que toda la señal quede de un rango de 0 a 1
val = floor (val*(n-1));

          %graficado de la senal 
 %%%%%%%%%%%%%%%%%%%%%%% Normalizacion %%%%%%%%%%%%%%%%%%%%%%%
repe=floor(N1/n);
Fs=44100;
Ts=N1/Fs;
Freq=1/Fs;


    for num=0:1:repe-1
    y=val((num*n)+1:n*(num+1));
    hHist2=hist(y,n);%calculos para señal reconstruida del histograma iguales a las de arriba


    for i=1:n
        if hHist2(i)==0
            hHist2(i)=1;
        end
    end


    EntropyROM(sig_num,num+1) = log2(n) - sum(hHist2.*log2(hHist2))/n;

    end 
    %figure,




    for num=0:1:N1-n-1
    y1=val(1,(num+1:n+num+1));
    hHist3=hist(y1,n);%calculos para señal reconstruida del histograma iguales a las de arriba


    for i=1:n
        if hHist3(i)==0
            hHist3(i)=1;
        end
    end


    EntropyROM1(sig_num,num+1) = log2(n) - sum(hHist3.*log2(hHist3))/n;

    end 
    %figure,
end


% subplot(3,1,1)
% a=Freq:Freq:Ts;
% plot (a,val1) 
% legend('señal 1','señal 2','señal 3','señal 4')
% %xlim([0 num/Fs+Freq]);
% axis([0 num/Fs+Freq -inf inf]);
% 
% subplot(3,1,2)
% [~,tam1]=size(EntropyROM);
% plot(Ts/tam1:Ts/tam1:Ts,EntropyROM)
% legend('señal 1','señal 2','señal 3','señal 4')
% tl=title('Entropía EMG');
% set(tl,'fontsize',11,'fontweight','bold');
%     
% subplot(3,1,3)
% %plot(EntropyROM1)
% a=Freq:Freq:num/Fs+Freq;
% plot (a,EntropyROM1) 
% legend('señal 1','señal 2','señal 3','señal 4')
% tl=title('Entropía EMG punto a punto');
% set(tl,'fontsize',11,'fontweight','bold');
% axis([0 num/Fs+Freq -inf inf]);
%figure, plot (Drug)             %graficado de la senal original


for cont_sig=1:1
plot(cont_sig)
a=Freq:Freq:Ts;
val_sig=val1(cont_sig,:);
entropia=EntropyROM(cont_sig,:);
entropia1=EntropyROM1(cont_sig,:);

val_sigMin = min(val_sig);  %obtenemos valor minimo de la señal
val_sig = val_sig -val_sigMin; %le restamos el valor minimo a toda la señal
val_sigMax = max(val_sig);  %obtenemos valor maximo de la señal
val_sig = val_sig/(val_sigMax); %dividimos toda la señal por el valor maximo
entropia_min=min(entropia1);
entropia_max=max(entropia1);
plot (a,(val_sig*(entropia_max-entropia_min)+entropia_min))

hold on
[~,tam1]=size(entropia(1,:));
plot(Ts/tam1:Ts/tam1:Ts,entropia)
hold on
a=Freq:Freq:num/Fs+Freq;
plot (a,entropia1) 

legend('señal 1','señal 2','señal 3')
%xlim([0 num/Fs+Freq]);
axis([0 num/Fs+Freq -inf inf]);

end
% subplot(4,1,2)
% [~,tam1]=size(EntropyROM);
% plot(Ts/tam1:Ts/tam1:Ts,EntropyROM)
% legend('señal 1','señal 2','señal 3')
% tl=title('Entropía EMG');
% set(tl,'fontsize',11,'fontweight','bold');
%     
% subplot(4,1,3)
% a=Freq:Freq:num/Fs+Freq;
% plot (a,EntropyROM1) 
% legend('señal 1','señal 2','señal 3')
% tl=title('Entropía EMG punto a punto');
% set(tl,'fontsize',11,'fontweight','bold');
% axis([0 num/Fs+Freq -inf inf]);
% 
% subplot(4,1,4)
% a=Freq:Freq:num/Fs+Freq;
% plot (a,EntropyROM1) 
% legend('señal 1','señal 2','señal 3')
% tl=title('Entropía EMG punto a punto');
% set(tl,'fontsize',11,'fontweight','bold');
% axis([0 num/Fs+Freq -inf inf]);