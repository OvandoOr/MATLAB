clear all
close all 
clc

k=1;
imageX = 300;
imageY = 200;
pointX = 150;
pointY = 100;
%% Create test image - black dot on white field
image = ones(imageY, imageX);
figure,
imshow(image)
for i=1:1:360
    
    conteo_angulo(k)= rotate_conteo_f(image,imageX,imageY,pointX,pointY,i);
    k=k+1;
end
figure,
plot(conteo_angulo)