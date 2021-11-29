clear all
close all
clc

numero_archivo=1;
%for numero_archivo=1:1:12
imgname=sprintf('%d.jpeg',numero_archivo);
filename=sprintf('%d.txt',numero_archivo);

f = imread(imgname);
file=fopen(filename,'w');



figure,
imshow(f);
f_R=f(:,:,1);
f_G=f(:,:,2);
f_B=f(:,:,3);

%figure,
%imshow(f_R);
% figure,
% imshow(f_G);
% figure,
% imshow(f_B);

level_verde=graythresh(f_R)*.8;
level_hoja=graythresh(f_B)*.8;

figure,
BW_verde=imbinarize(f_R,level_verde);
BW_verde=~BW_verde;
imshowpair(f_R,BW_verde,'montage');
conteo_verde=sum(BW_verde(BW_verde==1))

figure,
BW_hoja=imbinarize(f_B,level_hoja);
BW_hoja=~BW_hoja;
imshowpair(f_B,BW_hoja,'montage');
conteo_hoja=sum(BW_hoja(BW_hoja==1))
fprintf(file,'conteo pixeles hoja: %d\n  ',conteo_hoja);

fprintf(file,'conteo pixeles verde: %d\n  ',conteo_verde);


conteo_amarillo=conteo_hoja-conteo_verde
fprintf(file,'conteo pixeles amarillo: %d\n  ',conteo_amarillo);

porcentaje_amarillo=conteo_amarillo/conteo_hoja*100
fprintf(file,'Porcentaje amarillo: %.2f\n  ',porcentaje_amarillo);


porcentaje_verde=conteo_verde/conteo_hoja*100
fprintf(file,'Porcentaje verde: %.2f\n  ',porcentaje_verde);

fclose(file);

%end