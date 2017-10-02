function m = CleanData(data, character)
%CLEANDATA Summary of this function goes here
%   Detailed explanation goes here

[~, N] = size(data);
m = zeros(4, N);
for n = 1:N
    symmetry = GetSymmetry(data(:,n));
    intensity = GetIntensity(data(:,n));
    m(:,n) = [character, 1, symmetry, intensity];
end

end

