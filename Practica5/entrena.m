

function entrena
	
	load('ex5data1.mat');
	
	options = optimset('MaxIter', 50);
	
	m = rows(y);
	
	[theta, coste] = fmincg( @(t) costeReg(t, X, y, 0) , [1;1], options);

	plot(X,y, 'rx', 'Markersize', 10, X, [ones(m,1), X]*theta);
	
end