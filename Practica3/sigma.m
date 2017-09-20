#
# Usage:
#	S = sigma(z)
#
#	Carga la función sigma

function S = sigma(z)
	
	S = 1 ./(1 .+ exp(-z));

end
