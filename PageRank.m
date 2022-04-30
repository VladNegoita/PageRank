function [R1, R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    R1 = Iterative(nume, d, eps); % the answer to the first part 
    R2 = Algebraic(nume, d); % the answer to the second part
    n = length(R1);

    fid = fopen(strcat(nume, '.out'), 'w');

    fprintf(fid, "%d\n", n);
    fprintf(fid, "%.6f\n", R1);
    fprintf(fid, "\n");
    fprintf(fid, "%.6f\n", R2);
    fprintf(fid, "\n");

    %getting val1 and val2 from the specified file
    [~, ~, val] = read_graph(nume);
    
    % applying the member function to the algebraic answer
    for i = 1:n
        U(i) = Apartenenta(R2(i), val(1), val(2));
    end

    % creating the ranking
    [R_sorted, index_order] = sort(U, 'descend');
    for i = 1:n
        fprintf(fid, "%d %d %.6f\n", i, index_order(i), R_sorted(i));
    end
    fclose(fid);
end
