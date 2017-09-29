function m = CleanData(data, character)
%CLEANDATA Summary of this function goes here
%   Detailed explanation goes here

[~, N] = size(data);
m = zeros(3, N);
for n = 1:N
    colors = data(:,n);
    normColor = @(color)((double(color) / 256.0) * 2.0) - 1.0;
    b = normColor(colors);
    img = reshape(b,[16,16]);
    symmetry = norm((img - img')/2) / norm((img + img')/2);
    intensity = sum(b) / 65536;
    m(:,n) = [character symmetry intensity];
end

end

