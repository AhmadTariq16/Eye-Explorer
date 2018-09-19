clc
clear all
close all

%load feature_set_npdr.mat
%load feature_set_dark_bright_v2.mat
load('labels');
load ('features');
for i = 1:max(labels)
    a(i) = length(find(labels == i));
end
%group = [repmat('Dark  ',344,1); repmat('Bright',569,1)];
group = [repmat('MA ',a(1),1); repmat('H  ',a(2),1);repmat('HE ',a(3),1); repmat('CWS',a(4),1)];
%group = [repmat('MA ',a(1),1); repmat('H  ',a(2),1)];
%group = [repmat('HE ',a(3),1); repmat('CWS',a(4),1)];
 for i = 2:size(feature,2)-1
     for j = 3:size(feature,2)-1
%         if(j > i)
%         gscatter(feature_set(:,i),feature_set(:,j),group,'rg','+x');
figure
         gscatter(feature(:,i),feature(:,j),group,'rgbk','+xo*');
%         %gscatter(feature_set([1:a(1)+a(2)],i),feature_set([1:a(1)+a(2)],j),group,'rk','o*');
% %        gscatter(feature_set([1:a(3)+a(4)],i),feature_set([1:a(3)+a(4)],j),group,'rk','o*');
%         xlabel(feature_des{i})
%         ylabel(feature_des{j})
%         saveas(gcf,['Graphs_2D_png_bright\' feature_des{i} ' Vs ' feature_des{j} '.png']);
%         saveas(gcf,['Graphs_2D_fig_bright\' feature_des{i} ' Vs ' feature_des{j} '.fig']);
%         end
%     end
% end

%  gplotmatrix(feature(1+a(1)+a(2):end,[i j]),feature(1+a(1)+a(2):end,[j+1 j+2]),group);
%           saveas(gcf,['Graphs_2D_png_exudates\' feature_des{i} ' and ' feature_des{j} '.png']);
%         saveas(gcf,['Graphs_2D_fig_exudates\' feature_des{i} ' and ' feature_des{j} '.fig']);
     end
 end