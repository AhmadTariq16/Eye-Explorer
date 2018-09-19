clc 
clear all
im=imread('Images\images\Images\Haemoglobin= 9.0\5.jpg');
im=imrotate(im,-90);
im=imcrop(im);
HSI=rgb2hsv(im);
H=HSI(:,:,1);
S=HSI(:,:,2);
I=HSI(:,:,3);

hm=mean(mean(H));
sm=mean(mean(S));
im=mean(mean(I));

