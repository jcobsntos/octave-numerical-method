clc; clear; close all;

% Define the function
f = @(x) x.^3-3*x-5;

% Define the search interval
xl = 2;
xu = 3;

% Set the desired relative error and maximum number of iterations
es = 0.0001;
maxiter = 50;

% Initialize variables
iter = 0;
xm = xl;
ea = 100;

% Loop until the desired relative error or maximum number of iterations is reached
while ea > es && iter < maxiter
    % Store the previous estimate of the root
    xrold = xm;

    % Calculate the midpoint of the search interval
    xm = (xl + xu) / 2;

    % Evaluate the function at the midpoint
    fxm = f(xm);

    % Calculate the approximate relative error
    if xm ~= 0
        ea = abs((xm - xrold) / xm) * 100;
    end

    % Increment the iteration counter
    iter = iter + 1;

    % Display the results for this iteration
    fprintf('Iteration %d:\n', iter);
    fprintf('  xl = %.6f\n', xl);
    fprintf('  xu = %.6f\n', xu);
    fprintf('  xm = %.6f\n', xm);
    fprintf('  f(xl) = %.6f\n', f(xl));
    fprintf('  f(xu) = %.6f\n', f(xu));
    fprintf('  f(xm) = %.6f\n', fxm);
    fprintf('  Approximate relative error = %.6f%%\n\n', ea);

    % Update the search interval based on the sign of the function value at the midpoint
    if fxm < 0
        xl = xm;
    else
        xu = xm;
    end
end

% Display the final results
fprintf('Estimated root: %f\n', xm);
fprintf('Function value at root: %f\n', fxm);
fprintf('Approximate relative error: %f%%\n', ea);
fprintf('Number of iterations: %d\n', iter);

% Plot the graph of the function
x = linspace(-2, 3);
y = f(x);
plot(x, y);
grid on;
xlabel('x');
ylabel('f(x)');
title(sprintf('Graph of f(x) = x^3-3x-5'));

% Add a marker for the root on the graph
hold on;
plot(xm, fxm, 'ro');
text(xm, fxm, sprintf('(%.4f, %.4f)', xm, fxm));
hold off;

