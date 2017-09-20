

function [J grad] = costeReg(theta, x, y, lambda)
	
	m = rows(y);
	
	x = [ones(m,1), x];
	
	h = x*theta;
	
	sumando = h .- y;
	
	J = (1/(2*m))*sum(sumando.^2) + (lambda/(2*m))*sum(theta.^2);
	
	extra = (lambda*theta')/m;

	grad = (1/m)*sum(sumando.*x) + extra;

	grad(1) = grad(1) - (lambda/m)*theta(1);
	
	grad = grad';
	
end
