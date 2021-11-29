fs = 20000;
t = 0:1/fs:1;
% t1 = 1:1/fs:2;
% t2 = 2:1/fs:3;

x1 = chirp(t,3000,1,3000);
x2 = chirp(t,3000,1,1,'logarithmic');
x3 = chirp(t,0,1,6000);
X=x1;
X = cat(2,X,x2);
X = cat(2,X,x3);

figure(1)
spectrogram(X,128,120,128,fs,'yaxis')
