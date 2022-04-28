function f = example_sys( t, x )

% Simple double-integrator system
f = zeros(2,1);
f(1) = x(2);
f(2) = 0;

end

