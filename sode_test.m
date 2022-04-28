
x0 = [1;1];

B = [0;1];
covw = 0.1*B*(B');
h = 1e-5;

[t,x] = sode0(@example_sys, [0,10], x0, h, covw);

plot(t,x)