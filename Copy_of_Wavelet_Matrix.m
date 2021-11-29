clc 
clear all 
close all


F1 = 2;
F2 = 400;





%%%%%%%%%%%%% Matriz de descomposicion y reconstruccion %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%% Numero de dato en potencia de dos %%%%%%%%%%%%%%%
% n = 11;

n_bits = 16;
n =2^n_bits;                             
N = 10000;  % numeros datos                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    file  = 'ecg_adrian2.mat';
    %file  = 'muestras_fluke_60hz.mat';
    titulo = 'Moxi 6240 Moxi.M2 1180 DILT 83.6 ';
  
    

load (file);     %Cargar archivo con ciclo
%normal=fluke_iecg_60(1:1024*8);
normal=ecg(1:1024*8);

normalMin = min(normal);
normal = normal - normalMin;
normalMax = max(normal);
ecg_analog = normal/(normalMax);

sig=ecg_analog(1:1024*8);
sig=sig';
[M_or, N_or] = size (ecg_analog');
[M, N] = size (sig(1,:));        %Tamano de la senal

%Drug = zeros (1,N);             %generacion del vector de la senal


P = sig;
%Ondoleta Madre
level=6;                                  % DWT level


MW='rbio6.8';                           % Wavelet basis function

%MW='sym7';                           % Wavelet basis function

%Generacion de la senal

% N = 2^n


% x = 0:(F1*2*pi)/(N-1):F1*2*pi;
% x2 = 0:(F2*2*pi)/(N-1):800*pi;
% 
% sine = sin(x);
% sine2 = 0.3*(sin(x2));
% 
% 
% 
% P = sine+sine2;


figure, plot (P)








%Generación de los filtros







%%%%%%%%%%%%%%%%%% wavelets con función %%%%%%%%%%%%%%%



[y_c,l] = wavedec(P,level,MW);

b = size(y_c);


%      figure,subplot (4,1,1)
%      hold on;
%      sano = plot (y_c(1:round(b(2)/8)),'Color','black')
%      grid on;
%       tl=title (strcat ('Wavelet "DB2" con funcion '));
%      set(tl,'fontsize',11,'fontweight','bold');
% 
%      yl=ylabel ('Aprox 3');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      
%      
%      subplot (4,1,2)
%      hold on;
%      plot (y_c(round(b(2)/8):round(b(2)/4)),'Color','black')
%      grid on;
%    
%      yl=ylabel ('Det 3');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      subplot (4,1,3)
%      hold on;
%      plot (y_c(round(b(2)/4):round(b(2)/2)),'Color','black')
%      grid on;
% 
%      yl=ylabel ('Det 2');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      subplot (4,1,4)
%      hold on;
%      
%      plot (y_c(round(b(2)/2):b(2)),'Color','black')
% 
%      yl=ylabel ('Det 1');
%      set(yl,'fontsize',11,'fontweight','bold');
%      grid on;

%%%%%%%%%%% Generación de matrices %%%%%%%%%%%%%%%%%%%





    % numero de datos
L(1) = N;
    % dimension de la matriz
for i=2:7
    L(i) = floor(L(i-1)/2);
end;
    % Filtros de reconstruccion y descomposicion
[LO_D,HI_D,LO_R,HI_R] = wfilters(MW);

% Initialize matrix
% Approximation
WA1(1:L(2),1:L(1)) = 0;
WA2(1:L(3),1:L(2)) = 0;
WA3(1:L(4),1:L(3)) = 0;
WA4(1:L(5),1:L(4)) = 0;
WA5(1:L(6),1:L(5)) = 0;
WA6(1:L(7),1:L(6)) = 0;
% Detail
WD1(1:L(2),1:L(1)) = 0;
WD2(1:L(3),1:L(2)) = 0;
WD3(1:L(4),1:L(3)) = 0;
WD4(1:L(5),1:L(4)) = 0;
WD5(1:L(6),1:L(5)) = 0;
WD6(1:L(7),1:L(6)) = 0;

% Filter length
S = size(LO_D,2);

% Fill matrix with coefficient data
% Level 1
for i=1:L(2)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(1)
            r = r-L(1);
        end;
        WA1(i,r) = LO_D(k);
        WD1(i,r) = HI_D(k);
    end;
end;
% Level 2
for i=1:L(3)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(2)
            r = r-L(2);
        end;
        WA2(i,r) = LO_D(k);
        WD2(i,r) = HI_D(k);
    end;
end;
% Level 3
for i=1:L(4)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(3)
            r = r-L(3);
        end;
        WA3(i,r) = LO_D(k);
        WD3(i,r) = HI_D(k);
    end;
end;
% Level 4
for i=1:L(5)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(4)
            r = r-L(4);
        end;
        WA4(i,r) = LO_D(k);
        WD4(i,r) = HI_D(k);
    end;
end;
% Level 5
for i=1:L(6)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(5)
            r = r-L(5);
        end;
        WA5(i,r) = LO_D(k);
        WD5(i,r) = HI_D(k);
    end;
end;
% Level 6
for i=1:L(7)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(6)
            r = r-L(6);
        end;
        WA6(i,r) = LO_D(k);
        WD6(i,r) = HI_D(k);
    end;
end;

% DWT matrix generation
% Level 1
DWTD1 = WD1;
DWTA1 = WA1;
% Level 2
DWTD2 = WD2*DWTA1;
DWTA2 = WA2*DWTA1;
% Level 3
DWTD3 = WD3*DWTA2;
DWTA3 = WA3*DWTA2;
% Level 4
DWTD4 = WD4*DWTA3;
DWTA4 = WA4*DWTA3;
% Level 5
DWTD5 = WD5*DWTA4;
DWTA5 = WA5*DWTA4;
% Level 6
DWTD6 = WD6*DWTA5;
DWTA6 = WA6*DWTA5;

% IDWT

% Initialize matrix
% Approximation
IA1(1:L(2),1:L(1)) = 0;
IA2(1:L(3),1:L(2)) = 0;
IA3(1:L(4),1:L(3)) = 0;
IA4(1:L(5),1:L(4)) = 0;
IA5(1:L(6),1:L(5)) = 0;
IA6(1:L(7),1:L(6)) = 0;
% Detail
ID1(1:L(2),1:L(1)) = 0;
ID2(1:L(3),1:L(2)) = 0;
ID3(1:L(4),1:L(3)) = 0;
ID4(1:L(5),1:L(4)) = 0;
ID5(1:L(6),1:L(5)) = 0;
ID6(1:L(7),1:L(6)) = 0;

% Fill matrix with coefficient data
% Level 1
for i=1:L(2)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(1)
            r = r-L(1);
        end;
        IA1(i,r) = LO_R(k);
        ID1(i,r) = HI_R(k);
    end;
end;
% Level 2
for i=1:L(3)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(2)
            r = r-L(2);
        end;
        IA2(i,r) = LO_R(k);
        ID2(i,r) = HI_R(k);
    end;
end;
% Level 3
for i=1:L(4)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(3)
            r = r-L(3);
        end;
        IA3(i,r) = LO_R(k);
        ID3(i,r) = HI_R(k);
    end;
end;
% Level 4
for i=1:L(5)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(4)
            r = r-L(4);
        end;
        IA4(i,r) = LO_R(k);
        ID4(i,r) = HI_R(k);
    end;
end;
% Level 5
for i=1:L(6)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(5)
            r = r-L(5);
        end;
        IA5(i,r) = LO_R(k);
        ID5(i,r) = HI_R(k);
    end;
end;
% Level 6
for i=1:L(7)
    j = 2*(i-1);
    for k=1:S
        r = j+k;
        if r>L(6)
            r = r-L(6);
        end;
        IA6(i,r) = LO_R(k);
        ID6(i,r) = HI_R(k);
    end;
end;

% IDWT matrix generation
% Level 1
IWTD1 = ID1;
IWTA1 = IA1;
% Level 2
IWTD2 = ID2*IWTA1;
IWTA2 = IA2*IWTA1;
% Level 3
IWTD3 = ID3*IWTA2;
IWTA3 = IA3*IWTA2;
% Level 4
IWTD4 = ID4*IWTA3;
IWTA4 = IA4*IWTA3;
% Level 5
IWTD5 = ID5*IWTA4;
IWTA5 = IA5*IWTA4;
% Level 6
IWTD6 = ID6*IWTA5;
IWTA6 = IA6*IWTA5;


%%%%%%%%% Multiplicación de las matrices %%%%%%%
 
 G = DWTD1 * P';
 G2 = DWTD2 * P';
 G3 = DWTD3 * P';
 G4 = DWTD4 * P';
 G5 = DWTD5 * P';
 G6 = DWTD6 * P';
 
  A = DWTA1 * P';
 A2 = DWTA2 * P';
 A3 = DWTA3 * P';
 A4 = DWTA4 * P';
 A5 = DWTA5 * P';
 A6 = DWTA6 * P';
 
 
 
 figure,plot(A4);
 figure,plot(A5);
 figure,plot(A6);
 
 filtro=DWTA4;
 filtroI=IWTA4;
 
 [per,per2]=size(filtro);
 signal_fin=zeros(1,floor(N_or/per));
 cantidad_ciclos=floor(N_or/N);
 %per2=per2/2;
 
 for cont_ecg=0:0.5:cantidad_ciclos-1
     if cont_ecg==0
         sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_prelim = filtro * sig_new';
         signal_fin((cont_ecg*per)+1:round((cont_ecg+1)*per*.75))= sig_prelim(1:round(per*.75));
     else
         %sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_new=ecg_analog((cont_ecg*per2)+1:(cont_ecg+1)*per2)';
         sig_prelim = filtro * sig_new';
         signal_fin((cont_ecg*per):(cont_ecg+.5)*per)= sig_prelim(round(per*.25):round(per*.75));   
     end
 end
yy=sig_prelim'*filtroI;
figure(10),plot(yy);

normal=signal_fin;
normalMin = min(normal);
normal = normal - normalMin;
normalMax = max(normal);
normal = normal/(normalMax);

sig_graph=zeros(1,round(cantidad_ciclos*per2/8));
sig_graph((per*.5)+1:end)=normal;
 figure,
 subplot(2,1,1)
 plot(ecg_analog(1:cantidad_ciclos*per2))
 axis([-inf inf -inf inf])
 %hold on
 subplot(2,1,2)
 %plot(1:16:cantidad_ciclos*per2,sig_graph)
 plot(sig_graph)
 axis([-inf inf -inf inf])
 
 
 
 
 
%      figure,subplot (4,1,1)
%      hold on;
%      plot ((G4),'Color','black')
%      grid on;
%      tl=title (strcat ('Wavelet "DB2" con matriz'));
%      set(tl,'fontsize',11,'fontweight','bold');
%      yl=ylabel ('Aprox 3');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      
%      
%      subplot (4,1,2)
%      hold on;
%      plot ((G3),'Color','black')
%      grid on;
%      yl=ylabel ('Det 3');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      subplot (4,1,3)
%      hold on;
%      plot ((G2),'Color','black')
%      grid on;
% 
%      yl=ylabel ('Det 2');
%      set(yl,'fontsize',11,'fontweight','bold');
%      
%      subplot (4,1,4)
%      hold on;
%      
%      plot ((G),'Color','black')
% 
%      yl=ylabel ('Det 1');
%      set(yl,'fontsize',11,'fontweight','bold');
%      grid on;