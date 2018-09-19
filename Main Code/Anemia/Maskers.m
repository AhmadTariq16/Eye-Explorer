clc 
close all
clear all
im=imread('image8.jpg');
im=imcrop(im);
imR=im(:,:,1);
imG=im(:,:,2);
imB=im(:,:,3);
figure;
subplot(2,2,1);
imshow(im),title('Original Image');
subplot(2,2,2);
imshow(imR),title('Red channel');

subplot(2,2,3);
imshow(imG),title('Green channel');
subplot(2,2,4);

imshow(imB),title('Blue channel');

img_G=Preprocessing_green(imG);
img_B=Preprocessing_R(imB);
img_R=Preprocessing_R(imR);

img_B=Open_closing(img_B);
%%img_G=Open_closing(img_G);
img_R=Open_closing(img_R);

Equalized_Blue=Equalization(img_B);
Equalized_Green=Equalization(img_G);
Equalized_Red=Equalization(img_R);
figure;
imshow(Equalized_Blue),title('blue');
figure;
imshow(Equalized_Green),title('Green');
improfile
figure;
imshow(Equalized_Red),title('Red');





thresh_g=thresholding(Equalized_Blue);
thresh_blue=thresholding(Equalized_Green);
thresh_Red=thresholding(Equalized_Red);
figure;
subplot(2,2,1);
imshow(thresh_g);
subplot(2,2,2);
 imshow(thresh_blue);
 subplot(2,2,3);
 imshow(thresh_Red);
 se= strel('line',10,120);
  se=translate(se,[-12 0]);
bw=imerode(thresh_Red,se);
%bw=Open_closing(thresh_Red);
figure;
 imshow(bw);
 [r,c]=size(bw);
 mask_boundary=zeros(r,c);
 mask_boundary(:,1:80)=1;
 mask_boundary(1:r/2,:)=1;
 mask_boundary(r-80:r,:)=1;
 mask_boundary(:,c-80:c)=1;
 figure;
 imshow(mask_boundary);
 [r1,c1]=size(mask_boundary);
 for i=1:r1
     for j=1:c1
         if(mask_boundary(i,j)==1)
                bw(i,j)=0;
         end
     end
 end
  se1= strel('line',10,120);
  se1=translate(se1,[-12 0]);
bw=imerode(bw,se1);
 figure;
 imshow(bw);
 