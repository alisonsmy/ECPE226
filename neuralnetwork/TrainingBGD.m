function [w, Ein] = TrainingBGD(x,y,lr,tol)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [n,d] = size(x); 		%get size of input data
    w = rand(d+1,1);        %start with random weight vector
    x = [ones(n,1),x];      %add x(1) to input data, x(1) = 1 always
    s = zeros(n,1);         %initialize signal vector
    theta = zeros(n,1);     %initialize sigmoid function vector
    g = zeros(n,d+1);       %initialize gradient descent vector
    v = ones(d+1,1);
    G = 0;
    Ein = 0;
    while (abs(mean(v)) > tol)
        for i = 1:n
            %FWD Prop
            %Back Prop
            Ein = Ein + (1/(2*n))*((x-y(i))^2);
            s(i) = dot(w,x(i,:)');              %calculate signal
            theta(i) = 1/(1+exp(y(i)*s(i)));    %calculate theta(-s)
            g(i,:) = (-y(i)*x(i,:)'*theta(i))'; %calculate i-th gradient vector
        end
        v = (sum(g)/n)';                %get total gradient vector    
        w = w - lr*v;                   %update weight vector
    end
end

