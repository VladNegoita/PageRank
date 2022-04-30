function sol = solve_upper_triang(R, b)
	% this function solves the upper traingular system R * x = b
    % input:
    %   -> R: upper triangular matrix
    %   -> b: column vector
    % output:
    %   -> sol: the solution the given system

    [n, ~] = size(R);
    sol = zeros(n, 1);

    for i=n:-1:1
        sum = R(i, i+1:n) * sol(i+1:n);
        sol(i) = (b(i) - sum) / R(i, i);
    end
end
