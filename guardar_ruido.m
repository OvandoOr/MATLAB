clear all
close all
clc

imagen_original=imread('circulo.png');
figure,imshow(imagen_original)

imagen_ruido = imnoise(imagen_original,'gaussian',.1);

figure,
imshow(imagen_ruido)

imwrite(imagen_ruido,'circulos_ruido.jpg')
