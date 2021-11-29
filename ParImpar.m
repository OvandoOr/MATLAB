close all; clc; clear;
syms t;

x = (t+2)*(heaviside(t+2)-heaviside(t+1)) - t*(heaviside(t+1)-heaviside(t)) +...
t*(heaviside(t)-heaviside(t-1)) + heaviside(t-1); %heaviside funcion escalon. x menor a cero =0, en el origen 0.5, mayor al origen 1.
xPAR = (x + subs(x,t,-t))/2; %de la funcion x, sustituimos la variable t por -t, y la sumamos a x (señal original) / 2.
xIMPAR = (x - subs(x,t,-t))/2;

figure(1);
ezplot(x,[-4,4]);
Linea = findobj('type', 'line');
set(Linea, 'linewidth',3);
title('Señal original x(t)');
axis equal
grid
%pause

figure(2);
ezplot(xPAR,[-4,4]);
Linea = findobj('type','line');
set(Linea, 'linewidth', 3);
title('PARTE PAR');
axis equal
grid
%pause

figure(3);
ezplot(xIMPAR,[-4,4]);
Linea = findobj('type', 'line');
set(Linea, 'linewidth', 3);
title('PARTE IMPAR');
axis equal
grid
