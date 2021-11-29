clear all
close all
clc

[file,direc] = uigetfile({'*.jpg';'*.png'})
s = strcat(direc,file)
imagen_original=imread(s);
figure,imshow(imagen_original)

imagen_media(:,:,1)=medfilt2(imagen_original(:,:,1),[9 9]);
imagen_media(:,:,2)=medfilt2(imagen_original(:,:,2),[9 9]);
imagen_media(:,:,3)=medfilt2(imagen_original(:,:,3),[9 9]);

figure,imshow(imagen_media)

imagen_hsv=rgb2hsv(imagen_media);
hue=imagen_hsv(:,:,1);
saturacion=imagen_hsv(:,:,2);
imagen_bin=(hue >= .0833)&(hue <= .1667)&(saturacion > .5);
%imagen_bin=imfill(imagen_bin,'holes');

figure,
imshow(imagen_bin)

[imagen_etiquetada,cantidad_circulos]=bwlabel(imagen_bin);

mediciones=regionprops(imagen_etiquetada);
centro=cat(1,mediciones.Centroid);
areas=cat(1,mediciones.Area);

imagen_filtrada=imagen_media;
imagen_filtrada(repmat(~imagen_bin,[1 1 3])) = 0;

figure,
imshow(imagen_filtrada);
hold on
plot(centro(:,1),centro(:,2),'+')

nombre_im=strcat('filt',file)
imwrite(imagen_filtrada,nombre_im);