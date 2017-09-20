

function curvas_aprendizaje

	load('ex5data1.mat');
	
	m = rows(y);
	
	options = optimset('MaxIter', 200, 'GradObj', 'on');
	
	for(i = 1:m)
		
		xt = X(1:i, :);
		
		yt = y(1:i, :);
		
		[theta, coste] = fmincg( @(t) costeReg(t, xt, yt, 0) , [1;1], options);
		
		error_entren(i) = error(theta, xt, yt);
		
		error_validacion(i) = error(theta, Xval, yval);
		
	end
	
	plot(1:m, error_entren, 1:m, error_validacion);
	
end
