

function [x,y] = leeArchivo()
	
	load('ex4data1.mat');

	m=size(X, 1) ;

	%Selecciona aleatoriamente 100 ejemplos
	rand_indices = randperm(m);

	sel = X(rand_indices(1:100) , :);

	displayData(sel);
	
	x = X;
	
end