
function [vocabulario, length] = creaVocabulario
	
	vocablist = getVocabList;
	
	length = length(vocablist);
	
	for(i=1:length)
		
		vocabulario.( vocablist{i} ) = i;
		
	end
	
	
end