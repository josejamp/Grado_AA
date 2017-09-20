
function buscaLambda
	
	load('ex5data1.mat');
	
	lambdas = [0, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10];
	
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
	
	for(i = 1:columns(lambdas))
	
		[theta, coste] = fmincg( @(t) costeReg(t, nx, y, lambdas(i)), theta_inicial, options);
		
		error_validacion(i) = error(theta, nxv, yval);
		
		error_entren(i) = error(theta, nx, y);
		
		error_test(i) = error(theta, nxt, ytest);
	
	end
	
	plot(lambdas, error_entren, lambdas, error_validacion);
	axis([0, 10, 0, 20])
	
	fprintf('lambda\t\tTrain Error\tValidation Error\tTest Error\n');
	
	for(i = 1:columns(lambdas))
		
		fprintf(' %f\t%f\t%f\t%f\t\n', lambdas(i), error_entren(i), error_validacion(i), error_test(i));
		
	end
	
	
end