
function mainAnomalos
%
% funcion principal que entrena los datos, busca epsilon
% y comprueba los resultados, necesita el archivo datos_anomalos.mat
%
% USAGE: mainAnomalos
%
	
	load datos_anomalos.mat
	
	[mu, sigma] = mediaYVarianza(X);
	
	total_pos_train = length(find(y==1));
	total_pos_val = length(find(yval==1));
	total_pos_test = length(find(ytest==1));
	total_neg_train = length(find(y==0));
	total_neg_val = length(find(yval==0));
	total_neg_test = length(find(ytest==0));
	
	% entrenamiento
	p = probabilidad(X, mu, sigma);
	
	% validacion
	pval = probabilidad(Xval, mu, sigma);
	
	% busca epsilon
	epsilon = buscaEpsilon(pval, yval);
	
	% predicciones
	ptest = probabilidad(Xtest, mu, sigma);
	predtest = (ptest < epsilon);
	predval = (pval < epsilon);
	predtrain = (p < epsilon);
	
	% falsos positivos y falsos negativos
	[fptest, fntest, vptest, vntest] = predFalsos(predtest, ytest);
	[fpval, fnval, vpval, vnval] = predFalsos(predval, yval);
	[fptrain, fntrain, vptrain, vntrain] = predFalsos(predtrain, y);
	
	% mostramos la informacion
	printf("Epsilon: %e\n", epsilon);
	
	printf("\nFalsos negativos:\n");
	printf("f.n. test: %f\n", fntest/total_pos_test);
	printf("f.n. val: %f\n", fnval/total_pos_val);
	
	printf("\nFalsos positivos:\n");
	printf("f.p. test: %f\n", fptest/total_neg_test);
	printf("f.p. val: %f\n", fpval/total_neg_val);
	printf("f.p. train: %f\n", fptrain/total_neg_train);
	
	
end
