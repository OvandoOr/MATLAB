clc
close all
clear all

%Prueba 1
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel.mat');

% Result1=cat(2,Entro_fin1,EntropyROM1);

% Result1=(signal_fin);
% for j=1:5
%     media_signal=mean(signal_fin(j,1:1024));
%     std_signal=std(signal_fin(j,1:1024));
%     media_signal_v=media_signal*ones(1,1024);
%     std_signal_v=std_signal*ones(1,1024);
%     Result1(6,:)= media_signal_v;
%     Result1(7,:)= std_signal_v;
% end
% 
% 
% 
% load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano.mat');
% figure, plot(signal_fin')
% hold on
% for j=1:5
%     media_signal=mean(signal_fin(j,1:1024));
%     std_signal=std(signal_fin(j,1:1024));
%     plot(media_signal*ones(1,1024))
%     hold on
%     plot(std_signal*ones(1,1024))
%     hold on
% end
% title('Nanopartículas 1')

% figure, plot(Result1')
% title('Gel 1')

%waitforbuttonpress;
%close all

%Prueba 2
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel1.mat');
figure, plot(signal_fin')
hold on
for j=1:5
    media_signal=mean(signal_fin(j,1:1024));
    std_signal=std(signal_fin(j,1:1024));
    plot(media_signal*ones(1,1024))
    hold on
    plot(std_signal*ones(1,1024))
    hold on
end
title('Gel 2')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano1.mat');
figure, plot(signal_fin')
hold on
for j=1:5
    media_signal=mean(signal_fin(j,1:1024));
    std_signal=std(signal_fin(j,1:1024));
    plot(media_signal*ones(1,1024))
    hold on
    plot(std_signal*ones(1,1024))
    hold on
end
title('Nanopartículas 2')

%waitforbuttonpress;
%close all

%Prueba 3
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel2.mat');
figure, plot(signal_fin')
hold on
for j=1:5
    media_signal=mean(signal_fin(j,1:1024));
    std_signal=std(signal_fin(j,1:1024));
    plot(media_signal*ones(1,1024))
    hold on
    plot(std_signal*ones(1,1024))
    hold on
end
title('Gel 3')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano2.mat');
figure, plot(signal_fin')
hold on
for j=1:5
    media_signal=mean(signal_fin(j,1:1024));
    std_signal=std(signal_fin(j,1:1024));
    plot(media_signal*ones(1,1024))
    hold on
    plot(std_signal*ones(1,1024))
    hold on
end
title('Nanopartículas 3')

waitforbuttonpress;
close all