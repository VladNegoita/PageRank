function [Q, R] = Gram_Schmidt(A)
    % this function returns a QR factorization of the given matrix
    % the algorithm implemented is an optimized version of Gram_Schmidt
    % input:
    %   -> A: the matrix to be factorised
    % output:
    %   -> Q: the orthogonal matrix
    %   -> R = upper triangular matrix
    
    [n, ~] = size(A);
    Q = zeros(n, n);
    R = zeros(n, n);
    for i = 1:n
        R(i, i) = norm(A(:, i));
        Q(:, i) = A(:, i) / R(i, i);
        for j = i+1:n
            R(i, j) = Q(:, i)' * A(:, j);
            A(:, j) = A(:, j) - R(i, j) * Q(:, i);
        end
    end
end