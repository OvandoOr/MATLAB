%Proyecto detectar figuras
close all
clear all
clc

%%Leer la imagen
I = imread('peligro.jpeg');
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

%%Blanco y Negro
levelr = 0.5;   %.63
levelr2 = 0.2;   %. piel
levelg = 0.1;  %.5
levelb = 0.2;   %.4
i1=~im2bw(rmat,levelr2);
i1_2=~im2bw(rmat,levelr);
i2=~im2bw(gmat,levelg);
i3=~im2bw(bmat,levelb);
Isum = i1+i2+i3;
Isum = ~Isum;
figure;
imshow(i1_2)

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

%%COMPLEMENTAR IMAGEN Y LLENAR 
Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp,'holes');
figure, imshow(Ifilled);
%   pause()
%%
se = strel('disk',3);
Iopenned = imopen(Ifilled,se);
%figure,imshowpair(Iopenned,I);
imshow(Iopenned);

%%Extraer caracteristicas
Iregion = regionprops (Iopenned, 'centroid');
[labeled,numObjects] = bwlabel(Iopenned,4);
stats = regionprops (labeled, 'Eccentricity', 'Area','BoundingBox'); %'Centroid','MinIntensity'
areas =[stats.Area];
eccentricities = [stats.Eccentricity];


%%Contador de objetos
idxOfSkittles = find(eccentricities);
statsDefects = stats(idxOfSkittles);

figure, imshow(I);
hold on;

for idx = 1 : length(idxOfSkittles)
    h = rectangle ('Position',statsDefects(idx).BoundingBox,'EdgeColor','g','LineWidth',3);
    set(h,'EdgeColor',[0 1 0]);
    hold on
end

if idx > 10
    title (['HAY ', num2str(numObjects), ' LUNARES ']);
end 
hold off;