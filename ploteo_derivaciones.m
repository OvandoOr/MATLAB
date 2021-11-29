close all
clc
clear all

load '1.mat'

ECG1=sum(val(1:3,:));
figure, plot (ECG1)             
title('Se�al 3 derivaciones')
xlabel('t (milliseconds)')
ylabel('X(t)')

ECG2=sum(val(1:6,:));
figure, plot (ECG2)    
title('Se�al 6 derivaciones')
xlabel('t (milliseconds)')
ylabel('X(t)')

ECG3=sum(val(1:9,:));
figure, plot (ECG3)  
title('Se�al 9 derivaciones')
xlabel('t (milliseconds)')
ylabel('X(t)')


ECG4=sum(val);
figure, plot (ECG4)  
title('Se�al 12 derivaciones')
xlabel('t (milliseconds)')
ylabel('X(t)')
