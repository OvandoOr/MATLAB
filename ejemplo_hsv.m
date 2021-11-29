clear all
close all
clc

imagen_original=imread('tumor.jpg');
im_hsv = rgb2hsv(imagen_original);
figure,
imshow(imagen_original)
figure,
imshow(im_hsv)
imagen_binarizada_directo=(im_hsv(:,:,1)>=.0833 & im_hsv(:,:,1)<=.1667)&(im_hsv(:,:,3)>=.8)&(im_hsv(:,:,2)>=.8);

im_final=imfill(imagen_binarizada_directo,'holes');
figure(11),
imshow(imagen_binarizada_directo)
figure(12),
imshow(im_final)