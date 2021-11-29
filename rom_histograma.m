clc
clear all
close all
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 12;                                      % Resolucion
m = 10;                                      % No. de datos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 2^n;
M = 2^m;


a = 0; b = N-1;
h=[1,1:M];

%load ('D:\Diseños\Tesis Graficado Micro\Captura Reconstruccion\Altera DE2\Pruebas\2BB\TS\M1.mat')
%h = ones(1,M);


% NF = DataTS;

%h = round(a + (b-a) * rand(1,M));
x = -0:.1:M;
f= sin(x);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SizeRom = size (f)
% 
% for i = 1:SizeRom(1,2)
%     
%  if (f(i) < 0)
%    v(i) = -1;
%  else
%      v(i) = 1;
% end;
%  
%     
% end





% h = round(a + (b-a) * (v+3.5)/4.5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = round(a + (b-a) * (sin(x)+11.5)/12.5);
%h = round(a + (b-a) * (square(x)+13)/14);

%h = round(a + (b-a) * (sawtooth(x,1)+9)/11);




figure, plot(h,'Color','blue')
hold on
%plot(w,'Color','red')
grid on








%%%%%%%%%%%%%%%%%%%%%%%%%%%%55555
% MAX = max(NF)
% MIN = min(NF)
% g = (NF + abs(MIN));
% MAXG = max(g)
% g = (g / MAXG) * N
% SIZE = size (NF);
% DIV = SIZE/M;
% h= g(1:DIV(1):SIZE)'

%h(1,160:M) = 2;
%h(1,180:M) = 3;
%h(1,200:M) = 40;
%h(1,250:M) = 8





%figure, plot (h)
%figure, hist (h,N)






%----  rom histograma

    
    f=sprintf('C:\\Users\\MarthaAlicia\\Desktop\\MATLAB\\rom_histograma.vhd');
    fid = fopen(f,'wt');
    

fprintf(fid,'library ieee; \n');
fprintf(fid,'use ieee.std_logic_1164.all;	\n');
fprintf(fid,'use ieee.numeric_std.all;\n');
fprintf(fid,'entity Rom_Histograma is\n');
fprintf(fid,'	generic(\n');
fprintf(fid,'	n: 	integer:= %d;		-- No. de bits informacion\n',n);
fprintf(fid,'	m:	integer:= %d 		-- No. de bits para datos\n',m);
fprintf(fid,'	); \n');
fprintf(fid,'	port \n');
fprintf(fid,'	(\n');
fprintf(fid,'		CLK		: in std_logic;\n');
fprintf(fid,'		addr	: in std_logic_vector (m-1 downto 0);\n');
fprintf(fid,'		q		: out std_logic_vector((n -1) downto 0)\n');
fprintf(fid,'	);\n');
fprintf(fid,'end Rom_Histograma;\n');
fprintf(fid,'architecture rtl of Rom_Histograma is\n');
	

fprintf(fid,'	subtype word_t is std_logic_vector((n-1) downto 0);\n');
fprintf(fid,'	type memory_t is array(0 to (2**m)-1 ) of word_t;\n');
fprintf(fid,'	function init_rom\n');
fprintf(fid,'		return memory_t is \n');
fprintf(fid,'		variable tmp : memory_t :=(\n');
    
for i=1:M
    h_vector(i,:)=Decimal_2_PuntoFijo(h(1,i),n,n);
    indice(i,:)=Decimal_2_PuntoFijo(N-i,n,n);
    
    if i~=M
%        fprintf(fid,'\t\twhen "');
        for j=1:m      
 %           fprintf(fid,'%d',indice(i,j));
        end
        fprintf(fid,'\t "');
            
        for j=1:n
            fprintf(fid,'%d',h_vector(i,j));
        end
        fprintf(fid,'",  \t --  %d \t %d \n',h(1,i), i-1); 
    else
  %      fprintf(fid,'\t\twhen others  ');
        fprintf(fid,' \t"');
            
        for j=1:n
            fprintf(fid,'%d',h_vector(i,j));
        end
        fprintf(fid,'");  --  %d \t %d\n',h(1,i), i-1); 
    end   
end

fprintf(fid,'	begin \n');
fprintf(fid,'		return tmp;\n');
fprintf(fid,'	end init_rom;\n');
fprintf(fid,'	signal rom : memory_t := init_rom;\n');


fprintf(fid,'begin\n');
fprintf(fid,'	process(clk,ADDR)\n');
fprintf(fid,'		variable addr2 : natural range 0 to 2**m - 1;\n');
fprintf(fid,'	begin\n');
fprintf(fid,'	addr2 := to_integer(unsigned(ADDR));\n');
fprintf(fid,'	if( falling_edge(clk)) then\n');
fprintf(fid,'		q <= rom(addr2);\n');
fprintf(fid,'	end if;\n');
fprintf(fid,'	end process;\n');
	

	
fprintf(fid,'end rtl;\n');


fclose(fid)

figure, hist(h,M)


