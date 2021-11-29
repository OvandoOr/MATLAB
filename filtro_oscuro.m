clear all
close all
clc

imagen_original=imread('lunar.jpg');

[y,x,color]=size(imagen_original)

%corte_eje_x=round(x/2)

imshow(imagen_original)


figure,
imagen_cortada_rojo=imagen_original(:,:,1);
imshow(imagen_cortada_rojo)

figure,
imagen_cortada_verde=imagen_original(:,:,2);
imshow(imagen_cortada_verde)

figure,
imagen_cortada_azul=imagen_original(:,:,3);
imshow(imagen_cortada_azul)


imagen_resaltar=imagen_cortada_rojo;

imagen_binarizada=imbinarize(imagen_resaltar,.8);

imagen_binarizada_invertida=imcomplement(imagen_binarizada);

figure(10),
imshow(imagen_binarizada_invertida)


imagen_verde_binarizada=immultiply(imagen_binarizada_invertida,imagen_cortada_verde);
imagen_rojo_binarizada=immultiply(imagen_binarizada_invertida,imagen_cortada_rojo);
imagen_azul_binarizada=immultiply(imagen_binarizada_invertida,imagen_cortada_azul);


figure(11)
imshow(imagen_azul_binarizada)

imagen_reconstruida(:,:,1)=imagen_rojo_binarizada;
imagen_reconstruida(:,:,2)=imagen_verde_binarizada;
imagen_reconstruida(:,:,3)=imagen_azul_binarizada;

figure(20)
imshow(imagen_reconstruida)