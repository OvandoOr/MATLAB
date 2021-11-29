     
clc 
clear all 
close all


file  = 'ecg_analog.mat';

n_bits = 12;
n =2^n_bits; 
    

load (file);     %Cargar archivo con ciclo
load ('wave_sym7_D4.mat');     %Cargar archivo con ciclo
DWTA4_int=round(DWTD4*2^8);
maxim=max(DWTA4_int);
maxim_max=max(maxim);
minim=min(DWTA4_int);
minim_min=min(minim);
% DWTA4_int=DWTA4_int-minim_min;

ecg_analog=ecg_analog(1:4096*4);
normal=ecg_analog;

normalMin = min(normal);
normal = normal - normalMin;
normalMax = max(normal);
ecg_analog = normal/(normalMax);

ecg_analog = floor (ecg_analog*(n-1));

sig=ecg_analog(1:512);
sig=sig';
[M_or, N_or] = size (ecg_analog');
[M, N] = size (sig(1,:));        %Tamano de la senal

%Drug = zeros (1,N);             %generacion del vector de la senal
%sig = floor (sig*(n-1));

P = sig;


[per,per2]=size(DWTA4_int);
 signal_fin=zeros(1,floor(N_or/per));
 cantidad_ciclos=floor(N_or/N);
 %per2=per2/2;
 
 for cont_ecg=0:0.5:cantidad_ciclos-1
     if cont_ecg==0
         sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_prelim = round(DWTA4_int * sig_new');
         signal_fin((cont_ecg*per)+1:round((cont_ecg+1)*per*.75))= sig_prelim(1:round(per*.75));
     else
         %sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_prelim = round(DWTA4_int * sig_new');
         signal_fin((cont_ecg*per):(cont_ecg+.5)*per)= sig_prelim(round(per*.25):round(per*.75));   
     end
 end
 
 
  
normal=signal_fin;
normalMin = min(normal);
normal = normal - normalMin;
normalMax = max(normal);
normal = normal/(normalMax);

normal_bits=floor (normal*(n-1));

sig_graph=zeros(1,round(cantidad_ciclos*per2/8));
sig_graph((per*.5)+1:end)=normal_bits;
 figure,
 subplot(2,1,1)
 plot(ecg_analog(1:cantidad_ciclos*per2))
 axis([-inf inf -inf inf])
 hold on
 %figure,
 subplot(2,1,2)
 plot(sig_graph)
 axis([-inf inf -inf inf])