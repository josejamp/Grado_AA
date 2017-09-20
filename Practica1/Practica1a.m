function practica1a ()

	hold on
	
	M = load("p1/ex1data1.txt");
	
	xa = M(:, 1);
	y = M(:, 2);
	x = ones(rows(xa), 1);
	x(:, 2) = xa;
	
	tam = length(x);
	
	plot(xa, y, "rx", "markersize", 15);
	ylabel("Profit in $10,000s", "fontsize", 20);
	xlabel("Population of City in 10,000s", "fontsize", 20);
	
	theta = [0 0];
	a = 0.01;
	
	for i = 1: 1500
	
		h = x * theta';
		
		theta(1) = theta(1) - (a / tam) * sum(h - y);
		theta(2) = theta(2) - (a / tam) * sum((h - y) .* xa);
		
	endfor
	
	plot(xa, theta(1) + theta(2) * xa');
	theta
	
	
	hold off

endfunction