CT = dicomread('TAC'); 
figure
imshow(CT,[]),title('CT original');  
% Segmentación por umbral
 ct = CT > 155;
 CT = im2double(CT);  
 CT = (CT - min(CT(:)))/(max(CT(:))-min(CT(:)));  
 bones =  ct ==1;
 pause
 figure
 imshow(bones,[]), title('Máscara de los huesos'); 
 % Operaciones morfológicas 
 bones = imdilate(bones, strel('disk',3));  
 bones = imfill(bones,'holes');  
 bones = imerode(bones,strel('disk',3));  
% Etiquetado de regiones
 [x y]=bwlabel(bones);  
% Delineación de contornos
 contorno = bwperim(x==1);  
% Construcción de imagen resultado
 r = CT;  
 g = CT;  
 b = CT;  
 r(contorno)=1;  
 g(contorno)=0;  
 b(contorno)=0;  
 rgb(:,:,1)=r;  
 rgb(:,:,2)=g;  
 rgb(:,:,3)=b;
 
 pause
figure
subplot(2,2,1)
imshow(CT)
subplot(2,2,2)
imshow(r)
subplot(2,2,3)
imshow(g)
subplot(2,2,4)
imshow(b)