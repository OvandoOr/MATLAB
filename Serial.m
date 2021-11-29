clc
close all
clear all


bytes = (1024);         % un latido
%bytes = (2048);         % dos latido
%bytes = (4096);         % cuatro latido
%bytes = (8192);         % ocho latido



s = serial('COM3');
%s = serial('/dev/tty.KeySerial1');
set(s,'BaudRate',115200,'Parity','even', 'InputBufferSize',bytes)
%set(s,'BaudRate',115200,'Parity','even')
fopen(s);
data = fread(s);
fclose(s);


figure, plot (data)