clear all
close all
clc

imagen_original=imread('tumor.jpg');
imshow(imagen_original)
imagen_binarizada_directo=(imagen_original(:,:,1)>=.9*255 & imagen_original(:,:,2) >=.4*255 & imagen_original(:,:,3)<=.1*255);

figure(11),
imshow(imagen_binarizada_directo)

