function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    [ADJ, DEG, ~] = read_graph(nume);
    n = length(DEG);
    R = ones(n, 1) / n;

    dM = d .* (PR_Inv(diag(DEG)) * ADJ)';
    vect = ((1 - d) / n) .* ones(n, 1);
    
    cnt = 0;
    while cnt < 100
        % R(t + 1) = d * M * R(t) + ((1 - d) / n) * 1
        newR = dM * R + vect;
        if norm(newR - R) < eps
            break;
        end
        R = newR;
        cnt = cnt + 1;
    end
end
