function hittable(W1,W2, b1, b2, TT, TSET, testset)
%HITTABLE Calculates the hits and miss ratio based on the trained 
% weight(W1, W2), and trained bias(b1 and b2) on a test set(TSET#) 

numofmiss = 0;
h1Total = 0;
A = {'p1'; 'p2'; 'p3'; 'p4'; 'p5'; 'p6'; 'p7'; 'p8'; 'p9'; 'p10'; 
    'p11'; 'p12'; 'p13'; 'p14'; 'p15';'p16'; 'p17'; 'p18'; 'p19'; 
    'p20'; 'p21'; 'p22'; 'p23'; 'p24'; 'p25'; 'HitRatio'};
B = {'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';
    'M';'M';'M';'M';'M';'M';'M';'M';'M';'M'};

T = table(A,B);
T.Properties.VariableNames = {testset 'Hit_Miss' };

for colin = 1:25
    
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

    T{colin, 2} = cellstr(hit1);
end
% End of Loop

H1 = h1Total / 25;
T{26, 2} = num2cell(H1);

TestTable403 = T;
save testset403 TestTable403

end

