#
# Usage:
#	S = sigma(z)
#
#	Carga la funci�n sigma

function S = sigma(z)
	
	S = 1 ./(1 .+ exp(-z));

end
