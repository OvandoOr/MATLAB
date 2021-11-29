clear all
close all
clc

imagen_original=imread('circulos_ruido.jpg');
imagen_hsv=rgb2hsv(imagen_original);
figure,imshow(imagen_original)

hue=imagen_hsv(:,:,1);
saturacion=imagen_hsv(:,:,2);
imagen_bin=(hue >= .0833)&(hue <= .1667)&(saturacion > .5);
imagen_bin=imfill(imagen_bin,'holes');

figure,
imshow(imagen_bin)

[im_count,conteo]=bwlabel(imagen_bin);
measurements = regionprops(im_count);
imagen_original(repmat(~imagen_bin,[1 1 3])) = 0;

centros=cat(1,measurements.Centroid);

figure,
imshow(im_count);
hold on
plot(centros(:,1),centros(:,2),'.')