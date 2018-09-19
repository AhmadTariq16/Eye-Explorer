function [ images] =Open_closing( image )
SE=strel('line',10,45);
images=imopen(image,SE);

end

