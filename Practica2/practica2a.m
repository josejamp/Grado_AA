function practica2a ()

	clear;
	close all;
	hold on
	M = load("p2/ex2data1.txt");
	
	X = M(:, [1, 2]);
	Y = M(:, 3);
	
	%Dibujar los puntos
	negativos = find (Y == 0) ;
	plot(X(negativos, 1), X(negativos, 2) , 'ko' , 'MarkerFaceColor', 'y', 'MarkerSize' ,7 );
	positivos = find (Y == 1) ;
	plot(X(positivos, 1), X(positivos, 2) , '1+' , 'LineWidth', 2, 'MarkerSize' ,7 );
	
	hold off
	
endfunction