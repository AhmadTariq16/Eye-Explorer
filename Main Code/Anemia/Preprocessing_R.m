function[img_r]=Preprocessing_R(R)

Guass_mask=fspecial('gaussian',[5,5]);
img_r=imfilter(R,Guass_mask);

avg_mask=fspecial('average',[5,5]);
img_r=imfilter(img_r,avg_mask);
end