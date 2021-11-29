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
             nombre_archivo= blanks(26);
             if(idx<10)
               nombre_archivo(1:23)=Filenames;  
             end
             if(idx>9 && idx<100)
               nombre_archivo(1:24)=Filenames;  
             end
             if(idx>99 && idx<1000)
               nombre_archivo(1:25)=Filenames;  
             end
             if(idx>999 && idx<10000)
               nombre_archivo(1:26)=Filenames;  
             end
             name_txt(j,1:26)=nombre_archivo;
             idx=idx+1;
           end
       end
    end
end

for x=1:idx-1
    fileID = fopen(name_txt(x,:),'r');
    datos_fin(:,x) = fscanf(fileID, ['%d']);
    fclose(fileID);
end
