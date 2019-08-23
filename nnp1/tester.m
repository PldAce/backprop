function tester(W,B, PP, TT)
%TESTER Trains the weight (W) and bias (B) based on a patern (PP) 
% and targets (TT). Then saves the trained weight as "Wlast", 
% and trained bias as "blast"
%   Detailed explanation goes here

maxEP = 20;           % Number of epochs
cn = zeros(1,maxEP);    % Empty array that holds number of errors per Epoch

for en = 1:maxEP
       [Wlast,blast,nenonz] = percepts1e(W,B,PP, TT);
       cn(en) = nenonz; % Sets # of errors to cn at the indx en (The Epoch)
       
       W = Wlast;   % Transfer weights adjusted w this pattern for next
       B = blast;   % Transfer bias adjusted w this pattern for next
end
% End of loop
save('Weight_Bias_Trained_E','Wlast', 'blast');
cn
end
% End of function

