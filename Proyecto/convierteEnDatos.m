
function convierteEnDatos(porcentajeTrain, porcentajeVal)
%
% convierteEnDatos(porcentajeTrain, porcentajeVal) separa
% los atos tratados en datos para entrenamiento, validacion
% y prueba, segun porcentajeTrain para entrenamiento
% porcentajeVal para validacion y lo que quede para prueba
%
% USAGE: convierteEnDatos(porcentajeTrain, porcentajeVal)
%

	% Cargamos los datos ya tratados
	load datos_tratados.mat;
	
	% Definimos variables del archivo
	numTotal = 2584;
	numAtributos = 18;
	
	% Calculamos el numero de datos que utilizaremos para
	% entrenamiento, validacion y prueba
	numTrain = calculaPorcentaje(numTotal, porcentajeTrain);
	numVal = calculaPorcentaje(numTotal, porcentajeVal);	
	numTest = numTotal - (numTrain + numVal);
	
	% Formamos los datos de entrenamiento
	X(1:numTrain, 1:numAtributos) =  Datos(1:numTrain, 1:numAtributos);
	Y(1:numTrain) = Datos(1:numTrain, numAtributos+1);
	y = Y';
	
	% Formamos los datos de validacion
	Xval(1:numVal, 1:numAtributos) = Datos(numTrain+1:numTrain+numVal, 1:numAtributos);
	Yval(1:numVal) = Datos(numTrain+1:numTrain+numVal, numAtributos+1);
	yval = Yval';
	
	% Formamos los datos de prueba
	Xtest = Datos(numTrain+1+numVal+1:end, 1:numAtributos);
	ytest = Datos(numTrain+1+numVal+1:end, numAtributos+1);
	
	% Guardamos los datos en "ex1data1.mat"
	save ex1data1.mat X y Xval yval Xtest ytest
	
end