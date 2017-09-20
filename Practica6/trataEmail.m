
function X = trataEmail(vocabulario, email, length)

	X(1:length) = 0;
	
	while (!strcmp("",cellstr(email)))
	
		[str, email] = strtok(email, [' ']);
		 
		if( isfield(vocabulario, str) )
			
			X(vocabulario.(str)) = 1;
			
		end

	 
	end
	
	
end