Fs = 1000;
t = linspace(0,5,5e3);
x = cos(2*pi*100*t).*(t<1)+cos(2*pi*50*t).*(3<t)+0.3*randn(size(t));

cwt(x,Fs);

