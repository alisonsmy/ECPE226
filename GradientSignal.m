function grad = GradientSignal( w, x, y )
%GRADIENTSIGNAL Summary of this function goes here
%   Detailed explanation goes here

s = sign(dot(w, x));
        
% input from logistic function, -Yn*s
ys = -(y*s);

% logistic function, 1/[1+e^(s) where s is -Yn*s
logis = 1/(1+exp(-(ys))); 

%calculate gradient for each element, Yn*Xn*logistic(-Yn*s)
grad = y*x*logis;

end
