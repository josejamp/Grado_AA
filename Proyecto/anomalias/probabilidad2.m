
function mult = probabilidad2(x, mu, sigma)
%
% calcula la probabilidad de los ejemplos x
% utilizando la densidad
%
% USAGE: mult = probabilidad2(x, mu, sigma)
%
	
	[m, n] = size(x);
	
	mult = ones(m,1);

	for(i=1:m)
	
		for(j=1:n)
		
			raiz = realsqrt(2*pi*sigma(j));
			inversa_raiz = 1/(raiz);
			
			numerador = (x(i,j)-mu(j))^2;
			denominador = 2*(sigma(j));
			
			if(denominador == 0)
				j
			end
			
			mult(i,1) = mult(i)*inversa_raiz*exp(- numerador / denominador);
		
		end
	
	end
	
end
