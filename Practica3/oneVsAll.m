

function [all_theta] = oneVsAll(X, y, num_etiquetas, lambda)
	
	m = rows(y);
	
	x = [ones(m,1), X];
	
	n = columns(x);

	all_theta = zeros(num_etiquetas, n);
	
	initial_theta = zeros(n, 1);

	options = optimset('GrandObj', 'on', 'MaxIter', 50);
	
	for(c = 1:num_etiquetas)
			
		[theta,coste] = fmincg(@(t)(coste_reg(t, lambda, x, (y == c))), initial_theta, options);
		
		all_theta(c,:) = theta;
		
	end		
		
end
