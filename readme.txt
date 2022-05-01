~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

				 PageRank
			     - Brief README -

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Brief description

Each task has minimum one dedicated function (those were already part of the skel).

Beside those functions, this project contains:

	1. Gram_Schmidt -> produces a QR factorization of a matrix

	2. read_graph -> reads the graph from a specified file and returns its
			 adjancency matrix and other useful information

	3. solve_upper_triang -> solves an upper triangular system

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2. Methods explanation

For calculating the PageRank vector we use two methods:

	1. Iterative
	2. Algebraic

Both methods have in common the same idea of calculating the PageRank:

	1. R(t + 1) = d * M * R(t) - ((1 - d) / n) * 1v

	2. R = d * M * R - ((1 - d) / n) * 1v
			<=>
	   (I - d * M) * R = ((1 - d) / n) * 1v

where:

	R = the PageRank vector
	d = damping factor
	n = the number of pages
	1v = the column vector that has only ones as entries
	M = stochastic matrix -> M(i, j) = {
						1 / exterior_degree(j)
							if j links to i
						0
							otherwise
					   }
	and it is calculated this way: M = (K^-1 * A) transposed where: 
						A = adjacency matrix
						K = out degrees matrix

Observations:

	1. the algebraic method has a greater precision
	2. the iterative method might be faster
	3. the formula used for algebraic calculations may be obtained from the 
	   iterative one when considering R(t + 1) = R(t) (or t approaches inf)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3. Testing

The program was tested using the provided data.
In addition, each function was manually tested with various exemples, such as:

	-> PR_Inv was tested with diagonal, upper-triangular, orthogonal,
				  symetric, random matrices

	-> Gram_Schmidt was tested with diagonal, upper-triangular, orthogonal,
					symetric, random matrices

	-> solve_upper_triang was tested with a random upper-triangular matrix

	-> read_graph was tested with a variety of graphs -> with and without
							     self-loops

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4. Bibliography

	1. https://en.wikipedia.org/wiki/PageRank
	2. Lab_3_MN -> Optimised Gram-Schmidt

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Copyright 2022 Vlad Negoita <vlad1negoita@gmail.com>