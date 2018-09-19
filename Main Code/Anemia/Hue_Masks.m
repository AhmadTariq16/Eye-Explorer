function [img_h,img_S,img_I] = Hue_Masks(image)
img=rgb2hsv(image);
img_h=img(:,:,1);
img_S=img(:,:,2);
img_I=img(:,:,3);
end