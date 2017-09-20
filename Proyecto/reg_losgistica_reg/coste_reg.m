#
# Usage:
#	[J,grad] = coste_reg(theta, lambda, x, y)
#
#	Calcula el gradiente y el coste aplicando
#	regularización

function [J,grad] = coste_reg(theta, lambda, x, y)

	m = rows(y);
		
	# calculamos la función de hipótesis
	h = sigma(x*theta');

	# calculamos el coste
	J = ((1/m)*sum((-y).*log(h) - (1-y).*log(1 - h))) + (lambda/(2*m))*sum(theta.^2);

	# calculamos el gradiente, la primera posición es distinta a las demás
	grad = sum((h-y).*x)*(1/m);
	extra = (lambda*theta)/m;
	grad(:,2:columns(grad)) = grad(:,2:columns(grad)) + extra(:,2:columns(extra));

end	