
function centroids = computeCentroids(X, idx, K)
	
	centroids = zeros(K, columns(X));

	for(k=1:K)
		
		indice = find(idx==k);
		x_c = X(indice,:);
		centroids(k,:) = mean(x_c);
		
	end	
	
end
