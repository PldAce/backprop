% percepts1e trains ONE EPOCH of perceptron, calling percepts1p
%
% Receives all training paterns as columns of matrix PP
% Recieves all target values as columns of matrix TT
%
% Returns resulting weights Wlast & bias blast,
% and number of necessary corrections in the epoch, nenonz
%
% SYNTAX:  [Wlast,blast,nenonz] = percepts1e(Wold,bold,PP, TT);

function [Wlast,blast,nenonz] = percepts1e(Wold,bold,PP, TT);

[rowspp , colspp] = size(PP);
nenonz = 0;

for ncol = 1: colspp
    
    [Wnew,bnew, e] = percepts1p(Wold,bold,PP(:,ncol),TT(:,ncol));
    
    if e ~= 0
        nenonz = nenonz +1;
    end    
    Wold = Wnew;     % Transfer weights adjusted w this pattern for next
    bold = bnew;    % Transfer bias adjusted w this pattern for next
end
Wlast = Wold;
blast = bold;

end
