function [t,x] = sode0(sys, inter, x0, h, covw)
% sode0 : Euler-Maruyama method implementation of differential equation solver
% INPUT:
%   sys, function which computes dx as a function of x,t. i.e. dx =
%        sys(x,t)dt + dw
%   inter, time interval to obtain solution
%   x0, initial condition
%   h, discretization time step

t = inter(1):h:inter(end);
x = zeros(numel(t), numel(x0));
x(1,:) = x0';

stdw = chol(covw + 1e-9*eye(size(covw)));


for index = 2 : numel(t)
    x(index,:) = x(index-1,:) + h*sys(t(index),x(index-1,:)')'; % euler method
    x(index,:) = x(index,:) + ( sqrt(h) * stdw * randn(size(covw,1),1) )';
end
t = t';
end

