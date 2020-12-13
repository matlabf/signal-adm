function y = sig_mod_adaptivedelta(x, delta, delta_start, delta_change_rate)

% Perform Adaptive Delta modulation
y_old = 0;
delta_factor = 0;
x_old = delta_start;
y = zeros(1, length(x));
for i = 1 : length(x)
	y(i) = (x(i) > x_old);
	x_old = x_old + delta * sign(y(i) - 0.5) * (delta_change_rate ^ delta_factor);
	delta_factor = delta_factor + sign((y(i) == y_old) - 0.5);
	y_old = y(i);
end
end