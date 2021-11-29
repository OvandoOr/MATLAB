
variable=DWTA4_int;
var_name='A';
var_type='const PROGMEM char ';
[M ,N]=size(variable);
fileID = fopen('variable_filt_iecg.txt','w');
%const char ARRAY[64000]
%const int Array[][2] = {{1,2},{3,4},{5,6},...,{X,Y}};

fprintf(fileID,var_type);
fprintf(fileID,var_name);
fprintf(fileID,'[][]={'); %multidimensional
%fprintf(fileID,'[]='); %unidimensional

 for i=1:M-1  %multidimensional
 fprintf(fileID,'{');
 fprintf(fileID,'%d,',variable(i,1:N-1));
 fprintf(fileID,'%d},\n',variable(i,N));
 end  %multidimensional

fprintf(fileID,'{');
fprintf(fileID,'%d,',variable(M,1:N-1));
fprintf(fileID,'%d}};',variable(N)); %multidimensional
%fprintf(fileID,'%d};',variable(N));  %unidimensional

fclose(fileID);