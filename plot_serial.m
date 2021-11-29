clc
close all
clear all

s = serial('COM3');
%s = serial('/dev/tty.KeySerial1');
%set(s,'BaudRate',115200,'DataBits',8)
set(s,'BaudRate',115200,'Parity','even')
fopen(s);

voltage = 0;

t = 0;

y = 1;


voltage = fscanf(s);
VoltageValue(y,1)=str2double(voltage);
h = animatedline(t,VoltageValue(y,1));

xlim([0 1000]);
ylim([100 1000]);


tic
while t <= 1000
voltage = fscanf(s);
VoltageValue(y,1)=str2double(voltage);
addpoints(h, t, VoltageValue(y,1));
 t= t+1;
 y= y+1;
 if rem(t,10) == 0
    drawnow
 end
end
toc

fclose(s);
delete(s);
clear s;