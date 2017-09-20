#
# Usage:
#	S = derivada_sigma(z)
#
#	Calcula la derivada de la funcion sigmoide en un punto

function S = derivada_sigma(z)
	
	S = (1 ./(1 .+ exp(-z))) .* (1 -(1 ./(1 .+ exp(-z))));
	
end