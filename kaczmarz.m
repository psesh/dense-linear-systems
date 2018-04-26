%  A simple demo code that tries to solve a least squares problem using the
%  Kaczmarz method. In both cases, we do not
% store the full matrix---just a single row.

clear; close all; clc;
m = 20; n = 20;
A = randn(m, n) - 0.3 * rand(m ,n) + eye(m, n)*30; % a random "A" matrix
b = rand(m, 1)*3 - rand(m, 1) + eye(m, 1)*100; % a random "b" vector
x_real = A \ b;
x = rand(n, 1); % initial guess -- totally random!


% Iterate!
maxiter = 20;
for itersweeps = 1 : maxiter
    for i = 1 : m
        a_row = A(i, :);
        x = x + (b(i) - a_row * x) * a_row' * 1.0/(a_row * a_row');
    end
    error(itersweeps) = norm(x - x_real, 2);
end

semilogy(1:1:maxiter, error, 'o-');
xlabel('Iterations'); ylabel('Error (log)');
