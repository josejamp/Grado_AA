
function nuevos = cambiaCaracteres(chars)
% cambiaCaracteres(chars) convierte el array de celdas chars
% en un array de numeros, los caracteres a y W se vuelven 0,
% el b y N son 1, la c es 2 y la d es 3
%	
% USAGE: cambiaCaracteres(chars)
%
	
	% Inicializamos la lista vacia
	nuevos = [];
	
	% Recorremos el array de celdas
	for(i = 1:columns(chars))
		
		% Cogemos un elemento
		char = chars(1,i);
	
		% Lo tratamos: si es un caracter se le
		% asigna un numero, si no se devuelve
		% el numero
		if(strcmp(char,"a"))
			nuevo = 1;
		elseif(strcmp(char,"b"))
			nuevo = 2;
		elseif(strcmp(char,"c"))
			nuevo = 3;
		elseif(strcmp(char,"d"))
			nuevo = 4;
		elseif(strcmp(char,"W"))
			nuevo = 1;
		elseif(strcmp(char,"N"))
			nuevo = 2;
		else
			nuevo = str2num(cell2mat(char));
		end
		
		% agregamos el caracter a la lista por
		% el final
		nuevos = [nuevos nuevo];
		
	end
end