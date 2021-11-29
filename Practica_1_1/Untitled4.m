close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             %Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%menor = 126;        %Valor menor de tumor
%mayor = 128;        %Valor mayor de tumor
menor = 126;        %Valor menor de tumor
mayor = 128;        %Valor mayor de tumor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CT = imread('ej3_liver.bmp');
imtool(CT,[]);
figure
%imtool(CT);
subplot(1,2,1)
imshow(CT,[]),title('Imagen original');


CT = double(CT);
[CT_x,CT_y] = size(CT);
res = zeros(CT_x,CT_y);

for i = 1: CT_x
    for j = 1 : CT_y
        if(CT(i,j) > menor && CT(i,j) <= mayor)
            res(i,j) = 255;
        end
    end
end
 llenado = imfill(res,'holes'); 
 erode = imerode(llenado,strel('ball',4,4));
 dil = imdilate(erode,strel('disk',15));
 
 
 
final = CT + dil;
subplot(1,2,2)
imshow(final,[]),title('Detección de tumor');