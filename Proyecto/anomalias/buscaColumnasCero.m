
function R = buscaColumnasCero
%
% funcion principal que busca las columnas en las que los
% datos son todo cero y las elimina
%
% USAGE: R = buscaColumnasCero
%
	
	load datos_tratados.mat

	R = [];

	for(i=1:columns(Datos))	
		
		if(length(find(Datos(:,i)==0))!=rows(Datos))
			if(i < 9)
				R = [R i];
			endif
		endif 
		
	end
	
	R = [R 19];
	
	Datos = Datos(:,R);

	save datos_tratados.mat Datos
	
end	
