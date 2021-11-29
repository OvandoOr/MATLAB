close all
clear all
clc

%%CT = dicomread('TAC');

%imshow(CT,[]);

%imtool(CT,[])

MRI = imread('RM');

subplot(1,3,1);
imshow(MRI,[30 75]);
subplot(1,3,2);
imshow(MRI,[120 150]);
subplot(1,3,3);
imshow(MRI,[155 170]);