close all
clc
clear all

retina=imread('retina.tif');
retina2=retina;

figure(1);
subplot(2,2,1);
imshow(retina);
title('Imagen original');

retina_noise=imnoise(retina,'gaussian',0.01);
subplot(2,2,2);
imshow(retina_noise);
title('Imagen c/ruido gaussiano');

%convertir de uint8 a single
retina_noise=double(retina_noise);
retina=double(retina);

%Uso de la funcion avanzado
retina_suav=suavizado(retina,3);

%uso de distintas mascaras con distintas dimensiones
retina_suav_3=suavizado(retina_noise,3);
retina_suav_6=suavizado(retina_noise,6);
retina_suav_9=suavizado(retina_noise,9);
retina_suav_12=suavizado(retina_noise,12);

subplot(2,2,3);
imshow(retina_suav,[]);
title('Imagen original suavizada');
subplot(2,2,4);
imshow(retina_suav_3,[]);
title('Imagen c/ruido suavizada');

figure(2)
subplot(2,3,[1 4]);
imshow(retina,[]);
title('Imagen original');

subplot(2,3,2);
imshow(retina_suav_3,[]);
title('Imagen c/ruido suavizada 3x3');

subplot(2,3,3);
imshow(retina_suav_6,[]);
title('Imagen c/ruido suavizada 6x6');

subplot(2,3,5);
imshow(retina_suav_9,[]);
title('Imagen c/ruido suavizada 9x9');

subplot(2,3,6);
imshow(retina_suav_12,[]);
title('Imagen c/ruido suavizada 12x12');

retina_syp=imnoise(retina2,'salt & pepper');
retina_suav_3_syp=suavizado(double(retina_syp),3);
retina_poisson=imnoise(retina2,'poisson');
retina_suav_3_poisson=suavizado(double(retina_poisson),3);

figure(3);
subplot(2,3,[1 4]);
imshow(retina2,[]);
title('Imagen original');
subplot(2,3,2);
imshow(retina_syp,[]);
title('Imagen c/ruido sal y pimienta');
subplot(2,3,5);
imshow(retina_suav_3_syp,[]);
title('Imagen suavizada c/ruido sal y pimienta');
subplot(2,3,3);
imshow(retina_poisson,[]);
title('Imagen c/ruido poisson');
subplot(2,3,6);
imshow(retina_suav_3_poisson,[]);
title('Imagen suavizada c/ruido poisson');