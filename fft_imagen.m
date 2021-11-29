function fft_im= fft_imagen(im)
    
im_dicom_fft=fft2(im);
im_dicom_fft= fftshift(im_dicom_fft);

fft_abs=abs(im_dicom_fft);
fft_im=log(fft_abs+1);

%imshow(fft_im,[]);

end

