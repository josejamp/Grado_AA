
function procesaEmails
	
	numEasyHam = 2551;
	
	numHardHam = 250;
	
	numSpam = 500;
	
	directorio = "easy_ham";
	
	for(i=1:numEasyHam)
	
		file_name = sprintf("%s/%04d.txt", directorio, i);
	
		file_contents = readFile ( file_name ) ;
		Easy(i) = cellstr( processEmail(file_contents) );
		
	end
	
	directorio = "hard_ham";
	
	for(i=1:numHardHam)
	
		file_name = sprintf("%s/%04d.txt", directorio, i);
	
		file_contents = readFile ( file_name ) ;
		Hard(i) = cellstr( processEmail(file_contents) );
		
	end
	
	directorio = "spam";
	
	for(i=1:numSpam)
	
		file_name = sprintf("%s/%04d.txt", directorio, i);
	
		file_contents = readFile ( file_name ) ;
		Spam(i) = cellstr( processEmail(file_contents) );
		
	end
	
	save emails_procesados.mat Easy Hard Spam;
	
end