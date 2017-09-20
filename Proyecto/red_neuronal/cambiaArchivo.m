
function cambiaArchivo
	
	load ex1data1.mat
	
	for(i = 1:rows(y))
		
		if(y(i)==0)
			y(i)=2;
		end
		
	end
		
	for(i = 1:rows(yval))
	
		if(yval(i)==0)
			yval(i)=2;
		end
		
	end
	
	for(i = 1:rows(ytest))
	
		if(ytest(i)==0)
			ytest(i)=2;
		end
	
	end
	
	save ex1data2.mat X y Xval yval Xtest ytest
	
end