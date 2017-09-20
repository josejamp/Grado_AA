#
# Usage:
#	W = pesosAleatorios(L_in, L_out)
#
#	Inicializa una matriz de pesos con valores aleatorios
# 	entre [-inicial, inicial] con dimensión (L_out+1)*L_in

function W = pesosAleatorios(L_in, L_out)
	
	inicial = 0.12;
	
	W = -inicial + (inicial -(-inicial)) * rand(L_out, 1 + L_in);
	
end