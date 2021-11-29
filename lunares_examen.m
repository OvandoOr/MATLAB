clear all
close all
clc

[archivo,direccion]=uigetfile({'*.jpeg';'*.png'});
direccion_archivo=strcat(direccion,archivo);
imagen_original=imread(direccion_archivo);
figure,imshow(imagen_original)
[im_x,im_y,~]=size(imagen_original);
pixeles_im=im_x*im_y;
porcentaje_min=.05;
pixeles_min=pixeles_im*porcentaje_min/100;

imagen_media(:,:,1)=medfilt2(imagen_original(:,:,1),[6 6]);
imagen_media(:,:,2)=medfilt2(imagen_original(:,:,2),[6 6]);
imagen_media(:,:,3)=medfilt2(imagen_original(:,:,3),[6 6]);

figure,imshow(imagen_media)
figure,imshow(imagen_media(:,:,1))
figure,imshow(imagen_media(:,:,2))
figure,imshow(imagen_media(:,:,3))

im_rojo=imagen_media(:,:,1);
im_verde=imagen_media(:,:,2);
im_azul=imagen_media(:,:,3);
imagen_hsv=rgb2hsv(imagen_media);
hue=imagen_hsv(:,:,1);
saturacion=imagen_hsv(:,:,2);
value=imagen_hsv(:,:,3);
figure,imshow(imagen_hsv)

imagen_bin=(value<.7)&(im_rojo>.35*255)&(im_verde < .43*255)&(im_azul < .41*255);
imagen_bin=imfill(imagen_bin,'holes');

figure,
imshow(imagen_bin)

[imagen_etiquetada,cantidad_circulos]=bwlabel(imagen_bin);

mediciones=regionprops(imagen_etiquetada);

centro=cat(1,mediciones.Centroid);
areas=cat(1,mediciones.Area);

[muestras,~]=size(areas);

indice_a=1;
for i=1:muestras

    if(areas(i)>pixeles_min)
        areas_finales(indice_a)=areas(i);
        centros_final(indice_a,:)=centro(i,:);
        indice_a=indice_a+1;
    end

end
dato_max=max(areas)

datos_orden_max=sort(areas);
[indice_max,y]=size(datos_orden_max)
indice_circulo_segundo_menor=indice_max-1;

% indice=1;
% while(datos_orden_max(indice_circulo_segundo_menor)~=areas(indice))
%     indice=indice+1;
% end

% indice_circulo_primero_menor=indice_max;
% 
% indice1=1;
% while(datos_orden_max(indice_circulo_primero_menor)~=areas(indice1))
%     indice1=indice1+1;
% end

imagen_filtrada=imagen_media;
imagen_filtrada(repmat(~imagen_bin,[1 1 3])) = 0;

figure,
imshow(imagen_filtrada);
hold on
plot(centros_final(:,1),centros_final(:,2),'+')
% hold on
% plot(centro(indice,1),centro(indice,2),'*')
% hold on
% plot(centro(indice1,1),centro(indice1,2),'*')

coordenadas =mediciones(2).BoundingBox;
rectangle('Position',[coordenadas(1) coordenadas(2) coordenadas(3) coordenadas(4)],'EdgeColor','green');

lunar_recorte = imcrop(imagen_filtrada,[coordenadas(1) coordenadas(2) coordenadas(3) coordenadas(4)]);
figure,
imshow(lunar_recorte);
imagen_marcada= getframe;


lunar_recorte_espejo = flip(lunar_recorte ,2);
figure,
imshow(lunar_recorte_espejo);
diferencia_asimetria = imfuse(lunar_recorte,lunar_recorte_espejo,'diff')
figure,
imshow(diferencia_asimetria);

nivel_simetria=graythresh(diferencia_asimetria)*.9;

BW_sime=imbinarize(diferencia_asimetria,nivel_simetria);
figure,
imshow(BW_sime);

conteo_sime = sum(BW_sime(BW_sime==1))

porcentaje=conteo_sime/mediciones(2).Area*100;

direccion_archivo_guardar=strcat(direccion,'filtrado',archivo)
imwrite(imagen_marcada.cdata,direccion_archivo_guardar)