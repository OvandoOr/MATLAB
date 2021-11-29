clear all
close all 
clc

% Test rotate around
%% Set test parameters
imageX = 300;
imageY = 200;
pointX = 170;
pointY = 120;
angle =  1;

%% Create test image - black dot on white field
image = ones(imageY, imageX);
image(pointY, pointX) = 0;
image2 = zeros(imageY*2, imageX*2);

image2((imageY/2)+1:imageY*1.5,(imageX/2)+1:imageX*1.5)=image;
%% Rotate the image around the black dot
pointX = pointX+imageX/2;
pointY = pointY+imageY/2;

figure,
imshow(image2);
hold on
plot(pointX, pointY, 'or')

rotated = rotateAround(image2,pointY, pointX, angle,'crop');
rotated1 = rotateAround(image2, pointY, pointX, angle,'loose');
%% Plot the rotated image with the original dot position highlighted
figure,
imshow(rotated);
hold on
plot(pointX, pointY, 'or')
figure,
imshow(image);
figure, 
imshow(rotated1);

BW_rec=imbinarize(rotated1,.9);
[y_rec,x_rec]=size(BW_rec);
BW_angle=BW_rec(pointY,pointX:x_rec);
conteo_angle=sum(BW_angle)
imshow(BW_rec);
hold on

line([pointX x_rec], [pointY pointY])
figure, 
imshow(BW_angle);
