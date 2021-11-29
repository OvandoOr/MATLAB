clc
close all
clear all


t=-10:0.01:10;
A=4;
B=1;

fase1=0;
fase2=pi/2;

w0=2*pi;
w1=3*pi;



subplot(3,1,1);
x1=A*cos(w0*t+fase1);
plot(t,x1);
grid on
xlabel('t');
ylabel('x1');

subplot(3,1,2);
x2=B*cos(w1*t+fase2);
plot(t,x2);
grid on
set(gca,'xtick',-10:1:10)
set(gca,'ytick',-10:1:10)
xlabel('t');
ylabel('x2');


subplot(3,1,3);
x3=x1+x2;
plot(t,x3);
grid on
%set(gca,'xtick',[-10:1:10])
%set(gca,'ytick',[-10:1:10])
xlabel('t');
ylabel('x3');

