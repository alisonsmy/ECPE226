% Vector with each average intensity value in the image
function Total_intensity = GetIntensity(D)
    [r, c] = size(D); % r is 256, c is 500
    Total_intensity = zeros(c, 1); % row vector with size of 500
    for j = 1:c % j is 1 to 500
        pixel = D(:,j); % get pixel of example 1
        data = 2*(double(pixel)/255)-1; % convert pixels with range from -1 to 1
        sumOfM = sum(data); % sum of pixels in martix
        intensity = sumOfM/r;    % intensity = sum/256
        Total_intensity(j, 1) = intensity; % put intensity into intensity vector
    end
    return
end