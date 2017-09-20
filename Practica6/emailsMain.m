
function emailsMain
	
	load('ex6maildata.mat');
	
	C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
		
	for(i=1:8)
		%entrenamos
		modelo(i) = svmTrain(X, y, C(i), @(x1 , x2) linearKernel(x1 , x2));
		
		%comparamos los resultados reales con la prediccion,los sumamos y lo guardamos en una matriz
		pred_test(i) = sum(yval==svmPredict(modelo(i), Xval))/rows(yval);
		pred_train(i) = sum(y==svmPredict(modelo(i), X))/rows(y);
		
	end
	
	%mostramos al mejor
	%fprintf("Precision del mejor: %f\n", (pred/rows(yval)));
	
	plot(C, pred_train, C, pred_test);
	legend('Aciertos con entrenamiento', 'Aciertos con test');
	xlabel('C');
	ylabel('Precisión');
	
end