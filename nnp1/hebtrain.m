function hebtrain(PPHeb,THeb)
%HEBTRAIN Summary of this function goes here
%   Gets the hebbian weight from the hebbian target(THeb), and the perfect
%   Patterns (PPheb). Returns the hebbian Weight (HebW)
HebW = THeb * (PPHeb');
save HebW HebW
end

