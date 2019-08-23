function hittable(Wold, bold, PPT1, testset)
%HITTABLE Calculates the hits and miss ratio based on the trained 
% weight(WlastX), and trained bias(blastX) on a test set(TSET#) 
% Creates a table that displays the hit/miss information
h1Total = 0;
A = {'p1'; 'p2'; 'p3'; 'p4'; 'p5'; 'p6'; 'p7'; 'p8'; 'p9'; 'p10'; 
    'p11'; 'p12'; 'p13'; 'p14'; 'p15';'p16'; 'p17'; 'p18'; 'p19'; 
    'p20'; 'p21'; 'p22'; 'p23'; 'p24'; 'p25'; 'HitRatio'};
B = {'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';
    'M';'M';'M';'M';'M';'M';'M';'M';'M';'M'};

T = table(A,B);
T.Properties.VariableNames = {testset 'Hit_Miss' };

for colin = 1:25
    a = hardlims(Wold * PPT1(:,colin) + bold);

    hit1 = 'M';
    
% This check is for A    
%    if a == 1 && colin <= 5
%        hit1 = 'H';
%        h1Total = h1Total + 1;
%        
%    elseif a == -1 && colin >= 6
%        hit1 = 'H';
%        h1Total = h1Total + 1;
%    end    
% End of check for A  

% This check is for E
    if a == -1 && colin <= 5
        hit1 = 'H';
        h1Total = h1Total + 1;
        
    elseif a == 1 && colin >= 6 && colin <= 10
        hit1 = 'H';
        h1Total = h1Total + 1;
    elseif a == -1 && colin >=11
        hit1 = 'H';
        h1Total = h1Total + 1;
    end
% End of check for E
   
    T{colin, 2} = cellstr(hit1);

end
% End of Loop

H1 = h1Total / 25;
T{26, 2} = num2cell(H1);

TestTableE3 = T;
save (testset, 'TestTableE3');

end

