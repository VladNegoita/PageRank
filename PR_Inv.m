function B = PR_Inv(A)
	% this function calculates the inverse of A using Gram-Schmidt

    [n, ~] = size(A);
    [Q, R] = Gram_Schmidt(A);
    B = zeros(n, n);
    Qt = Q';

    % Q * R * B = I
    % R * B = Q_t

    % equivalent equation: R * B_i = Qt * e_i = Qt_i
    for i = 1:n
        B(:, i) = solve_upper_triang(R, Qt(:, i));
    end
end
