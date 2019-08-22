function nguyen()
%NGUYEN Summary of this function goes here
%  Sets the weights according to the Nguyen-Widrow Initialization

inputU = 2;
n = 1/inputU;
a = .5;
b = -.5;
p =  10;
%sets weights and bias to be between -.5 and .5
W1 = a + (b-a).*rand(p,47);
W2 = a + (b-a).*rand(1,p);
b2 = a + (b-a).*rand(1,1);

%calculates beta
beta = 0.7 * p.^n;
a = beta * -1;
b = beta;

b1 = (b-a).*rand(p,1) + a;

for colin = 1:p
    mag = norm(W1(colin,:));
    v = beta * W1(colin,:) / mag;
    W1(colin,:) = v;
end    
%End of Loop


save nguyenresults W1 W2 b1 b2;

end

