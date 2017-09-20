
function efectoDeC(C)
	
	load('ex6data1.mat');

	model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
	
	visualizeBoundaryLinear(X,y,model);
	drawnow
	
end
