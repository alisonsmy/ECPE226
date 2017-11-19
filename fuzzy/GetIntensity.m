% Vector with each average intensity value in the image
function intensity = GetIntensity(D)

[r, ~] = size(D);

% get pixel of example 1
pixel = D; 

% convert pixels with range from -1 to 1
data = 2*(double(pixel)/255)-1; 

% sum of pixels in martix
sumOfM = sum(data); 

% intensity = sum/256
intensity = sumOfM(1)/r;    
end