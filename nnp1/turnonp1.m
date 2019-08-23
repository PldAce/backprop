% turnonp1 -- turns ON  a pixel in a 4-row x 5 column grid
% WHICH HAS ALREADY BEEN CONVERTED TO A COLUMN VECTOR colin
% BY COLUMN-SCANNING, LEFT-to-RIGHT, TOP-to-BOTTOM
% ASSUMES the original pixels are coded BIPOLAR -1 , +1
%
% Receives the "x" and "y" "coordinates of the pixel to turn ON
%
% SYNTAX: colout = turnonp1(colin,x,y);
%
function colout = turnonp1(colin,x,y);

indx = ( (x -1) * 4 ) + y;
colout = colin;

colout(indx , 1) = 1;

end
