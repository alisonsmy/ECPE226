% Vector with each average symmetry value in the image
function Total_symmetry = GetSymmetry(D)
    [r, c] = size(D); % c is 500, r is 256
    Total_symmetry = zeros(c, 1); % row vector with size of 500
    for j = 1:c % j is 1 to 500
        pixel = D(:, j); % get pixel of example 1
        % UinMatrix = reshape(pixel, [16,16]); %reshape to uint8 matrix
        data = 2*(double(pixel)/255)-1; % convert pixels with range from -1 to 1
        Matrix = reshape(data, [16,16]);
        
        FlipV = fliplr(Matrix); % Flip the images vertically
        VS = Matrix - FlipV;    % original image minus vertically flipped image
        VS = -1.*abs(VS);         % negative of the difference between the original and vertically flipped image
        sumOfVS = sum(VS(:));   % sum of vertically symmetry
        avgVS = sumOfVS/r;      % average v. symmetry = sum/256
        
        FlipH = flipud(Matrix); % Flip the images horizontally
        HS = Matrix - FlipH;    % original image minus horizontally flipped image
        HS = -1.*abs(HS);          % negative of the difference between the original and horizontally flipped image
        sumOfHS = sum(HS(:));   % sum of horizontally symmetry
        avgHS = sumOfHS/r;      % average h. symmetry = sum/256
        
        symmetry = (avgHS+avgVS)/2; % average symmetry = (avg h. symmetry + avg v. symmetry)/2
        Total_symmetry(j, 1) = symmetry; % put average symmetry into symmetry vector
    end
    return
end
