function datos_anomalos
%
% datos_anomalos separa
% los datos tratados en datos para entrenamiento, validacion
% y prueba, utilizando porcentajes fijos para cada conjunto,
% y utilizando solo datos negativos para entrenamiento 
%
% USAGE: datos_anomalos
%
	load datos_tratados.mat
	
	% Definimos variables del archivo
	numTotal = rows(Datos);
	numAtributos = columns(Datos)-1;
	numCeros = 2414;
	numUnos = 170;
	
	% Porcentajes de datos que utilizaremos
	porTrainCeros = 60;
	porValCeros = 20;
	porTestCeros = 20;
	porValUnos = 50;
	porTestUnos = 50;
	
	numTrainCeros = calculaPorcentaje(numCeros, porTrainCeros);
	numValCeros = calculaPorcentaje(numCeros, porValCeros);
	numTestCeros = numCeros -(numTrainCeros + numValCeros);
	
	numValUnos = calculaPorcentaje(numUnos, porValUnos);
	numTestUnos = numUnos - numValUnos;
	
	
	% creamos conjuntos de ceros y unos
	datosCero = [];
	datosUno = [];
	
	for(i=1:numTotal)
	
		if(Datos(i,end)==0)
			datosCero = [datosCero; Datos(i,:)];
		else
			datosUno = [datosUno; Datos(i,:)];
		end
	
	end
	
	% creamos los conjuntos finales
	X(1:numTrainCeros, 1:numAtributos) =  datosCero(1:numTrainCeros, 1:numAtributos);
	y(1:numTrainCeros, 1) = 0;
	
	Xval(1:numValCeros, 1:numAtributos) =  datosCero(1:numValCeros, 1:numAtributos);
	Xval(numValCeros+1:numValCeros+numValUnos, 1:numAtributos) = datosUno(1:numValUnos, 1:numAtributos);
	yval(1:numValCeros, 1) = 0;
	yval(numValCeros+1:numValCeros+numValUnos, 1) = 1;
	
	Xtest(1:numTestCeros, 1:numAtributos) =  datosCero(1:numTestCeros, 1:numAtributos);
	Xtest(numTestCeros+1:numTestCeros+numTestUnos, 1:numAtributos) = datosUno(1:numTestUnos, 1:numAtributos);
	ytest(1:numTestCeros, 1) = 0;
	ytest(numTestCeros+1:numTestCeros+numTestUnos, 1) = 1;
	
	save datos_anomalos.mat X y Xval yval Xtest ytest

end
