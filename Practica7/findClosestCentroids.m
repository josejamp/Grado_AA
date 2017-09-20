
function idx = findClosestCentroids(X, centroids)
	
	m = rows(X);
	k = rows(centroids);
	idx = zeros(m,1);
	
	for(i = 1:m)
		
		x = X(i,:);

		for(j = 1:k)
			
			mu = centroids(j,:); % mu(j)
			
			resta = (x - mu); % x(i)-mu(j)

			result(j) = resta*resta'; % ||x(i)-mu(j)||²
	
		end

		[no_importa, idx(i)] = min(result);
		result = zeros(k, 1); % limpiamos result en cada iteracion	

	end
	
	
	
	
end
