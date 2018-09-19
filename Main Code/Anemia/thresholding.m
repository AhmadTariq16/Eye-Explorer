function [bw] = thresholding(image)

level=167;
bw=im2bw(image,level/255);
end



