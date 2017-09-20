#
# Usage:
#	I = mcint2(fun, a, b, num_puntos)
#
# Calcula la integral acotada entre dos puntos a y b de una función
# fun aproximada con un número de puntos num_puntos
#
#

function I = mcint2(fun, a, b, num_puntos)

tic();

# calculamos el máximo
M = fminbnd(@(x) -fun(x),a,b);

# calculamos el mínimo
m = fminbnd(fun,a,b);

# creamos un array de coordenadas x acotadas entre a y b
randomArrayX = a + (b-a)*rand(1,num_puntos);

# creamos un array de coordenadas y acotadas entre M y m
randomArrayY = fun(m) + (fun(M)-fun(m))*rand(1,num_puntos);

x = [a:0.1:b]
plot(randomArrayX,randomArrayY,'ro','markersize',5,x,fun(x))

# creamos una matriz con x y f(x)
randomArrayX = fun(randomArrayX);

# creamos una array de booleanos donde y < f(x)
n_debajo = 0;
boolArray = randomArrayY <= randomArrayX;

# sumamos todos los unos del array
n_debajo = sum(boolArray);

# finalmente calculamos la integral
I = (n_debajo/num_puntos)*(b-a)*fun(M);

time = toc()

endfunction
