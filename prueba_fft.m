clear all
clc

[archivo,direccion]=uigetfile({'*.dcm'});
direccion_archivo=strcat(direccion,archivo);

im_dicom=dicomread(direccion_archivo);
figure,
imshow(im_dicom,[]),title('Imagen original')

ejemplo_imagen_fft=fft_imagen(im_dicom);
figure,imshow(ejemplo_imagen_fft,[]);
