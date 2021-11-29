clc
close all
clear all
%2016030472
if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
end
s1=serial('COM11','Baudrate',115200);
fopen(s1);
accX=0;
str='';
sen=0;
j=1;
x=0;

hMin = 0;
hMax = 0;
tic
while(j<10000)
    
    str=fscanf(s1);
    sen=str2num(str);
    accX(j)=sen*5/4095;
    x(j)=j;
    
    if(j>200)
        x1=x(j-200:j);
        accX1=accX(j-200:j);
        pulso=accX(j-100:j);
        xmin=j-200;
        xmax=j;
    else
        x1=x;
        accX1=accX;
        pulso=accX;
        xmin=0;
        xmax=200;
    end
    
    
   %t=xlabel(sen);
    
    if rem(j,10) == 0
        plot(x1,accX1);
        axis([xmin xmax 0 5]);
        if rem(j,50) == 0
            hMin = min(pulso);
            hMax = max(pulso);
            
        end
        xlabel(['min= ',num2str(hMin),' max= ',num2str(hMax),' ampl= ',num2str(hMax-hMin)])
        drawnow
    end
    
    j=j+1;

end;
toc
fclose(s1);
delete(s1);
clear s1;