cd('C:\Users\MarthaAlicia\Desktop\MATLAB\Practica_1');
load ('TAC1');
TAC1 = TAC1(:,:,1);
%figure,
subplot(1,3,1);
imshow(TAC1,[])

load ('TAC2');

TAC2 = TAC2(:,:,1);
%figure,
subplot(1,3,2);
imshow(TAC2,[])

size(TAC1)

size(TAC2)

DTAC1y2=TAC1-TAC2;
%figure,
subplot(1,3,3);
imshow(DTAC1y2,[])