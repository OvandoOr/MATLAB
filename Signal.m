clear all;
close all;
clc
 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Step 2
% % Signal Generation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


FileName = 'ROM_Chirp';

% Fs = 3000;
% Tr = 4096/Fs;
% k  = 0;
% a  = 0.64;
% f  = 46.875;
% p  = 0.0;

t = 0:1/12E3:2;          


Fs = 1024;                    % Frecuencia de muestreo
Ts = 1/Fs;                    % Tiempo de muestreo
T = Ts;
L = size(t);                   % Ancho de la senal
h = (0:L(2)-1)*T;              % Vector del tiempo


%%%%%%%%%%%%%%%%%%%%%%  Senoidal %%%%%%%%%%%%%%%%%%%%%%%%%
  
F1 = 7;                     %Frecuencia en Hz
F2 =5;                     %Frecuencia en Hz

T_Exp = 2;                  %tiempo del experimento en segundos
pha = 0;                    %fase en radianes


x1 = Ts:Ts*2*pi:2*pi;
x1 = x1*F1*T_Exp;

x2 = Ts:Ts*2*pi:2*pi;
x2 = x2*F2*T_Exp;




[M1,N1] = size (x1);


t = 0: (T_Exp/(N1-1)):T_Exp;
g1 = square (x1+pha);                          %%%Senal Senoidal
g2 = sin (x2+pha)*0.1;                   %%%Senal Cuadrada

%X = g1+g2;
X = g2;
plot(X)
save X.mat
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Step 2
% % Automatic VHDL file generation of Signal
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data resolution in bits
B = 12;

% Computation
% Vector size
C = size(X,2);
% MAC programmable counter bits
V = floor(log2(C)+0.5);

% DWT
% Format computation
CM = max(abs(X));        % Maximum absolute column coefficient value
T  = 1.0 - 2.0^(1-B);    % Least value represented with B bits
% Integer part
e  = 1 + ceil(log(CM)/log(2.0*T));
% Fractionary part
f  = B - e;
% Quantization factor
Fq = 2^f;
% Coefficient quantization by rounding
Vq = floor(X*Fq + 0.5);
% Coefficient scaling
Vs = Vq/Fq;
% Coefficient binarization in 2's complement
for i=1:C 
    % Positive-integer adjustment for negative numbers
    Auxiliar = Vq(i);
    if (Auxiliar < 0)
        Auxiliar = 2^B + Auxiliar;
    end;
    % Binarization
    for k=B:-1:1
        ABI(i,k) = rem(Auxiliar,2);
        Auxiliar = floor(Auxiliar/2);
    end;
end;

% Open VHDL file
fid = fopen([FileName '.vhd'],'wt');
%fid = fopen([FileName '.tx'],'wt');
% Description header
fprintf(fid,'library IEEE;\n');
fprintf(fid,'use IEEE.std_logic_1164.all;\n');
fprintf(fid,'use ieee.numeric_std.all;\n');
fprintf(fid,'\n');
fprintf(fid,'entity %s is\n',FileName);
fprintf(fid,'   port(\n');
% Coefficient index declaration
fprintf(fid,'      CLK : in std_logic;\n');
fprintf(fid,'      I   : in  std_logic_vector(%d downto 0);\n',V-1);
% Filter coefficient declaration
fprintf(fid,'      A   : out std_logic_vector(%d downto 0)\n',B-1);
fprintf(fid,'      );\n');
fprintf(fid,'   end entity;\n');
fprintf(fid,'\n');
fprintf(fid,'architecture ROM of %s is\n',FileName);
fprintf(fid,'\n');
fprintf(fid,'subtype word_t is std_logic_vector(%d downto 0);\n',B-1);
fprintf(fid,'type memory_t is array(0 to %d) of word_t;\n',C-1);
fprintf(fid,'\n');
fprintf(fid,'signal rom : memory_t := (');
fprintf(fid,'         -- Coefficient format %d.%d\n',e,f);
% Automatic table generation
for i=1:C
    fprintf(fid,'   "');
    % Coefficient binarization
    for j=1:B
        fprintf(fid,'%d',ABI(i,j));
    end;
    if (i == C)
        fprintf(fid,'" -- Column %d   Coefficient %1.8f\n',i,Vs(i));
    else
        fprintf(fid,'", -- Column %d   Coefficient %1.8f\n',i,Vs(i));
    end;    
    
end;
fprintf(fid,');\n');
% End VHDL file
fprintf(fid,'begin\n');
fprintf(fid,'	process(clk)\n');
fprintf(fid,'	begin\n');
fprintf(fid,'	if(rising_edge(CLK)) then\n');
fprintf(fid,'		A <= rom(to_integer(unsigned(I)));\n');
fprintf(fid,'	end if;\n');
fprintf(fid,'	end process;\n');
fprintf(fid,'end ROM;\n');
% Close file
fclose(fid);
%'End of ROM Generation'