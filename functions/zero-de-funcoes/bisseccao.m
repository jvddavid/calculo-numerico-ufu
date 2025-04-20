# Prevent Octave from thinking that this
# is a function file:
1;

% Metodo da bissecção
% Pré-requisitos
% a f(x) deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.

% função do metodo de bissecção retornando a raiz e a quantidade de iterações
% essa função recebe a f(x), o intervalo [a, b], o tipo de parada, e o valor para o determinado tipo de parada
function [x, count] = zeroFuncaoBisseccao(f, a, b, t, d)
  % validando pré-requisito 2
  if f(a) * f(b) >= 0
    error('os sinais de f(x) nos extremos do intervalo [%f, %f] não são contrários', a, b);
    return;
  end

  count = 0;
  x = 0.5 * (a + b);

  while (t == 1 && abs(f(x)) >= d) || (t == 2 && abs(a - b) >= d) || (t == 3 && count < d)
    if f(a) * f(x) < 0
      b = x;
    else
      a = x;
    endif
    x = 0.5 * (a + b);
    count += 1;
  endwhile
endfunction

