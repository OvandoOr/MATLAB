clear all
close all
clc

imagen_original=imread('circulos_ruido.jpg');
%[y,x,color]=size(imagen_original)
figure,imshow(imagen_original)
K = medfilt2(imagen_original(:,:,1));



imagen_bin=(imagen_original(:,:,1) >= .9*255)&(imagen_original(:,:,2) >= .4*255)&(imagen_original(:,:,3) <= .1*255);
imagen_bin=imfill(imagen_bin,'holes');
medfilt2(J);

figure,
imshow(imagen_bin)

imagen_rojo_binarizada=immultiply(imagen_bin,imagen_original(:,:,1));
imagen_verde_binarizada=immultiply(imagen_bin,imagen_original(:,:,2));
imagen_azul_binarizada=immultiply(imagen_bin,imagen_original(:,:,3));

imagen_reconstruida(:,:,1)=imagen_rojo_binarizada;
imagen_reconstruida(:,:,2)=imagen_verde_binarizada;
imagen_reconstruida(:,:,3)=imagen_azul_binarizada;

figure,
imshow(imagen_reconstruida)
