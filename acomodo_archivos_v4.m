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
             idx=idx+1;
           end
       end
    end
end

for x=1:idx-1
   FILE=name_txt(x,:);
   File_fin=regexp(FILE, '(?<=^\s*)\S.*?(?=\s*$)', 'match', 'once');
   size2=length(File_fin);
   fileID = fopen(FILE(1:size2),'r');
   datos_fin(:,x) = fscanf(fileID, ['%d']);
   fclose(fileID);
end


