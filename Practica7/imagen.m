

function imagen
	
	% Imagen normal
	A = double(imread('bird_small.png'));

	% Comprime
	Nueva = reshape(A, rows(A)*columns(A), 3);
	[centroids, idx] = kMeans(Nueva, 16, 10, false);

	for(i=1:rows(Nueva))
		Nueva(i,:) = centroids(idx(i),:);
	end

	Imagen = reshape(Nueva, rows(A), columns(A), 3);
	Imagen = Imagen / 255;
	imagesc(Imagen);
	
	
end
