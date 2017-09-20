
function evolucionCGauss

	load('ex6data3.mat');
	
	%Inicializamos C y sigma
	C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
	sigma = C;
	
	%para cada elemento de C
	for(i=1:8)

		%entrenamos
		modelo(i) = svmTrain(X, y, C(i), @(x1 , x2) gaussianKernel(x1 , x2 , sigma(4)));
		
		%comparamos los resultados reales con la prediccion,los sumamos y lo guardamos en una matriz
		pred(i) = sum(yval==svmPredict(modelo(i), Xval));
		
		
		visualizeBoundary(X, y, modelo(i));
		drawnow
		
	end
	
	%calculamos la posicion que ocupa el mejor en la matriz
	[r,c] = find(pred==max(max(pred)));
	
	%pintamos al mejor
	visualizeBoundary(X, y, modelo(r,c));
	
end