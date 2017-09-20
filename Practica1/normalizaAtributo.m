function[X_norm, mu, sigma] = normalizaAtributo(X)

	mu  = mean(X);
	sigma = std(X);
	
	for i = 1: length(X);
	
		X_norm(i, :) = (X(i, :) - mu)./ sigma;
	
	endfor
endfunction