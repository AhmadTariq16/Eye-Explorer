%function [  ] = ImageInput(  )
close all
clear all

f=imread('1.jpg');

[ci , cp ,out,I, pimage]=thresh(f,50,100);

out1=out( cp(1)-50: cp(1)+50 , cp(2)-50 : cp(2)+50) ;

out2=drawcircle(out,[cp(1),cp(2)],cp(3)+20,600);



out1=out( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;
out2=pimage( ci(1)-(cp(3)+30): ci(1)+(cp(3)+30) , ci(2)-(cp(3)+30) : ci(2)+(cp(3)+30)) ;



imwrite(out,'1a.png');
imwrite(I,'1b.png');
imwrite(out1,'1c.png');
imwrite(out2,'1d.png');
save 1.mat;
%end

