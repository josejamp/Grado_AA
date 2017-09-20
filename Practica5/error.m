

function error = error(theta, x, y)
	
	m = rows(y);
	
	x = [ones(m,1), x];
	
	h = x*theta;
	
	sumando = h .- y;
	
	error = (1/(2*m))*sum(sumando.^2);	
	
end
