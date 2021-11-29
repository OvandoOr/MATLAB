close all
clear all
clc

sig=[10 0 3 0 -3 -7 -10];

sig_inv=fliplr(sig);

plot(sig)

figure,

plot(sig_inv)