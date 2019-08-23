function hebtest(W,PPT1, THeb)
%HEBTEST Summary of this function goes here
%   Creates a table that displays the hamming distance, hit miss rate,
%   
A = {'p1'; 'p2'; 'p3'; 'p4'; 'p5'; 'p6'; 'p7'; 'p8'; 'p9'; 'p10'; 
    'p11'; 'p12'; 'p13'; 'p14'; 'p15';'p16'; 'p17'; 'p18'; 'p19'; 
    'p20'; 'p21'; 'p22'; 'p23'; 'p24'; 'p25'; 'Hit_Ratio'};
B = zeros(26,3);
C = zeros(26,1); 
D = {'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';
    'M';'M';'M';'M';'M';'M';'M';'M';'M';'M';'-'};

i = 1;
hittotal = 0;
for colin = 1:25    
    a = hardlims(W * PPT1(:,colin)); 
    B(colin,:) = a';
    
    % calculates hamming distance
    compare = a == THeb(:,i);
    hamming = sum(compare ==0);
    C(colin, :) = hamming;
    
    % sets hit/miss on the table
    if hamming == 0
        D(colin) = cellstr('H');
        hittotal = hittotal + 1;
    end
    
    if colin == 5 || colin == 10 || colin == 15 || colin == 20
        i = i + 1;
    end       

end
hitratio = hittotal / 25;
D(26) = num2cell(hitratio);
T = table(A,B,C,D);
set = {'TestSet1' 'Targets' 'Hamming_Distance' 'Hit_Miss'};
T.Properties.VariableNames = set;
T

HebTable3 = T;
save ('HebTable3', 'HebTable3');

end

