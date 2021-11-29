clc
clear
close all

imagen_og = imread('melanomas2.jpeg');
figure,imshow(imagen_og)
title('Imagen original');

r_fil = [13,13];

%Filtrado de imagen
filtro_med(:,:,1) = medfilt2(imagen_og(:,:,1),r_fil);
filtro_med(:,:,2) = medfilt2(imagen_og(:,:,2),r_fil);
filtro_med(:,:,3) = medfilt2(imagen_og(:,:,3),r_fil);
[y,x,color] = size(filtro_med);
filtro_med = imcrop(filtro_med,[8,20,x-20,y-50]);
figure, imshow(filtro_med)
title("Imagen filtrada")

im_gray = rgb2gray(filtro_med);
figure, imshow(im_gray)
title("Imagen en esacala de grises")

im_ctr = imadjust(im_gray,[.5,.51]);
im_ctr = im_ctr < .3;
%im_ctr = imfill(im_ctr,'holes');
%[y,x,color] = size(im_ctr);
[label, no_lunares] = bwlabel(im_ctr);
%im_ctr = imcrop(im_ctr,[8,20,x-20,y-50]);
figure, imshow(im_ctr)
title("Imagen contrastada")

datos_lunares = regionprops(label,im_ctr);
centros = cat(1,datos_lunares.Centroid);
areas = cat(1,datos_lunares.Area);

i_max = 1;
i_min = 1;
v_max = 0;
for i = length(areas)
if areas(i) > v_max
v_max = areas(i);
i_max = i;
end
end

v_min = v_max;
for i = length(areas)
if areas(i) < v_min
v_min = areas(i);
i_min = i;
end
end

imagen_og = imcrop(imagen_og,[8,20,x-20,y-50]);

figure, imshow(imagen_og)
hold on
plot(centros(:,1),centros(:,2),'+')
plot(centros(i_max,1),centros(i_max,2),'*')
plot(centros(i_min,1),centros(i_min,2),'o')
plot(53,330)

s1 = "Cantidad de lunares = ";
s2 = string(no_lunares);
s3 = strcat(s1, s2);

legend(s3,"Lunar más grande", "Lunar mas peque#o",'Location','northwest');