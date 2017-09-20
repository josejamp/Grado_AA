#
# Usage:
#	[theta, cost] = valorOptimo(x,y)
#
#	Calcula el valor óptimo de theta y el coste
#	utilizando fminunc, y dibuja los puntos y
#	la función que los separa 

function [theta, cost] = valorOptimo(x,y, num_iter)
	
	m = rows(y);

	theta_inicial = zeros(1, columns(x) +1);

	x = [ones(m,1), x];
	
	opciones = optimset('GradObj', 'on', 'MaxIter', num_iter);

	[theta, cost] = fminunc(@(t)(coste(t, x, y)), theta_inicial, opciones);

end	
