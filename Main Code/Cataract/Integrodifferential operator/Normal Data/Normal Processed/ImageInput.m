%function [  ] = ImageInput(  )
close all
clear all

f=imread('17.png');

[ci , cp ,out,I, pimage]=thresh(f,50,100);

out1=out( cp(1)-50: cp(1)+50 , cp(2)-50 : cp(2)+50) ;

out2=drawcircle(out,[cp(1),cp(2)],cp(3)+20,600);



out1=out( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;
out2=pimage( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;



imwrite(out,'17a.png');
imwrite(I,'17b.png');
imwrite(out1,'17c.png');
imwrite(out2,'17d.png');
save 17.mat;
%end

