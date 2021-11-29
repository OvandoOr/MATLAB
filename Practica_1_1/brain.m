clear all
load 'brainproc.mat'
scrsz = get(0,'ScreenSize');
figure('OuterPosition',[1 1 scrsz(3) scrsz(4)], ...
       'Color',[0 0 0],...
       'Menubar','none',...
       'Resize','off',...
       'Name','Fusi�n MRI-PET',...
       'NumberTitle','off');
cameratoolbar('SetMode','orbit')
patch(fv, 'FaceColor','interp','EdgeColor','none'); axis off;
clear all

