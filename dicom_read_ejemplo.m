clear all
close all
clc

[archivo,direccion]=uigetfile({'*.dcm'});
direccion_archivo=strcat(direccion,archivo);

im_dicom=dicomread(direccion_archivo);

figure,

imshow(im_dicom,[])

im_dicom1 = rescale(im_dicom);

figure,

imshow(im_dicom1)

imagen_ruido = imnoise(im_dicom1,'speckle',.03);

figure,
imshow(imagen_ruido,[])

guardar_archivo=strcat(direccion,'ruido');
guardar_archivo=strcat(guardar_archivo,archivo);
dicomwrite(imagen_ruido,guardar_archivo)

