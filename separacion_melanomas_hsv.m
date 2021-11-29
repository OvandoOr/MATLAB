%Proyecto detectar figuras
close all
clear all
clc

I = imread('melanoma.jpg');
imhsv = rgb2hsv(I);

piel1 = (imhsv(:,:,1)<=(25/360));
piel2 = (imhsv(:,:,1)>=(335/360));
pielH = or(piel1, piel2);

figure;
subplot(2,2,1),imshow(piel1);
title('piel1');
subplot(2,2,2),imshow(piel2);
title('piel2');
subplot(2,2,3),imshow(pielH);
title('pielH');
subplot(2,2,4),imshow(I);
title('ORIGINAL');

piel3 = (imhsv(:,:,2))>0.6;
piel4 = (imhsv(:,:,2))<0.2;
pielS = not(or(piel3,piel4));

figure;
subplot(2,2,1),imshow(piel3);
title('piel3');
subplot(2,2,2),imshow(piel4);
title('piel4');
subplot(2,2,3),imshow(pielS);
title('pielS');
subplot(2,2,4),imshow(I);
title('ORIGINAL');

pielV = (imhsv(:,:,3))>0.4;
piel = and(pielH,pielS);
piel = and(piel,pielV); 
figure, imshow(piel);
