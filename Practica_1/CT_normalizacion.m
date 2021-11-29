close all

CT=dicomread('TAC');

CT=im2double(CT);

CT=(CT-min(CT(:)))/(max(CT(:))-min(CT(:)));

imshow(CT,[]), title('imagen CT');

theta1= 0:10:170;
[R1,xp]=radon(CT,theta1);

theta2= 0:5:175;
[R2,xp]=radon(CT,theta2);

theta3= 0:2:178;
[R3,xp]=radon(CT,theta3);

num_angles_R1= size(R1,2), num_angles_R2 = size(R2,2),num_angles_R3= size(R3,2)

N_R1= size(R1,1), N_R2 = size(R2,1), N_R3 = size(R3,1)

figure, imagesc(theta3,xp,R3), colormap(hot),colorbar,xlabel('Parallel Rotation Anlge - \theta (degrees)'),ylabel('Parallel sensor Position - x\prime (pixels)')

output_size=max(size(CT));
dthetal = theta1(2) - theta1(1)
dtheta2 = theta2(2) - theta2(1)
dtheta3 = theta3(2) - theta3(1)

I1=iradon(R1,dthetal,output_size);
I2=iradon(R2,dtheta2,output_size);
I3=iradon(R3,dtheta3,output_size);

IR=I1;

figure, subplot(1,2,1), subimage(IR),  subplot(1,2,2), imshow(IR-CT,[]), title ('Error de reconstrucción')


