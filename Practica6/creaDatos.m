
function creaDatos
	
	numEasyHam = 2551;
	
	numHardHam = 250;
	
	numSpam = 500;
	
	load emails_procesados.mat;
	
	[vocabulario, length] = creaVocabulario;
	
	E = trataEmail(vocabulario, Easy(1,1), length);
	
	for(i=2:numEasyHam)
	
		E = [E; trataEmail(vocabulario, Easy(1,i), length)];
		
	end
	
	E(1:numEasyHam, length+1) = 0;
	
	H = trataEmail(vocabulario, Hard(1,1), length);
	
	for(i=2:numHardHam)
	
		H = [H; trataEmail(vocabulario, Hard(1,i), length)];
		
	end
	
	H(1:numHardHam, length+1) = 0;
	
	S = trataEmail(vocabulario, Hard(1,1), length)
	
	for(i=2:numSpam)
	
		S = [S; trataEmail(vocabulario, Spam(1,i), length)];
		
	end
	
	S(1:numSpam, length+1) = 1;
	
	save datos.mat E H S;
	
end