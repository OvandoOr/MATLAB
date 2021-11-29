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
title('Imagen suavizada c/ruido poisson');0

%%Filtro de media
retina_mf2_syp=medfilt2(retina_syp,[3,3]);
retina_mf2_poisson=medfilt2(retina_poisson,[3,3]);

figure(4)
subplot(2,3,[1 4]);
imshow(retina2,[]);
title('Imagen original');
subplot(2,3,2);
imshow(retina_syp,[]);
title('Imagen c/ruido sal y pimienta');
subplot(2,3,5);
imshow(retina_mf2_syp,[]);
title('Imagen filtro de media c/ruido sal y pimienta');
subplot(2,3,3);
imshow(retina_poisson,[]);
title('Imagen c/ruido poisson');
subplot(2,3,6);
imshow(retina_mf2_poisson,[]);
title('Imagen filtro de media c/ruido poisson');

I=imread('retina.tif');
figure(5)
subplot(2,4,1);
imshow(retina2,[]);
title('Imagen original');

subplot(2,4,2);
borde=edge(retina2);
imshow(borde);
title('Imagen edge');

subplot(2,4,3);
borde1=edge(retina2,'sobel');
imshow(borde1);
title('Imagen sobel');

subplot(2,4,4);
borde2=edge(retina2,'prewitt');
imshow(borde2);
title('Imagen prewitt');

subplot(2,4,5);
borde3=edge(retina2,'roberts');
imshow(borde3);
title('Imagen roberts');

subplot(2,4,6);
borde4=edge(retina2,'log');
imshow(borde4);
title('Imagen log');

subplot(2,4,7);
borde5=edge(retina2,'canny');
imshow(borde5);
title('Imagen canny');

subplot(2,4,8);
borde6=edge(retina2,'zerocross');
imshow(borde6);
title('Imagen zerocross');

[retina_laplace_hp,retina_laplace_realce]=laplace(retina);
figure(6);
subplot(1,3,1)
imshow(retina2,[]);
subplot(1,3,2)
imshow(retina_laplace_hp,[]);
subplot(1,3,3)
imshow(retina_laplace_realce,[]);