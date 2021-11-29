clear all
close all 
clc
CT = dicomread('TAC'); 
metadata = dicominfo('TAC');

figure
imshow(CT,[]),title('CT original');  
% Segmentaci�n por umbral
 ct = CT > 155;
 CT = im2double(CT);  
 CT = (CT - min(CT(:)))/(max(CT(:))-min(CT(:)));  
 bones =  ct ==1;
 
figure
imshow(bones,[]), title('M�scara de los huesos'); 
 
%dicomwrite(bones, 'ct_file.dcm', metadata);%con datos adicionales del dicom
dicomwrite(bones, 'ct_file.dcm');%sin datos adicionales del dicom

pause

clear all
close all 
clc
CT = dicomread('ct_file.dcm'); 

figure
imshow(CT,[]),title('CT nuevo');  
