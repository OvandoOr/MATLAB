%Proyecto detectar figuras
close all
clear all
clc

%%Leer la imagen
I = imread('melanoma.jpg');
% imshow(I);
% imtool(I);
%%RGB
rmat=I(:,:,1);
gmat=I(:,:,2);
bmat=I(:,:,3);

figure;
subplot(2,2,1),imshow(rmat);
title('ROJO');
subplot(2,2,2),imshow(gmat);
title('VERDE');
subplot(2,2,3),imshow(bmat);
title('AZUL');
subplot(2,2,4),imshow(I);
title('ORIGINAL');

%%Blanco y Negro piel
levelr_piel = 0.2;   %.63
levelg_piel = 0.3;  %.5
levelb_piel = 0.3;   %.4
i1_piel=im2bw(rmat,levelr_piel);
i2_piel=im2bw(gmat,levelg_piel);
i3_piel=im2bw(bmat,levelb_piel);
%Isum_piel = (i1_piel+i2_piel)&i3_piel;
Isum_piel =i1_piel;

%Ploteo
figure;
subplot(2,2,1),imshow(i1_piel);
title('PLANO ROJO PIEL');
subplot(2,2,2),imshow(i2_piel);
title('PLANO VERDE PIEL');
subplot(2,2,3),imshow(i3_piel);
title('PLANO AZUL PIEL');
subplot(2,2,4),imshow(Isum_piel);
title('SUMA DE LOS PLANOS PIEL');

%%Blanco y Negro lunares
levelr = 0.63;   %.63
levelg = 0.3;  %.5
levelb = 0.3;   %.4
i1=~im2bw(rmat,levelr);
i2=~im2bw(gmat,levelg);
i3=~im2bw(bmat,levelb);
Isum = i1&i2&i3;


%Ploteo
figure;
subplot(2,2,1),imshow(i1);
title('PLANO ROJO');
subplot(2,2,2),imshow(i2);
title('PLANO VERDE');
subplot(2,2,3),imshow(i3);
title('PLANO AZUL');
subplot(2,2,4),imshow(Isum);
title('SUMA DE LOS PLANOS');

I_fin=Isum&Isum_piel;
piel_cc=imfill(I_fin,'Holes');

se = strel('disk',20);
piel_dilatacion = imdilate(I_fin,se);

figure,
imshow(I_fin);
figure,
imshow(piel_cc);
figure,
imshow(piel_dilatacion);