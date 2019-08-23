% mypseudoinv  calculates the Moore-Penrose pseudoinverse of matrix M
% Input M (Perfect Pattern, PPHeb) and T (targets, THeb)
% returns the pseudoinver weight, WW
function mypseudoinv(M, T)
MPLUS = inv(M' * M) * M' ;
WW = T * MPLUS;
save WW WW

end