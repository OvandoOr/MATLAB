close all
clear all

load brain


MR=permute(mri,[1,2,4,3]); %axiales

MR1=permute(MR,[2,4,3,1]); %coronal

MR2=permute(MR,[1,4,3,2]); %sagital

figure, montage(MR),title ('cortes axiales');

figure, montage(MR1),title ('cortes sagital');

figure, montage(MR2),title ('cortes coronal');