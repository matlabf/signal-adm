function y = sig_demod_adaptivedelta(x, delta, delta_start, delta_change_rate)

% Perform Adpative Delta demodulation
x_old = 0;
delta_factor = 0;
y_old = delta_start;
y = zeros(1, length(x));
for i = 1 : length(x)
    xd = (x(i) >= 0.5);
	y_old = y_old + delta * sign(xd - 0.5) * (delta_change_rate ^ delta_factor);
	delta_factor = delta_factor + sign((xd == x_old) - 0.5);
	y(i) = y_old;
	x_old = xd;
end
end