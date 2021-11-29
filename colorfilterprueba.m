I = imread('hue.jpg');
I = im2double(I);
I_m = colorfilter(I,[90 150]);

HSV = rgb2hsv(I_m);
parte1=HSV(:,:,1);
parte2=HSV(:,:,2);
parte3=HSV(:,:,3);
figure,imshow(I_m,[]);
%figure,imshow(parte1);
figure,imshow(parte2);
%figure,imshow(parte3);

nivel_verde=graythresh(parte2)*.9;

BW_verde=imbinarize(parte2,nivel_verde);
figure,imshow(BW_verde);
conteo_color_verde=sum(BW_verde(BW_verde==1))

% BW_verde_angle = imrotate(BW_verde,45);
BW_verde_angle = imrotate(BW_verde,45,'nearest','crop');

conteo_color_verde_angle=sum(BW_verde(BW_verde==1))
figure,imshow(BW_verde_angle);
