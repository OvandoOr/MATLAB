clear all
close all
clc

imagen_original=imread('gato.jpg');

[y,x,color]=size(imagen_original);

%imtool(imagen_original)



imagen_rojo=imagen_original(:,:,1);
imtool(imagen_rojo)

% imagen_verde=imagen_original(:,:,2);
% imshow(imagen_verde)

% imagen_azul=imagen_original(:,:,3);
% imshow(imagen_azul)
