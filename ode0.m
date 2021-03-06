function [t,x] = ode0(sys, inter,x0,h )
% ode0 : Euler method implementation of differential equation solver
% INPUT:
%   sys, function which computes dx/dt as a function of x,t. i.e. dx/dt =
%        sys(x,t)
%   inter, time interval to obtain solution
%   x0, initial condition
%   h, discretization time step

t = inter(1):h:inter(end);
x = zeros(numel(t), numel(x0));
x(1,:) = x0';

for index = 2 : numel(t)
    x(index,:) = x(index-1,:) + h*sys(t(index),x(index-1,:)')'; % euler method
end
t = t';
end

