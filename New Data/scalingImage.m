a=imread('33.jpg');
imshow(a);
a1=imcrop(a);
a2=imresize(a1,[480 640]);
imwrite(a2,'33.png');