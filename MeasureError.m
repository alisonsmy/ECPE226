function [ inError, outError ] = MeasureError( training, testing, w)
%MEASUREERROR Summary of this function goes here
%   Detailed explanation goes here
[d, N] = size(training);
[~, M] = size(testing);
errors = 0;

for i = 1:N
    s = dot(w, training(2:d,i));
    errors = errors + (training(1,i) - s)^2;
end
inError = errors / (2*N);

errors = 0;
for i = 1:M
    s = dot(w, testing(2:d,i));
    errors = errors + (testing(1,i) - s)^2;
end
outError = errors / (2*M);

end

