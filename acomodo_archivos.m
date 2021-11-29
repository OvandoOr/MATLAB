clc
close all
clear all

%dir_name='C:\Users\MarthaAlicia\Desktop\MATLAB\prueba_archivo\TRIANGULAR\p\';
%Files=dir(dir_name);

Files=dir();
cantidad_archivos=length(Files);
n=1;
idx=0;

for j=1:cantidad_archivos
    for  k=1:cantidad_archivos
       Filenames=Files(k).name;
       c = strsplit(Filenames, '_');
       nombre_final=c(1);
       out=cellfun(@(x) x(regexp(x,'[^a-zA-Z]')),nombre_final,'un',0);
       if(Files(k).isdir==0)
           if(str2double(out)==j)
             name_txt(j,:)=Filenames;
             idx=idx+1;
           end
       end
    end
end

for x=1:idx
    fileID = fopen(name_txt(x,:),'r');
    datos_fin(:,x) = fscanf(fileID, ['%d']);
    fclose(fileID);
end


