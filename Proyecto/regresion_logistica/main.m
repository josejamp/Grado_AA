
function main
	
	load ex1data1.mat;
	
	num_iter = [100, 200, 500, 600, 1000, 10000];
	
	for(i = 1:columns(num_iter))
		
		[theta, coste(i)] = valorOptimo(X, y, num_iter(i));
		
		buenos_train(i) = bienClasificados(theta, Xval, yval);
		buenos_test(i) = bienClasificados(theta, Xtest, ytest);
		
	end
	
	plot(num_iter, buenos_train, num_iter, buenos_test);
	legend('Aciertos con validacion', 'Aciertos con test');
	xlabel('Número de iteraciones');
	ylabel('Precisión');
	
end