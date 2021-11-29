clc
close all
clear all

%Prueba 1
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel.mat');
Result1=(signal_fin);
figure, plot(Result1')
title('Gel 1')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano.mat');
figure, plot(signal_fin')
hold on
title('Nanopartículas 1')



%waitforbuttonpress;
%close all

%Prueba 2
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel1.mat');
figure, plot(signal_fin')
hold on

title('Gel 2')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano1.mat');
figure, plot(signal_fin')

title('Nanopartículas 2')

%waitforbuttonpress;
%close all

%Prueba 3
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel2.mat');
figure, plot(signal_fin')

title('Gel 3')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano2.mat');
figure, plot(signal_fin')

title('Nanopartículas 3')

waitforbuttonpress;
close all