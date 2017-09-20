
function [centroids, idx] =  kMeans(X, K, max_iters, plot_progress)
	
	randidx = randperm(size(X,1));
	centroides = X(randidx(1:K), :);
	[centroids, idx] = runkMeans(X, centroides, max_iters, plot_progress);
	
end
