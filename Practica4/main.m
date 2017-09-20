

function p = main()
	
	# carga datos
	[x,y] = leeArchivo();
	
	num_entradas = 400;
	
	num_ocultas = 25;
	
	num_etiquetas = 10;
	
	lambda = 1;
	
	# entrenamiento
	# initial theta en forma de vector columna, costeRN las transforma
	initial_thetas = [(pesosAleatorios(num_entradas, num_ocultas))(:); (pesosAleatorios(num_ocultas, num_etiquetas))(:)];
	
	options = optimset('MaxIter', 1000);
	
	[all_thetas, coste] = fmincg( @(t) costeRN(t, num_entradas, num_ocultas, num_etiquetas, x, y, lambda) ,initial_thetas, options);
	
	theta1 = reshape(all_thetas(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas+1));
	
	theta2 = reshape(all_thetas((1 + (num_ocultas *(num_entradas + 1))):end), num_etiquetas, (num_ocultas+1));
	
	# prediccion
	p = predict(theta1, theta2, x, y);
	
	
endfunction
