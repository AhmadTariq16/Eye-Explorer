clc 
clear all
close all
load Data1;
%% 
[feature_set,I] = randomize(feature_set);
Labels = Labels(I);

Data1 = feature_set(1:floor(end/2),:);
Data2 = feature_set(floor(end/2)+1:end,:);

L1 = Labels(1:floor(end/2));
L2 = Labels(floor(end/2)+1:end);



        mdl = NaiveBayes.fit(Data1,L1);
 %       mdl = ClassificationKNN.fit(Data1,L1,'NumNeighbors',3);
 %       mdl = ClassificationTree.fit(feature_set(tran,ftr),Labels(tran));

        res = predict(mdl,Data2);

Cnf_matrix = confusionmat(L2,res)
%% 
Acuracy = 100*(Cnf_matrix(1,1)+Cnf_matrix(2,2))/sum(sum(Cnf_matrix))
Sencivity = Cnf_matrix(2,2)/(Cnf_matrix(2,1)+Cnf_matrix(2,2))
Specifity = Cnf_matrix(1,1)/(Cnf_matrix(1,1)+Cnf_matrix(1,2))
