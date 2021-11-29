close all
clear all

load brain 
size(mri);

%phandles=contourslice(mri,[],[],[1,20,40,60,80,100],8);

%phandles=contourslice(mri,[],[],[1,10,20,30,40,50,60,70,80,90,100],6);

phandles=contourslice(mri,[],[],1:119,2);

colormap copper,view(3),axis tight;
