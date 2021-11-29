close all
load brain 

MR = mri;

MR(130:end,:,:)=[];

Ds = smooth3(MR);

figure,
hcap = patch(isocaps(MR,0),'Facecolor','interp','EdgeColor','none');

colormap(gray),view([-0.5,1,0.8]);

hiso = patch(isosurface(Ds,5),'Facecolor',[.80,.80,.80],'EdgeColor','none','FaceAlpha',0.5);

lightangle(45,30),isonormals(Ds,hiso),set(hcap,'AmbientStrength',.6),
set(hiso,'SpecularColorReflectance',0,'SpecularExponent',50),axis off;
