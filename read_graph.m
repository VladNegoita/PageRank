function [ADJ, DEG, val] = read_graph(name)
    % function that reads a graph from a specified file
    % input:
    %   -> name: the name of the file
    % output:
    %   -> ADJ: the adjacency matrix of the graph
    %   -> DEG: column vector containing the out degree of every node
    %   -> val: two parameters used for member functions

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
        
        if ADJ(node, node) == 1 % self edge
            ADJ(node, node) = 0;
            DEG(node) = DEG(node) - 1;
        end
    end
    val = fscanf(fid, '%f', 2);
    fclose(fid);
end
