clear all
close all 
clc
u = 0:.1:3
n=zeros(1,10);
% u=cat(2,n,u1);
% u=cat(2,u,n);
t=[n,u,n];
plot(t)
sig=ones(1,21);
sig=[n,sig,n];
figure,
plot(sig)
%v = [2 7];
w = conv(sig,t);
figure,
plot(w)