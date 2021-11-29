clear all
close all
clc

[archivo,direccion]=uigetfile({'*.jpeg';'*.png'});
direccion_archivo=strcat(direccion,archivo);
imagen_original=imread(direccion_archivo);
figure,imshow(imagen_original)

imagen_media(:,:,1)=medfilt2(imagen_original(:,:,1),[2 2]);
imagen_media(:,:,2)=medfilt2(imagen_original(:,:,2),[2 2]);
imagen_media(:,:,3)=medfilt2(imagen_original(:,:,3),[2 2]);

figure,imshow(imagen_media)

imagen_hsv=rgb2hsv(imagen_media);
figure,imshow(imagen_media(:,:,1))
figure,imshow(imagen_media(:,:,2))
figure,imshow(imagen_media(:,:,3))
figure,imshow(imagen_hsv)
im_azul=imagen_media(:,:,3);
hue=imagen_hsv(:,:,1);
saturacion=imagen_hsv(:,:,2);
imagen_bin=(hue >= .41)&(hue <= .58)&(saturacion > .5);%&(im_azul>.40*255);
%imagen_bin=imfill(imagen_bin,'holes');

figure,
imshow(imagen_bin)

[imagen_etiquetada,cantidad_circulos]=bwlabel(imagen_bin);

mediciones=regionprops(imagen_etiquetada);
centro=cat(1,mediciones.Centroid);
areas=cat(1,mediciones.Area);

dato_max=max(areas)

datos_orden_max=sort(areas);
[indice_max,y]=size(datos_orden_max)
indice_circulo_segundo_menor=indice_max-1;

indice=1;
while(datos_orden_max(indice_circulo_segundo_menor)~=areas(indice))
    indice=indice+1;
end

indice_circulo_primero_menor=indice_max;

indice1=1;
while(datos_orden_max(indice_circulo_primero_menor)~=areas(indice1))
    indice1=indice1+1;
end

imagen_filtrada=imagen_media;
imagen_filtrada(repmat(~imagen_bin,[1 1 3])) = 0;

figure,
imshow(imagen_filtrada);
hold on
plot(centro(:,1),centro(:,2),'+')
hold on
plot(centro(indice,1),centro(indice,2),'*')
hold on
plot(centro(indice1,1),centro(indice1,2),'*')

imagen_marcada= getframe;

direccion_archivo_guardar=strcat(direccion,'filtrado',archivo)
imwrite(imagen_marcada.cdata,direccion_archivo_guardar)