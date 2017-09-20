
function visualizaKernel(C, sigma)

	load('ex6data2.mat');
	
	model = svmTrain(X, y, C, @(x1 , x2) gaussianKernel(x1 , x2 , sigma));

	visualizeBoundary(X, y, model);
	
end
