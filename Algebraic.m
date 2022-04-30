function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    [ADJ, DEG, ~] = read_graph(nume);
    n = length(DEG);
    dM = d .* (PR_Inv(diag(DEG)) * ADJ)';
    vect = ((1 - d) / n) .* ones(n, 1);

    R = PR_Inv(eye(n, n) - dM) * vect;

end
