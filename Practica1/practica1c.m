function practica1c()

	hold on
	
	M = load("p1/ex1data2.txt");
	
	xa = M(:, 1);
	
	x = ones(rows(xa), 1);
	x(:, 2) = xa;
	x(:, 3) = M(:, 2);
	
	y = M(:, 3);
	
	theta = inverse(x' * x) * x' * y
	
	hold off
	
endfunction