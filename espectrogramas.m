fs = 12E3;
t = 0:1/fs:2;
x = chirp(t,20,2,1000,'logarithmic');
figure(1)
spectrogram(x,128,120,128,fs,'yaxis')
title('logarithmic Chirp')
%------------------------------------------------------
fs = 12E3;
t = 0:1/fs:2;
x = chirp(t,20,2,1000);
figure(2)
spectrogram(x,128,120,128,fs,'yaxis')
title('lineal Chirp')
%--------------------------------------------------------
fs = 12E3;
t = 0:1/fs:2;
x = chirp(t,20,2,1000,'quadratic');
figure(3)
spectrogram(x,128,120,128,fs,'yaxis')
title('quadratic Chirp')

%opcinal
% fs = 5000;
% t = 0:1/fs:2;
% x = chirp(t,20,1.5,2500,'quadratic');
% figure(3)
% spectrogram(x,128,120,128,fs,'yaxis')
% title('quadratic Chirp opcional')