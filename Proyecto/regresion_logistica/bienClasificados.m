#
# Usage:
#	buenos = bienClasificados(theta, x,y)
#
#	Calcula el porcentaje de puntos bien clasificados

function buenos = bienClasificados(theta, x, y)
	
	# añadimo unos
	x = [ones(rows(y),1), x];

	# calculamos la hipótesis
	h = sigma(x*theta');

	# calculamos el nº de aprobados y suspenso
	num_pass = length(find(y == 1));
	num_fail = length(find(y == 0));
	
	# calculamos los índices de aprobados y suspensos predichos
	aprobados = find(h >= 0.5)
	suspensos = find(h < 0.5)
	
	# calculamos los aprobados y suspensos predichos
	num_exito_pass = length(find(y(aprobados,1) == 1));
	num_exito_fail = length(find(y(suspensos,1) == 0));

	# calculamos el porcentaje
	buenos = (num_exito_pass + num_exito_fail)/(num_pass+num_fail);
	
end	
