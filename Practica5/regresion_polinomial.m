

function regresion_polinomial
	
	load('ex5data1.mat');
	
	m = rows(y);
	
	nx = map(X,8);
	
	[nx, mu, sigma] = featureNormalize(nx);
	
	nxt = map(Xtest,8);
	
	nxv = map(Xval,8);
	
	nxt = bsxfun(@minus, nxt, mu);
	nxt = bsxfun(@rdivide, nxt, sigma);
	
	nxv = bsxfun(@minus, nxv, mu);
	nxv = bsxfun(@rdivide, nxv, sigma);
	
	options = optimset('MaxIter', 200, 'GradObj', 'on');
	
	theta_inicial = zeros(columns(nx)+1,1);
	
	[theta, coste] = fmincg( @(t) costeReg(t, nx, y, 0) , theta_inicial, options);
	
	plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
	plotFit(min(X), max(X), mu, sigma, theta, 8);
	
	for(i = 1:m)
		
		xt = nx(1:i, :);
		
		yt = y(1:i, :);
		
		[theta2, coste] = fmincg( @(t) costeReg(t, xt, yt, 0) , theta_inicial, options);
		
		error_entren(i) = error(theta2, xt, yt);
		
		error_validacion(i) = error(theta2, nxv, yval);
		
	end
	
	plot(1:m, error_entren, 1:m, error_validacion);
	axis([0, 13, 0, 100])
	
end
