close all

sig_new=ecg_analog(1:1024)';
%sig_prelim = filtro * sig_new';

x1=DWTA1*sig_new';
figure(1), subplot(2,1,1);plot(x1);

x2=DWTA2*sig_new';
figure(2), subplot(2,1,1);plot(x2);

x3=DWTA3*sig_new';
figure(3), subplot(2,1,1);plot(x3);

x4=DWTA4*sig_new';
figure(4), subplot(2,1,1);plot(x4);

x5=DWTA5*sig_new';
figure(5), subplot(2,1,1);plot(x5);

x6=DWTA6*sig_new';
figure(6), subplot(2,1,1);plot(x6);

y1=x1'*IWTA1;
figure(1), subplot(2,1,2);plot(y1);

y2=x2'*IWTA2;
figure(2),subplot(2,1,2);plot(y2);

y3=x3'*IWTA3;
figure(3),subplot(2,1,2);plot(y3);

y4=x4'*IWTA4;
figure(4),subplot(2,1,2);plot(y4);

y5=x5'*IWTA5;
figure(5),subplot(2,1,2);plot(y5);

y6=x6'*IWTA6;
figure(6),subplot(2,1,2);plot(y6);