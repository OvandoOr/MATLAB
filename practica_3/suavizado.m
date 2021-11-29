function imagen_suav=suavizado(imagen,dim)
    masc=ones(dim);
    imagen_suav=conv2(imagen,double(masc),'same');
end