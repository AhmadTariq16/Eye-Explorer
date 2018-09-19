function p = im_props1 (I,bg)
    Ig = double(rgb2gray(I))/255;
    ihsv = rgb2hsv(I);
    bg1 = bitxor(bwmorph(bg,'thicken',10),bg);
    [~, ~, v1] =find(bg1.*Ig);
    [~, ~, v] = find(bg.*Ig);
    [~, ~, h] = find(bg.*ihsv(:,:,1));
    [~, ~ ,s] = find(bg.*ihsv(:,:,2));

    p.meanv = mean(v);
    p.stdv = std(v);
    p.gradv = mean(v1) - p.meanv;
    
    p.meanh = median(h);
    p.stdh = std(h);
    
    p.means = mean(s);
    p.stds = std(s);
end