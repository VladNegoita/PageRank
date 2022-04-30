function sol = solve_upper_triang(R, b)
	% this function solves the system R * x = b where:
    % R = upper triangular matrix and b is a column vector

    [n, ~] = size(R);
    sol = zeros(n, 1);

    for i=n:-1:1
        sum = R(i, i+1:n) * sol(i+1:n);
        sol(i) = (b(i) - sum) / R(i, i);
    end
end
