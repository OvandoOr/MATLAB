load brain  
MR = mri;  
MR(:,1:80,:) = [];  
%MR(:,:,1:80) = []; 
MR(130:end,:,:) = []; 
figure,
Ds = smooth3(MR);  
hcap = patch(isocaps(MR,0),'FaceColor','interp','EdgeColor','none');  
colormap(gray),view([-0.5,1,0.8]);  
hiso=patch(isosurface(Ds,5),'FaceColor',[.80,.80,.80],'EdgeColor','none ','FaceAlpha',0.5);  
lightangle(45,30),isonormals(Ds,hiso),set(hcap,'AmbientStrength',.6), set(hiso,'SpecularColorReflectance',0,'SpecularExponent',50),axis off;