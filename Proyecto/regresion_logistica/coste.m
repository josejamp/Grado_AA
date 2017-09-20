#
# Usage:
#	[J,grad] = coste(theta, x, y)
#
#	Calcula el gradiente y el coste

function [J,grad] = coste(theta, x, y)

	m = rows(y);
		
	# calculamos la hipótesis
	h = sigma(x*theta');

	# calculamos el coste
	J = (1/m)*sum((-y).*log(h) - (1-y).*log(1 - h));

	# calculamos el gradiente
	grad = (1/m).*sum((h-y).*x);

end	
