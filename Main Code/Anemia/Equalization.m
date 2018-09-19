function [ backed ] = Equalization( image )
backed= adapthisteq(image,'clipLimit',0.09,'Distribution','Rayleigh');


end

