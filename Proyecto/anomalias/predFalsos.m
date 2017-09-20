function [falsosP, falsosN, verdaderosP, verdaderosN] = predFalsos(pred, y)
%
% calcula los falsos positivos, los falsos negativos,
% los verdaderos positivos y los verdaderos negativos
%
% USAGE: [falsosP, falsosN, verdaderosP, verdaderosN] = predFalsos(pred, y)
%
 
    falsosN = sum((pred == 0) & (y == 1));

    falsosP = sum((pred == 1) & (y == 0));
	
	verdaderosN = sum((pred == 0) & (y == 0));
	
	verdaderosP = sum((pred == 1) & (y == 1));

end