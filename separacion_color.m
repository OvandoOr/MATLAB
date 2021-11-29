clear all
close all
clc

imgname='melanoma.jpg';

f = imread(imgname);

figure,
imshow(f);
f_R=f(:,:,1);
f_G=f(:,:,2);
f_B=f(:,:,3);

figure,
imshow(f_R);
figure,
imshow(f_G);
figure,
imshow(f_B);

 level_verde=graythresh(f_R)*.8;
 level_hoja=graythresh(f_B)*.8;

figure,
%BW_verde=imbinarize(f_R,level_verde);
BW_verde=im2bw(f_R,level_verde);
BW_verde=~BW_verde;
imshowpair(f_R,BW_verde,'montage');
conteo_verde=sum(BW_verde(BW_verde==1))

figure,
%BW_hoja=imbinarize(f_B,level_hoja);
BW_hoja=im2bw(f_B,level_hoja);
BW_hoja=~BW_hoja;
imshowpair(f_B,BW_hoja,'montage');
conteo_hoja=sum(BW_hoja(BW_hoja==1))


conteo_amarillo=conteo_hoja-conteo_verde

porcentaje_amarillo=conteo_amarillo/conteo_hoja*100


porcentaje_verde=conteo_verde/conteo_hoja*100

