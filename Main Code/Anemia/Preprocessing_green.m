function [img] = Preprocessing_green(image)

%Med_filter=medfilt2(Image_adjust,[3 3]);
avg_mask=fspecial('average',5);
img=imfilter(image,avg_mask);
img=imadjust(img,stretchlim(img));
% Guass_mask=fspecial('gaussian',[10,10]);
% img=imfilter(Med_filter,Guass_mask);
end