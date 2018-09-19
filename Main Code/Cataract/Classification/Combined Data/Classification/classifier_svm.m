clc
clear all
close all

load features;
data = featureSet(:,1:end-1);
labels = featureSet(:,end);

dataTrain = data([1:8 18:27] ,:);
labelTrain = labels([1:8 18:27] ,:);
dataTest = data([9:17 28:36] ,:);
labelTest = labels([9:17 28:36] ,:);

struct = svmtrain(dataTrain, labelTrain, 'kernel_function', 'polynomial');
model = svmclassify(struct,dataTest);
length(find(model == labelTest))/18
