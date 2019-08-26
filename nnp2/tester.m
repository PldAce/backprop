function tester(W1, W2, b1,b2, alp, PP, TT)
%TESTER Trains  
%  Trains the Weights (W1, W2) and bias (b1, b2)through backwards propagation
%  while getting points from W1 (3 in total, W1_p1, W1_p2, W1_p3) and 
%  W2(2 in total, W2_p1, W2_p2) to later plot within their own figures.
% 
%
W1old = W1;
W2old = W2;
b1old = b1;
b2old = b2;
threshold  = 0.0001;      % Stopping Criterion to prevent overtraining
maxEP = 800;            % Number of epochs
W1_p1 = [];             % Trained points from the same coordinate from W1
W1_p2 = [];             % Trained points from the same coordinate from W1
W1_p3 = [];             % Trained points from the same coordinate from W1
W2_p1 = [];             % Trained points from the same coordinate from W1
W2_p2 = [];             % Trained points from the same coordinate from W2
ave = [];               % Trained points from the same coordinate from W2
for en = 1:maxEP
       [W1new, W2new, b1new, b2new, ave2] = bptans1e(W1,W2,b1,b2,alp,PP,TT);       

       if ave2 >= threshold
           ave(en) = ave2;
           W1_p1(en) = W1new(3,4);
           W1_p2(en) = W1new(5,10);
           W1_p3(en) = W1new(2,20);
           W2_p1(en) = W2new(1,4);
           W2_p2(en) = W2new(5,3);

           W1 = W1new;   % Transfer weights adjusted w this pattern for next
           W2 = W2new;   % Transfer weights adjusted w this pattern for next
           b1 = b1new;   % Transfer bias adjusted w this pattern for next
           b2 = b2new;   % Transfer bias adjusted w this pattern for next
       
       else           
           break;
       end
       
end
% End of loop    % 
ave_R1 = ave;    %

W1_R1 = W1;   % Transfer weights adjusted w this pattern for next
W2_R1 = W2;   % Transfer weights adjusted w this pattern for next
b1_R1 = b1;   % Transfer bias adjusted w this pattern for next
b2_R1 = b2;   % Transfer bias adjusted w this pattern for next

figure('Name', 'Avg_Err');
plot(ave_R1);

figure('Name', 'W1_point1');
plot(W1_p1);

figure('Name', 'W1_point2');
plot(W1_p2);

figure('Name', 'W1_point3');
plot(W1_p3);

figure('Name', 'W2_point1');
plot(W2_p1);

figure('Name', 'W2_point2');
plot(W2_p2);

figure('Name', 'W1_R1');
chkbrd1(W1_R1);

figure('Name', 'W2_R1');
chkbrd1(W2_R1);

save PRJ2-Round1-1 W1_R1 W2_R1 b1_R1 b2_R1 ave_R1 W1_p1 W1_p2 W1_p3 W2_p1 W2_p2 W1old W2old b1old b2old;

end
% End of function

