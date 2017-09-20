#
# Usage:
#	[theta, cost] = valorOptimo_reg(x,y)
#
#	Calcula el valor �ptimo de theta y el coste
#	utilizando regularizaci�n y fminunc, y 
#	dibuja los puntos y la funci�n que los separa 

function [theta, cost] = valorOptimo_reg(x,y, lambda)
	
	m = rows(y);
	
	x = [ones(rows(y),1), x];

	theta_inicial = zeros(1, columns(x));
	
	opciones = optimset('GradObj', 'on', 'MaxIter', 400);

	[theta, cost] = fminunc(@(t)(coste_reg(t, lambda, x, y)), theta_inicial, opciones);

end	