#
#	Usage
#		p = predict(theta1, theta2, x, y)
# Calcula el porcentaje de elementos
# bien clasificados

function p = predict(theta1, theta2, x, y)
	
	v = sigma([ones(rows(y),1) x] * theta1');
	
	u = sigma([ones(rows(v),1) v] * theta2');
	
	[i, pred] = max(u');
	
	p = mean(double(pred' == y));
	
end
	