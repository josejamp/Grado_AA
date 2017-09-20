
function main
	
	load ex1data1.mat
	
	lambda = [0, 1, 2, 3, 4, 5, 10, 20, 50, 100, 1000];
	
	for(i = 1:columns(lambda))
		
		[theta, coste(i)] = valorOptimo_reg(X, y, lambda(i));
		
		buenos_train(i) = bienClasificados_reg(theta, Xval, yval);
		buenos_test(i) = bienClasificados_reg(theta, Xtest, ytest);
		
	end
	
	plot(lambda, coste);
	legend('Coste');
	xlabel('Lambda');
	ylabel('Coste');
	
end