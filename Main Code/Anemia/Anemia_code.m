clc  
close all
clear
im=imread('Images\images\Haemoglobin= 8.0\3.jpg');
im=imrotate(im,-90);
im=imcrop(im);
image1=im;
imR=im(:,:,1);
imG=im(:,:,2);
imB=im(:,:,3);
HSI=rgb2hsv(im);
H=HSI(:,:,1);
S=HSI(:,:,2);
I=HSI(:,:,3);
figure;
subplot(2,2,1);
imshow(im),title('Original Image');
subplot(2,2,2);
imshow(imR),title('Red channel');
subplot(2,2,3);
imshow(imG),title('Green channel');
subplot(2,2,4);
imshow(imB),title('Blue channel');

imG=Preprocessing_green(imG);
figure;
imshow(imG),title('Preprocessed');
I= adapthisteq(imG,'clipLimit',0.06,'Distribution','Exponential');
figure;
imshow(I),title('Hist');
[r,c]=size(I);

mask_boundary=zeros(r,c);
mask_boundary(:,1:round(c/8))=1;
mask_boundary(1:round(r/2),:)=1;
mask_boundary(r-40:r,:)=1;
mask_boundary(:,c-60:c)=1;
level=167;
bw=im2bw(I,level/255);
figure;
subplot(2,2,2);
imshow(bw),title('Binary');
fill=bw;
     
[r1,c1]=size(fill);
for i=1:r1
    for j=1:c1
        if(mask_boundary(i,j)==1)
            fill(i,j)=0;
        end
    end
end
    fill=bwareaopen(fill,1500);
    figure;
    imshow(fill),title('before Dilation');
    fill=imdilate(fill,strel('disk',9));
    figure;
    imshow(fill),title('dilated resultant');
     
     
   bw=bwconncomp(fill);
   stats=regionprops(bw,'basic');
   A=[stats.Area];
   [~,biggest]=max(A);
   fill(labelmatrix(bw)~=biggest)=0;
   image=fill;
   subplot(2,2,3);
   imshow(image),title('Largest Area Image');
   st=strel('line',10,45);
   se=translate(st,[-13 0]);
   final=imdilate(image,se);
   subplot(2,2,4);
   imshow(final),title('Dilated Image');
   [x1,y1]=find(final==1);
   figure;
   imshow(final),title('Image');
   %%erode_st=strel('disk',15);
    %%fill=imerode(fill,erode_st);
   s = regionprops(final, 'centroid');
   centroids = round(cat(1, s.Centroid));
   figure;
   imshow(final),title('Eroded final');
   [r,c]=size(final);

    for i=1:r
        for j=1:c
            if(final(i,j)==1)
                im(i,j,1)=40;

            end
        end
    end
figure;
imshow(im),title('Original image with conjuctiva');

[r1,c1]=size(final);
image=ones(size(final));

mask=zeros(r1,c1);
mask(:,1:(centroids(2)-30))=1;
mask(:,centroids(2)+30:c)=1;
mask(1:centroids(1)-105,:)=1;
mask((centroids(1)+20):r,:)=1;
figure;
imshow(mask),title('Masked');
mask=logical(mask);
%   s1= regionprops(mask, 'All');

for i=1:r
    for j=1:c
        if(mask(i,j)==0)
            image1(i,j,1)=40;
            
        end
    end
end
figure;
imshow(image1),title('Image taken');
%Hf=mean(H(mask));
% Sf=mean(S(s1.PixelIdxList));
% If=mean(I(s1.PixelIdxList));
% feat=[Hf Sf If];
