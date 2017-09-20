
function [mu, sigma] = mediaYDesviacion(x)
%
% calcula la media y la desciacion de los ejemplos x
%
% USAGE: [mu, sigma] = mediaYDesviacion(x)
%

	[m, n] = size(x);
	
	% calculamos la media
	for(i=1:n)
		mu(i) = (1/m)*sum(x(:,i));
	end
	
	% calculamos la desviacion
	for(j=1:n)
		sigma(j) = (1/m).*sum((x(:,j)-mu(j)).^2);
	end

	%[da_igual, mu, sigma] = featureNormalize(x);

end
