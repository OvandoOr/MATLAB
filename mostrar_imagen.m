clear all
close all
clc

imagen_original=imread('persona.jpg');

[y,x,color]=size(imagen_original)

%corte_eje_x=round(x/2)

imagen_cortada=imagen_original(9:204,415:555,1:color);


subplot(1,2,1)
imshow(imagen_original)
subplot(1,2,2)
imshow(imagen_cortada)

figure,
imagen_cortada_rojo=imagen_cortada(:,:,1);
imshow(imagen_cortada_rojo)

figure,
imagen_cortada_verde=imagen_cortada(:,:,2);
imshow(imagen_cortada_verde)

figure,
imagen_cortada_azul=imagen_cortada(:,:,3);
imshow(imagen_cortada_azul)


imagen_resaltar=imagen_cortada_rojo;

imagen_binarizada=imbinarize(imagen_resaltar,.8);

figure(10),
imshow(imagen_binarizada)
