#
# Usage:
#	I = mcint(fun, a, b, num_puntos)
#
# Calcula la integral acotada entre dos puntos a y b de una función
# fun aproximada con un número de puntos num_puntos
#
#

function I = mcint(fun, a, b, num_puntos)

tic();

# calculamos el máximo
M = fminbnd(@(x) -fun(x),a,b);

# calculamos el mínimo
m = fminbnd(fun,a,b);

# creamos un array de coordenadas x acotadas entre a y b
randomArrayX = a + (b-a)*rand(1,num_puntos);

# creamos un array de coordenadas y acotadas entre M y m
randomArrayY = m + (M-m)*rand(1,num_puntos);

# recorremos los arrays y miramos si los puntos estan por encima o por debajo
n_debajo = 0;
for i = 1:num_puntos
    x = randomArrayX(i);
    y = randomArrayY(i);
    if ( y < fun(x) )
        n_debajo = n_debajo + 1;
    endif
endfor

# finalmente calculamos la integral
I = (n_debajo/num_puntos)*(b-a)*M;

time = toc()

endfunction
