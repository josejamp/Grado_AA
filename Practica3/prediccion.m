

function p = prediccion(all_theta, x, y)

	m = rows(y);
	num_etiquetas = rows(all_theta);
	
	x = [ones(m,1), x];
	
	[z, g] = max(sigma(x * all_theta')');
	
	p = mean(double(g' == y));
	
endfunction