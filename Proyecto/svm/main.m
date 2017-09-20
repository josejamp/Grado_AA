
function main
	
	load('ex1data1.mat');
	
	C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
	sigma = C;

	for(i=1:columns(C))
	
		for(j=1:columns(sigma))
		
			%entrenamos
			modelo = svmTrain(X, y, C(i), @(x1 , x2) gaussianKernel(x1 , x2 , sigma(j)));
			
			%comparamos los resultados reales con la prediccion,los sumamos y lo guardamos en una matriz
			pred_val(i,j) = sum(yval==svmPredict(modelo, Xval))/rows(yval);
			pred_train(i,j) = sum(y==svmPredict(modelo, X))/rows(y);
			pred_test(i,j) = sum(ytest==svmPredict(modelo, Xtest))/rows(ytest);
			
		end
	
	end
	
	surface(C, sigma, pred_train);
	surface(C, sigma, pred_val);
	surface(C, sigma, pred_test);
	legend('Aciertos con entrenamiento', 'Aciertos con validacion', 'Aciertos con test');
	xlabel('C');
	ylabel('Sigma');
	zlabel('Precisión');
	
end