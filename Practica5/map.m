

function nx = map(x, p)
	
	nx = x;
	
	for(i = 2:p)
		
		#nx = nx concatenado por la ultima columna de nx multiplicada por x
		nx = [nx (nx(:,end).*x)];
		
	end
	
end
