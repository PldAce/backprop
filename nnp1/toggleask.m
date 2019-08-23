function toggleask(PPT)
%TOGGLEASK Asks user what coordinates to toggle
% PPT is the original Test Pattern, and saves the toggled test pattern as
% PPT1 for the first one, PPT2 for the second, and PPT3 for the third.
% the names for the test patterns are going to be edited manually.
TSET1  = PPT;
for i = 1:25
    if i ~= 1 && i ~= 6 && i ~= 11 && i ~= 16 && i ~= 21
        i
        prompt1 = 'X:';
        x = input(prompt1);
        
        prompt2 = 'Y:';
        y = input(prompt2);
        
        TSET1(:,i) = togglp1(TSET1(:,i),x,y);
        save('TSET1_E', 'TSET1');
    
    end
    % End of IF statement, doesn't active for p1, p5, p11, p16, p21
end
% End of Loop
end
% End of Function

