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
  count = 0;
  x = (a + b) / 2;

  switch t
    case { 1, 3 }
      while (t == 1 && abs(f(x)) >= d) || (t == 3 && count < d)
        if f(a) * f(x) < 0
          b = x;
        else
          a = x;
        endif
        x = (a + b) / 2;
        count += 1;
      endwhile
     case 2
      k = ceil((log(b - a) - log(d)) / log(2));
      fprintf('A estimativa do numero de interacoes é de %d\n', k);
      do
        x0 = x;
        if f(a) * f(x) < 0
          b = x;
        else
          a = x;
        endif
        x = (a + b) / 2;
        count += 1;
      until ((abs(x - x0) / abs(x)) < d) && count <= k
  endswitch
endfunction
