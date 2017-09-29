% Vector with each average intensity value in the image
function intensity = GetIntensity(D)
%      [r] = size(D); % r is 256, c is 500
r = 256;
%     Total_intensity = zeros(c, 1); % row vector with size of 500
%     for j = 1:c % j is 1 to 500
pixel = D; % get pixel of example 1
data = 2*(double(pixel)/255)-1; % convert pixels with range from -1 to 1
sumOfM = sum(data); % sum of pixels in martix
intensity = sumOfM(1)/r;    % intensity = sum/256
%         Total_intensity(j, 1) = intensity; % put intensity into intensity vector
%     end
    return
end