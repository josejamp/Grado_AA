function[sig] = sigmoide(z)

	sig = 1./ (1 + e.^(-z));
	
endfunction