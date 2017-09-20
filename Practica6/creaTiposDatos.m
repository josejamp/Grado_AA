
function creaTiposDatos(porcentajeTrain)
	
	numEasyHam = 2551;
	
	numHardHam = 250;
	
	numSpam = 500;
	
	lengthVocab = 1899;
	
	load datos.mat;
	
	numEasyTrain = calculaRestantes(porcentajeTrain, numEasyHam);
	
	numHardTrain = calculaRestantes(porcentajeTrain, numHardHam);
	
	numSpamTrain = calculaRestantes(porcentajeTrain, numSpam);
	
	numEasyVal = numEasyHam - numEasyTrain;
	
	numHardVal = numHardHam - numHardTrain;
	
	numSpamVal = numSpam - numSpamTrain;
	
	%Entrenamiento
	
	for(i=1:numEasyTrain)
		
		X(i, 1:lengthVocab) = E(i, 1:lengthVocab);
			
	end
	
	Y(1:numEasyTrain) = 0;
	
	for(i=1:numHardTrain)
	
		indice = i+numEasyTrain;
		
		X(indice, 1:lengthVocab) = H(i, 1:lengthVocab);
		
	end
	
	indiceY = numEasyTrain+1;
	indiceYFinal = numEasyTrain+numHardTrain;
	
	Y(indiceY:indiceYFinal) = 0;
	
	for(i=1:numSpamTrain)
		
		X((i+numEasyTrain+numHardTrain), 1:lengthVocab) = S(i, 1:lengthVocab);
		
	end
	
	Y((numEasyTrain+numHardTrain+1):(numEasyTrain+numHardTrain+numSpamTrain)) = 1;
	
	%Validacion
	
	for(i=1:numEasyVal)
		
		Xval(i, 1:lengthVocab) = E((i+numEasyTrain), 1:lengthVocab);
			
	end
	
	Yval(1:numEasyVal) = 0;
	
	for(i=1:numHardVal)
		
		Xval((i+numEasyVal), 1:lengthVocab) = H((i+numHardTrain), 1:lengthVocab);
		
	end
	
	Yval(numEasyVal+1:numEasyVal+numHardVal) = 0;
	
	for(i=1:numSpamVal)
		
		Xval((i+numEasyVal+numHardVal), 1:lengthVocab) = S((i+numSpamTrain), 1:lengthVocab);
		
	end
	
	Yval((numEasyVal+numHardVal+1):(numEasyVal+numHardVal+numSpamVal)) = 1;
	
	y = Y';
	
	yval = Yval';
	
	save ex6maildata.mat X y Xval yval
	
end