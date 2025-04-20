# Prevent Octave from thinking that this
# is a function file:
1;

% Metodo Iterativo Linear
% Pré-requisitos
% a f(x) deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.

% função do metodo de bissecção retornando a raiz e a quantidade de iterações
% essa função recebe a f(x), a fk1(x) sendo a função de interação, o intervalo [a, b], o chute inicial, o tipo de parada, e o valor para o determinado tipo de parada
function [x, count] = zeroFuncaoInterativoLinear(f, fk1, a, b, x0, t, d)
  % validando pré-requisito 2
  if f(a) * f(b) >= 0
    error('os sinais de f(x) nos extremos do intervalo [%f, %f] não são contrários', a, b);
    return;
  end

  if x0 <= a || x0 >= b
    error('o valor de x0 não está no intervalo (%f, %f).', a, b);
    return;
  endif

  # TODO: implements the function
endfunction

