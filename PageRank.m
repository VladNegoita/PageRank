function [R1, R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);
    n = length(R1);

    fid = fopen(strcat(nume, '.out'), 'w');

    fprintf(fid, "%d\n", n);
    fprintf(fid, "%.6f\n", R1);
    fprintf(fid, "\n");
    fprintf(fid, "%.6f\n", R2);
    fprintf(fid, "\n");

    [R_sorted, index_order] = sort(R2, 'descend');
    for i = 1:n
        fprintf(fid, "%d %d %.6f\n", i, index_order(i), R_sorted(i));
    end
    fclose(fid);
end
