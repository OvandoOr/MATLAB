close all
clear all 
clc

load Matrix_alone_DWTA_rbio68.mat 
load Matrix_complete_DWTA_rbio68.mat 
load matrix_ecg_inv.mat


sig=[P_inv;P_inv];%se�al original representada dos veces, se puede cambiar por cualquier se�al
[x,y]=size(DWTA3);%se obtiene el tama�o de la matriz completa de multiplicacion wavelet(DWTA3), de aqui fue donde se sacaron los 'coeficientes'. Es constante, no modificar
[~,y_alone]=size(Matrix_alone_DWTA_rbio68);%se obtiene el tama�o de la matriz de los coeficientes(Matrix_alone_DWTA_rbio68), estos son los que usaremos para multiplicar nuestra se�al. Es constante, no modificar
[x_sig,y_sig]=size(sig);%obtenemos los tama�os de las se�al de entrada, que puede varias

inc=y/x;%diferencia dependiendo del orden en este caso es una diferencia de 8 ya que es de 3er orden. Es constante, no modificar

for i=1:(floor(x_sig/inc)-y_alone)%este for multiplica la se�al una cantidad i de veces dependiendo del tama�o de la se�al de entrada. Y si los datos no son suficientes para seguir realizando la multiplicacion de matrices alli los deja por lo que les puede cortar un poco la parte final de la se�al(en el caso del audio esta cantidad es casi imperceptible)
    ini=1+(i-1)*inc;%genera los indices que se estaran modificando de la se�al estos dependen del orden y de i
    new_matrix(i)=Matrix_alone_DWTA_rbio68*sig(ini:ini+y_alone-1);%realiza la multiplicacion de matrices, esta multiplicacion de matrices 
    %se genera con los indices especificos y utilizando producto punto (es mas facil de lo que suena). 
    %Les dejo una pagina donde viene una explicacion sencilla de estas multiplicaciones https://www.mathsisfun.com/algebra/matrix-multiplying.html
    %en esta parte aprovechamos que solo una parte de toda la se�al tiene
    %los coeficientes y lo demas son ceros entonces podemos ir
    %multiplicando por pasos la se�al indefinidamente. Tomen en cuenta que
    %esta tarda un poco en iniciar como otro tipo de filtros por lo que al
    %inicio de las se�ales filtradas a veces puede arrojar datos raros.
end

figure,
plot(sig)%plot se�al original

figure,
plot(new_matrix)%plot se�al wavelet noten que el tama�o de la se�al es de 8 veces menos que la se�al original si le agregamos 71 ya que es la cantidad de coeficientes
