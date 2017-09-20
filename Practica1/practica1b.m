function practica1b()

	hold on
	
	M = load("p1/ex1data2.txt");
	[M_norm, mu, sigma] = normalizaAtributo(M);
	
	x1 = M_norm(:, 1);
	x2 = M_norm(:, 2);
	
	x = ones(rows(x1), 1);
	x(:, 2) = x1;
	x(:, 3) = x2;
	
	y = M(:, 3);
	
	tam = length(x);
	
	theta = [0 0 0];
	a = 0.01;
	
	for i = 1: 1500
	
		h = x * theta';
		
		J(:, i) = (1 / (2 * tam)) * sum(h - y).^2;
		
		theta(1) = theta(1) - (a / tam) * sum(h - y);
		theta(2) = theta(2) - (a / tam) * sum((h - y).* x1);
		theta(3) = theta(3) - (a / tam) * sum((h - y).* x2);
		
	endfor
	
	V = linspace(4, 5, 1500);
	plot(V, J);
	
	theta
	
	hold off
	
endfunction