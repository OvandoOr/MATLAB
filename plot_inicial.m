clc
close all
clear all

%Prueba 1
load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel.mat');


figure,plot(signal_fin')
hold on
for j=1:5
    media_signal=mean(signal_fin(j,1:1024));
    std_signal=std(signal_fin(j,1:1024));
    plot(media_signal*ones(1,1024))
    hold on
    plot(std_signal*ones(1,1024))
    hold on
end

title('Gel 1')

load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano.mat');
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
title('Nanopartículas 1')

%waitforbuttonpress;
%close all

% %Prueba 2
% load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel1.mat');
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
% title('Gel 2')
% 
% load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano1.mat');
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
% title('Nanopartículas 2')
% 
% %waitforbuttonpress;
% %close all
% 
% %Prueba 3
% load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_gel2.mat');
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
% title('Gel 3')
% 
% load('C:\Users\MarthaAlicia\Desktop\MATLAB\señales_nano_matlab\Signal_fin_nano2.mat');
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
% title('Nanopartículas 3')

%waitforbuttonpress;
%close all