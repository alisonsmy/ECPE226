function [ inError, outError ] = MeasureError( training, testing, w)
%MEASUREERROR Summary of this function goes here
%   Detailed explanation goes here
[d, N] = size(training);
[~, M] = size(testing);
errors = zeros(M,1);

for i = 1:N
    s = dot(w, training(2:d,i));
    errors(i) = (training(1,i) - s)^2;
end
inError = mean(errors);

errors = zeros(M,1);
for i = 1:M
    s = dot(w, testing(2:d,i));
    errors(i) = (testing(1,i) - s)^2;
end
outError = mean(errors);

end

