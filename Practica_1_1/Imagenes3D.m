%una imagen 3D son planos repetitivos de diferentes matrices.
close all
clear all
load brain %Cargar variables del archivo en el espacio de trabajo
size(mri)  %devuelve los tamaños de cada dimensión de la matriz Xen un vector dcon ndims(X)elementos

%figure
%para seleccionar diferentes cortes usaremos el comando slice
%phandles=contourslice(mri,[],[],[1,20,40,60,80,100],8);%muestrame todos los renglones, todas las columnas, y en z le digo que

%mri archivo volumetrico.
%Todos los cortes todas las columnas.
%En este caso tenemos 119 cortes segun la variable mri

%figure
%phandles=contourslice(mri,[],[],[1,20,40,60,80,100],15);
%colormap copper , view(3), axis tight %view(3) para verlo en los 3 ejes 

%Ahora lo veremos todo completo
%figure
%phandles=contourslice(mri,[],[],[1:119],2);
%colormap copper , view(3), axis tight


%Para visualizar todas las imagenes de un estudio se puede utilizar la
%funcion montage, a la que debe pasar como parametro una mariz de 4
%dimensiones en la que la tercera dimension sea igual a q, por lo que
%deemos modificar la matriz de la imagen de resonancia magnetica MATLAB
%supone para una matriz N-dimension que las dimensiones mayores que N son
%iguales a la unidad, por lo que solo tenemos que permutar las dimensiones
%3 y 4.

%permutamos el archivo
figure
MR=permute(mri,[1,2,4,3]);
montage(MR),title('Cortes axiales')
%las imagenes tomograficas se almacenan como matrices tridimensionales por
%llo qe visualizar los cortes sagitaleso coronales d esta imagenes en tan
%sencilllo como permutar as dimensiones de la matriz original a la hora de
%visualizar
figure
montage (permute(MR,[2,4,3,1])), title('Cortes sagitales')
%Cortes coronales:tengo que usar una permutacion de mi estudio volumetrico
%y permuto el 4-2 y el 3 y 1 igual, hago una permutacion como la siguiente:
figure
montage (permute(MR,[1,4,3,2])), title('Cortes coronal')

%------------------------------------------------------------------------


