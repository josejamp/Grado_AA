#
# Usage:
#	[theta, cost] = valorOptimo_reg(x,y)
#
#	Calcula el valor �ptimo de theta y el coste
#	utilizando regularizaci�n y fminunc, y 
#	dibuja los puntos y la funci�n que los separa 

function [theta, cost] = valorOptimo_reg(x,y)
	
	m = rows(y);
	
	x = mapFeature(x(:,1),x(:,2));

	theta_inicial = zeros(1, columns(x));
	
	opciones = optimset('GradObj', 'on', 'MaxIter', 400);

	[theta, cost] = fminunc(@(t)(coste_reg(t, 1000, x, y)), theta_inicial, opciones);

	plotDecisionBoundary(theta',x,y);

end	