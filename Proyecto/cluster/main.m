

function main
	
	load datos_tratados.mat

	% Comprime
	%Nueva = reshape(Datos, rows(Datos)*columns(Datos), 3);
	Nueva = Datos;
	[centroids, idx] = kMeans(Nueva, 2, 10, true);

	for(i=1:rows(Nueva))
		Nueva(i,:) = centroids(idx(i),:);
	end

	
	
end
