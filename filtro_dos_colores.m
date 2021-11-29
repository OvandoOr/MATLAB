clear all
close all
clc

imagen_original=imread('tumor.jpg');

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


imagen_resaltar=imagen_cortada_verde;
imagen_binarizada=imbinarize(imagen_resaltar,.4);
figure(11),
imshow(imagen_binarizada)

imagen_resaltar_2=imagen_cortada_rojo;
imagen_binarizada_2=imbinarize(imagen_resaltar_2,.9);
figure(12),
imshow(imagen_binarizada_2)

imagen_resaltar_3=imcomplement(imagen_cortada_azul);
imagen_binarizada_3=imbinarize(imagen_resaltar_3,.9);
figure(13),
imshow(imagen_binarizada_3)


imagen_binarizada_RG=immultiply(imagen_binarizada,imagen_binarizada_2);
imagen_binarizada_RGB=immultiply(imagen_binarizada_RG,imagen_binarizada_3);

%imagen_binarizada_invertida=imcomplement(imagen_binarizada);

figure(10),
imshow(imagen_binarizada_RGB)

%[labeledImage, numberOfCircles] = bwlabel(imagen_binarizada_RGB);

imagen_verde_binarizada=immultiply(imagen_binarizada_RGB,imagen_cortada_verde);
imagen_rojo_binarizada=immultiply(imagen_binarizada_RGB,imagen_cortada_rojo);
imagen_azul_binarizada=immultiply(imagen_binarizada_RGB,imagen_cortada_azul);

imagen_reconstruida(:,:,1)=imagen_rojo_binarizada;
imagen_reconstruida(:,:,2)=imagen_verde_binarizada;
imagen_reconstruida(:,:,3)=imagen_azul_binarizada;

figure(20)
imshow(imagen_reconstruida)