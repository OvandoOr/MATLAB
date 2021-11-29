clear all
close all 
clc
CT = dicomread('ct_file.dcm'); 

figure
imshow(CT,[]),title('CT original');  