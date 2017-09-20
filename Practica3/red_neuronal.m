#
# Usage:
#		p = red_neuronal()
# Lee archivos y calcula el porcentaje de
# elementos bien clasificados
#
function p = red_neuronal()
	
	load('ex3data1.mat');
	
	load('ex3weights.mat');
	
	p = predict(Theta1, Theta2, X, y);
	
end