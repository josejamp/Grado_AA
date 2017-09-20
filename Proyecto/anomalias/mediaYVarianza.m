
function [mu, sigma] = mediaYVarianza(x)
%
% calcula la media y la varianza
%
% USAGE: [mu, sigma] = mediaYVarianza(x)
%

	[m, n] = size(x);
	
	% calculamos la media
	mu = (1/m)*sum(x);
	
	% calculamos la varianza
	sigma = cov(x, x, 1);

	%[da_igual, mu, sigma] = featureNormalize(x);

end