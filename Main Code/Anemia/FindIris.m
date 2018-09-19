function [c,r] = FindIris(img,lower_limit,upper_limit,senstivity)

[c,r]=imfindcircles(img,[lower_limit,upper_limit],'ObjectPolarity','dark','Sensitivity',senstivity);
c=cast(c,'int16');
r=cast(r,'int16');

end

