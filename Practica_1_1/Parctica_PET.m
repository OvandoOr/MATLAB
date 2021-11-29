close all
load brain
MR = mri;
MR(130:end,:,:) = [];
Ds = smooth3(MR);
hcap = patch(isocaps(MR,0),'FaceColor','interp','EdgeColor','none');
colormap(gray), view([-0.5,1,0.8]);

%para poner una capa sobre lo que ya borramos para que se pueda ver
hiso= patch(isosurface(Ds,5),'FaceColor',[.80,.80,.80],'EdgeColor','none','FaceAlpha',0.5);

%Focoiluminando,interpolacion sobre Ds con el iso, genero una fuerza en el
%ambiente, reflectancia
lightangle(45,30),isonormals(Ds,hiso), set(hcap,'AmbientStrength',.6),set(hiso,'SpecularColorReflectance',0,'SpecularExponent',50),axis off;