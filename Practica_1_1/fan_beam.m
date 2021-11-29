clc
close all
clear all
 
CT = dicomread('TAC'); 
CT = im2double(CT);  
CT = (CT - min(CT(:)))/(max(CT(:))-min(CT(:)));  
subplot(2,4,1)
imshow(CT,[]), title('Imagen CT');  
 
D = 400;
 
dsensor1 = 1; 
F1 = fanbeam(CT,D,'FanSensorSpacing',dsensor1); 
dsensor2 = .5; 
F2 = fanbeam(CT,D,'FanSensorSpacing',dsensor2); 
dsensor3 = .25; 
[F3, sensor_pos3, fan_rot_angles3] = fanbeam(CT,D,'FanSensorSpacing',dsensor3);
 
output_size = max(size(CT));
Ifan1 = ifanbeam(F1,D,'FanSensorSpacing',dsensor1,'OutputSize',output_size); 
subplot(2,4,2)
imshow(Ifan1)
title('Distancia=400 S=1'); 
Ifan2 = ifanbeam(F2,D,'FanSensorSpacing',dsensor2,'OutputSize',output_size); 
subplot(2,4,3)
imshow(Ifan2)
title('Distancia=400 S=.5'); 
Ifan3 = ifanbeam(F3,D,'FanSensorSpacing',dsensor3,'OutputSize',output_size); 
subplot(2,4,4)
imshow(Ifan3)
title('Distancia=400 S=.25');
 
 
subplot(2,4,5)
imagesc(fan_rot_angles3, sensor_pos3, F3); 
colormap(hot); 
colorbar; 
xlabel('Fan Rotation Angle (degrees)'); 
ylabel('Fan Sensor Position (degrees)'); 
 
subplot(2,4,6),imshow(Ifan1-CT,[]),title('Error de reconstrucción de 1 grado')  
subplot(2,4,7),imshow(Ifan2-CT,[]),title('Error de reconstrucción de 0.5 grados') 
subplot(2,4,8),imshow(Ifan3-CT,[]),title('Error de reconstrucción de 0.25 grados')  
