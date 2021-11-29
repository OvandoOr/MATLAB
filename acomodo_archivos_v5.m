clc
close all
clear all

Files=dir();
cantidad_archivos=length(Files);
n=1;
idx=1;


for j=1:cantidad_archivos
    for  k=1:cantidad_archivos
       Filenames=Files(k).name;
       c = strsplit(Filenames, '_');
       nombre_final=c(1);

       out=cellfun(@(x) x(regexp(x,'[^a-zA-Z]')),nombre_final,'un',0);
       if(Files(k).isdir==0)
           if(str2double(out)==j)
             nombre_archivo= blanks(100);
             size=length(Filenames);
             nombre_archivo(1:size)=Filenames;  
             name_txt(j,1:100)=nombre_archivo;
             
             data_cant=c(2);
             cant_datos_out=cellfun(@(x) x(regexp(x,'[^a-zA-Z]')),nombre_final,'un',0);
             cantidad_datos(j)=str2double(cant_datos_out);
             idx=idx+1;
           end
       end
    end
end

cnt_datos_mayor=max(cantidad_datos);
datos_fin_array=zeros(cnt_datos_mayor,idx-1);

for x=1:idx-1
   FILE=name_txt(x,:);
   File_fin=regexp(FILE, '(?<=^\s*)\S.*?(?=\s*$)', 'match', 'once'); %elimina los espacios
   size2=length(File_fin);
   fileID = fopen(File_fin(1:size2),'r');
   datos_fin = fscanf(fileID, ['%d']);
   cant_datos_fin=length(datos_fin);
   datos_fin_array(1:cant_datos_fin,x) = datos_fin;
   datos_fin_array(cant_datos_fin+1,x)=-1;
   fclose(fileID);
end


