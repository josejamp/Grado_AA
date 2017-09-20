#
# Usage:
#	[theta, cost] = valorOptimo_reg(x,y)
#
#	Calcula el valor óptimo de theta y el coste
#	utilizando regularización y fminunc, y 
#	dibuja los puntos y la función que los separa 

function [theta, cost] = valorOptimo_reg(x,y, lambda)
	
	m = rows(y);
	
	x = [ones(rows(y),1), x];

	theta_inicial = zeros(1, columns(x));
	
	opciones = optimset('GradObj', 'on', 'MaxIter', 400);

	[theta, cost] = fminunc(@(t)(coste_reg(t, lambda, x, y)), theta_inicial, opciones);

end	