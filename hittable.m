function hittable(W1,W2, b1, b2, TT, TSET, testset)
%HITTABLE Calculates the hits and miss ratio based on the trained 
% weight(W1, W2), and trained bias(b1 and b2) on a test set(TSET#) 

numofmiss = 0;
h1Total = 0;
A = {'HitRatio'};
B = {'M'};

T = table(A,B);
T.Properties.VariableNames = {testset 'Hit_Miss' };

for colin = 1:447  
    w1a = tansig(W1 * TSET(:,colin) + b1);
    w2a = tansig(W2 * w1a + b2);
    
    w1a = hardlims(w2a);
    % comparisons that checks to see how many times they match TT
    compare = w1a == TT(:,colin);
    % sums up the number of times there was a miss within the comparison
    numofmiss = sum(compare == 0);
    
%   Sets hit1 to H if there were no misses in the previous comparison
    if numofmiss == 0
        h1Total = h1Total + 1;        
    end
% end of if statement

end
% End of Loop

H1 = h1Total / 447;
T{1, 2} = num2cell(H1);

TestTable403 = T
save testset403 TestTable403

end

