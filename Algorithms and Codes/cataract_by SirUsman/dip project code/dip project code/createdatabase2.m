clc
clear all
close all
pth = 'data1\';
dd = dir ([pth '*.jpg']);

%% Feature Extraction... 
for i = 1:length(dd)
    impath = [pth dd(i).name];
    Ig = padarray(imread(impath),[21 21]);
    close all;
    imshow(Ig);
    [x  y] = getpts;
    for ii = 1:3;
    Ib(:,:,ii) = imcrop(Ig(:,:,ii),[x(1)-40 y(1)-40 80  80 ]).*uint8(fspecial('disk',40)>0);
    end
    Ig = Ib;
    bg = fspecial('disk',40)>0;
    figure, imshow(Ig)
    I = medfilt2(rgb2gray(Ig),[3 3]).*uint8(bg);
    GLCM = graycomatrix(I,'Offset',[2 0;0 2;2 2]);,
    states(i) = graycoprops(GLCM);
      p(i) = im_props1 (Ig,bg);
end
%% GLCM Based Features Calculation..
for i = 1:size(states,2)
    Contrast(i,1) = mean(states(i).Contrast); 
    Correlation(i,1) = mean(states(i).Correlation);
    Energy(i,1) = mean(states(i).Energy);
    Homogeneity(i,1) = mean(states(i).Homogeneity);
end
%% Labeling Classes
%     Labels ,cataract=1 noncataract=2     
    feature_set = [Contrast Correlation  Energy Homogeneity [p.meanv]' [p.stdv]' [p.meanh]' [p.stdh]' [p.means]' [p.stds]'];
    feature_des = {'Contrast' 'Correlation'  'Energy' 'Homogeneity' 'Gradiant' 'MeanIntensity' 'StdvIntensity' 'MeanHue' 'StdHue' 'meanSaturation' 'StdSaturation'};
    save Data1 feature_set feature_des Labels;