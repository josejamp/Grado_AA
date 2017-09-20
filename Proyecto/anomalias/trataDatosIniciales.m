function trataDatosIniciales
%
% trataDatosIniciales transforma los datos del archivo arff
% en una matriz, en la cual los caracteres se han sustituido por numeros
%
% USAGE: trataDatosIniciales
%
	
	% Abrimos el archivo
	fid = fopen("data.txt");
	
	%Contador
	i = 1;
	
	while(~feof(fid))
		
		%Leemos la linea
		txt = fgetl(fid);
		
		% Parseamos la linea
		parser = strsplit(txt, ",");
		
		% Tratamos la linea
		Datos(i,:) = cambiaCaracteres(parser);
		
		i++;
		
	end
	
	% Guardamos los datos tratados en el archivo "datos_tratados.mat"
	save datos_tratados.mat Datos
	
end