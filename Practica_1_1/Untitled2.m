close all  
clear all  
load brain  

partes=1:20:100;
phandles=contourslice(mri,partes,[],[],8);
colormap hsv, view(3),axis tight