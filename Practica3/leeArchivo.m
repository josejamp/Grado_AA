#
# Usage:
#		[X,y] = leeArchivo()
#
# Carga los contenidos del archivo y
# muestra los datos

function [X,y] = leeArchivo()
	
	load('ex3data1.mat');

	m=size(X, 1) ;

	%Selecciona aleatoriamente 100 ejemplos
	rand_indices = randperm(m);

	sel = X(rand_indices(1:100) , :);

	displayData(sel);	
	
endfunction
