f=imread('17.png');
f1=imcrop(f);
f2=imresize(f1,[480 640]);
figure;imshow(f2);
imwrite(f2,'17e.png');