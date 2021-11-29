clear all
close all
clc

[archivo,direccion]=uigetfile({'*.dcm'});
direccion_archivo=strcat(direccion,archivo);

im_dicom=dicomread(direccion_archivo);

figure,

imshow(im_dicom,[])

im_dicom_rescale=rescale(im_dicom);
figure,imshow(im_dicom_rescale)
fft_rescale=fft_imagen(im_dicom_rescale);
figure,imshow(fft_rescale,[]),title('fft rescale');


im_dicom_gauss=imgaussfilt(im_dicom_rescale,2);
figure,imshow(im_dicom_gauss),title('filtro gauss');
fft_gauss=fft_imagen(im_dicom_gauss);
figure,imshow(fft_gauss,[]),title('fft gauss');

im_dicom_filt_max=ordfilt2(im_dicom_rescale,16,ones(4,4));
figure,imshow(im_dicom_filt_max)
fft_max=fft_imagen(im_dicom_filt_max);
figure,imshow(fft_max,[]),title('fft max');


im_dicom_filt_min=ordfilt2(im_dicom_rescale,1,ones(4,4));
figure,imshow(im_dicom_filt_min)
fft_min=fft_imagen(im_dicom_filt_min);
figure,imshow(fft_min,[]),title('fft min');


im_dicom_filt_med=ordfilt2(im_dicom_rescale,13,ones(5,5));
figure,imshow(im_dicom_filt_med),title('filtro med');
fft_med=fft_imagen(im_dicom_filt_med);
figure,imshow(fft_med,[]),title('fft med');

