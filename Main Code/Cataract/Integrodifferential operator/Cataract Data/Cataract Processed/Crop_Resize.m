f=imread('41.jpg');
f1=imcrop(f);
f2=imresize(f1,[480 640]);
figure;imshow(f2);
imwrite(f2,'41e.png');