

function p = main()
	
	# carga datos
	load ex1data2.mat;
	
	x = X;
	
	num_entradas = 18;
	
	num_ocultas = [10, 25, 50, 100];
	
	num_etiquetas = 2;
	
	lambda = 1;
	
	for(i = 1:columns(num_ocultas))
		# entrenamiento
		# initial theta en forma de vector columna, costeRN las transforma
		initial_thetas = [(pesosAleatorios(num_entradas, num_ocultas(i)))(:); (pesosAleatorios(num_ocultas(i), num_etiquetas))(:)];
		
		options = optimset('MaxIter', 400);
		
		[all_thetas, coste] = fmincg( @(t) costeRN(t, num_entradas, num_ocultas(i), num_etiquetas, x, y, lambda) ,initial_thetas, options);
		
		theta1 = reshape(all_thetas(1:num_ocultas(i) * (num_entradas + 1)), num_ocultas(i), (num_entradas+1));
		
		theta2 = reshape(all_thetas((1 + (num_ocultas(i) *(num_entradas + 1))):end), num_etiquetas, (num_ocultas(i)+1));
		
		# prediccion
		p = predict(theta1, theta2, X, y);
		buenos_train(i) = predict(theta1, theta2, X, y);
		buenos_val(i) = predict(theta1, theta2, Xval, yval);
		buenos_test(i) = predict(theta1, theta2, Xtest, ytest);
	end
	
	plot(num_ocultas, buenos_train, num_ocultas, buenos_val, num_ocultas, buenos_test);
	legend('Aciertos con entrenamiento', 'Aciertos con validacion', 'Aciertos con test');
	xlabel('Numero de ocultas');
	ylabel('Precisión');
	
endfunction
