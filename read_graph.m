function [ADJ, DEG, val] = read_graph(name)
    % function that reads a graph from a specified file
    % ADJ represents its adjacency matrix
    % DEG is a vector containing the out degree of every node

    fid = fopen(name, 'r');
    n = fscanf(fid, '%d', 1);

    ADJ = zeros(n, n);
    DEG = zeros(n, 1);

    for i = 1:n
        node = fscanf(fid, '%d', 1);
        DEG(node) = fscanf(fid, '%d', 1);
        vect = fscanf(fid, '%d', DEG(node));
        for j = 1:DEG(node)
            ADJ(node, vect(j)) = 1;
        end
        ADJ(node, node) = 0;
    end
    val = fscanf(fid, '%f', 2);
    fclose(fid);
end
