function [imagen_hp,imagen_realce]=laplace(imagen)
    masc_laplace=[0 -1 0; -1 4 -1;0 -1 0];
    imagen_double=double(imagen);
    
    imagen_hp=conv2(imagen_double, masc_laplace);
    imagen_realce= imagen_double+imagen_hp(2:size(imagen_hp,1)-1,2:size(imagen_hp,2)-1);
end