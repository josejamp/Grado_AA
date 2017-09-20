
function mejor_epsilon = buscaEpsilon(p, y)
%
% busca el mejor valor de epsilon para los datos de
% validacion
%
% USAGE: mejor_epsilon = buscaEpsilon(p, y)
%
	
	mejor_relacion = 0;
	mejor_epsilon = min(p);
	
	stepsize = (max(p) - min(p)) / 1000;
	for( epsilon = min(p):stepsize:max(p) )
	
		pred = (p < epsilon);
		
		% calculamos los falsos negaivos, positivos y
		% los verdaderos positivos y negativos
		[fp, fn, vp, vn] = predFalsos(pred, y);
		
		% calculamos el porcentaje de verdaderos positivos
		% sobre el total de positivos PREDICHOS (falsos y verdaderos)
		pos = vp + fp;
		if(pos == 0)
			pos = 1;
		end
		prec = vp/pos;
		
		% calculamos el porcentaje de verdaderos predichos
		% sobre el total de positivos REALES (vp y fn)
		vpos = vp + fn;
		if(pos == 0)
			pos = 1;
		end
		rec = vp/vpos;
		
		% calculamos la funcion
		suma = prec + rec;
		if(suma == 0)
			suma = 9999;
		end
		relacion = (2 * prec * rec) /suma;
		
		if(relacion > mejor_relacion)
			
			mejor_relacion = relacion
			mejor_epsilon = epsilon
			
		end
		
	end
	
end