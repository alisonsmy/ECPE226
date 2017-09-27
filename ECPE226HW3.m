% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression


File = load('usps_modified.mat');
raw_data = File.data;
[img, example, digit] = size(raw_data);
lr = 0.1; % learning rates of 0.1, 1, 10, 50.

% Logistic Regression with Batch Gradient Descent

while % ~(stopping criteria)
   for i = 1:N
      s = sign(dot(w,x(i,:))); % s = sign(wTx)
      ys = -(y(i)*s); % input from logistic function
      g = 1/(1+exp(-ys)); % logistic function
      grad(i,:) = g; %calculate gradient for each element
   end
   v = -(sum(grad)/N)'; %calculate average direction vector
   w = w + (lr)*v; %update weight vector
   %update stopping criteria
end



% Logistic Regression with Stochastic Gradient Descent (single data point)