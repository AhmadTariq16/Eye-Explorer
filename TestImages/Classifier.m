clc
clear all
close all
load pictures1.mat;
% fls = dir('*.png');
featureSet = [];
label1=zeros(1,17);
label2=ones(1,19);
label=[label1 label2];
labelt=transpose(label);
for i = 1: 36
    I = imread([num2str(i) '.png']);
 %   I = rgb2gray(I);
GLCM2 = graycomatrix(I);
stats = graycoprops(GLCM2,{'Contrast','Homogeneity', 'Correlation', 'Energy'});
entropimage = mean2(entropyfilt(I));
[mag phase] = imgradient(I);
gradientimage = std2(mag);
featureSet = [featureSet;stats.Contrast stats.Homogeneity stats.Correlation stats.Energy entropimage gradientimage labelt(i,1)];
end
