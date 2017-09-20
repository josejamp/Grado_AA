function[J, grad] = coste(theta, X, Y)

	m = length(X);
	
	J = sum((-1 .* y .* log(sigmoide(X * theta))) - (log(1-sigmoide(X * theta)) .* (1 - y)))/m ;

	grad = sum((X' * diag(sigmoid(X * theta) - y)),2)/m;
	
endfunction