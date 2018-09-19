%function [  ] = ImageInput(  )
close all
clear all

f=imread('33.png');

[ci , cp ,out,I, pimage]=thresh(f,50,100);

out1=out( cp(1)-50: cp(1)+50 , cp(2)-50 : cp(2)+50) ;

out2=drawcircle(out,[cp(1),cp(2)],cp(3)+20,600);



out1=out( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;
out2=pimage( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;



imwrite(out,'33a.png');
imwrite(I,'33b.png');
imwrite(out1,'33c.png');
imwrite(out2,'33d.png');
save 33.mat;
%end

