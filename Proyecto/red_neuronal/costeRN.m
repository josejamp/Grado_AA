#
# Usage:
#	[J grad] = costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
#
# Calcula el coste y el gradiente

function [J grad] = costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
	
		#Calculo del coste
	
	Theta1 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
	
	Theta2 = reshape(params_rn((1 + (num_ocultas* (num_entradas + 1))):end), num_etiquetas, (num_ocultas+ 1));
	
	#calculamos m
	m = rows(y);
	
	#inicializamos y sub k
	y_k = zeros(m,num_etiquetas);
	for i = 1:rows(y_k)
		y_k(i,y(i)) = 1;
	end
	
	#añadimos unos a x, es equivalente a 'a'sub 1
	x = [ones(m,1), X];
	
	#calculamos z2
	z2 = x * Theta1';
	
	#calculamos a2
	a2 = sigma(z2);
	a2 = [ones(m,1), a2];
	
	#calculamos z3
	z3 = a2 * Theta2';
	
	#calculamos a3
	a3 = sigma(z3);
	
	#calculamos el coste
	J = (sum(sum(-y_k .* log(a3) .-(1-y_k) .* log(1-a3)))/m) + (lambda/(2*m))*((sum(sum((Theta1 .* Theta1)(:,2:end)))) + (sum(sum((Theta2 .* Theta2)(:,2:end)))));
	
	
		# Calculo del gradiente
	
	#inicializamos los gradientes
	grad1 = zeros(rows(Theta1), columns(Theta1));
	
	grad2 = zeros(rows(Theta2), columns(Theta2));
	
	#retor propagacion
	for i=1:m
	
		a1 = x(i,:);
		
		z2 = a1 * Theta1';
		
		a2 = [1 sigma(z2)];
		
		z3 = a2 * Theta2';
		
		a3 = sigma(z3);
		
		delta3 = a3' - y_k(i,:)';
		
		delta2 = (Theta2' * delta3)(2:end) .* derivada_sigma(z2)';
		
		grad1 = grad1 + delta2 * a1;
		
		grad2 = grad2 + delta3 * a2;

	end
	
	grad1 = (1/m) * grad1;
	grad1(:,2:end) = grad1(:,2:end) + (lambda/m) * Theta1(:,2:end);
	
	grad2 = (1/m) * grad2;
	grad2(:,2:end) = grad2(:,2:end) + (lambda/m) * Theta2(:,2:end);
	
	#modificamos el gradiente para que sea un vector columna
	grad = [grad1(:) ; grad2(:)];
	
end
