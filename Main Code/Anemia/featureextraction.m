im=imread('2.jpg');
im=imcrop(im);
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
R=double(R);
G=double(G);
B=double(B);
Rm=mean(mean(R));
Gm=mean(mean(G));
Bm=mean(mean(B));

StdR=std(std(R));
StdG=std(std(G));
StdB=std(std(B));

HSI=rgb2hsv(im);
H=HSI(:,:,1);
S=HSI(:,:,2);
I=HSI(:,:,3);

hm=mean(mean(H));
sm=mean(mean(S));
Im=mean(mean(I));
Stdh=std(std(H));
StdS=std(std(S));
StdI=std(std(I));
feature(30,:)=[Rm Gm Bm StdR StdG StdB hm sm Im Stdh StdS StdI];

