
function p = probabilidad(x, mu, sigma)
%
% calcula la probabilidad de los ejemplos x
% utilizando la distribución gaussiana multivariante
%
% USAGE: p = probabilidad(x, mu, sigma)
%
	
	% calculamos la probabilidad
	nn = length(mu);
	
	if (size(sigma, 2) == 1) || (size(sigma, 1) == 1)
		sigma = diag(sigma);
	end
	
	mult1 = (2 * pi) ^ (nn / 2);
	determinante = det(sigma);
	mult2 = determinante ^ (1/2);
	
	X = bsxfun(@minus, x, mu(:)');
	p = (1/(mult1 * mult2 ))* exp(-0.5 * sum(bsxfun(@times, X * pinv(sigma), X), 2));


end
