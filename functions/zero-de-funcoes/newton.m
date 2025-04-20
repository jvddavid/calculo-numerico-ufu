# Prevent Octave from thinking that this
# is a function file:
1;

% Metodo de Newton
% Pré-requisitos
% as funções f(x) e f'(x)  deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.
% f'(x) != 0, para todo x pertecente ao intervalo (a, b).

% função do metodo de newton retornando a raiz e a quantidade de iterações
% essa função recebe a f(x), f'(x), o intervalo [a, b], o chute inicial, o tipo de parada, e o valor para o determinado tipo de parada
function [x, count] = zeroFuncaoNewton(f, f1, a, b, x0, t, d)
  % validando pré-requisito 2
  if f(a) * f(b) >= 0
    error('os sinais de f(x) nos extremos do intervalo [%f, %f] não são contrários', a, b);
    return;
  end

  if x0 <= a || x0 >= b
    error('o valor de x0 não está no intervalo (%f, %f).', a, b);
    return;
  endif

  count = 0;
  x = x0;
  switch t
    case { 1, 3 }
      while (t == 1 && abs(f(x)) >= d) || (t == 3 && count < d)
        r1 = f1(x0);
        if r1 == 0
          error("f'(%f) == 0.", x0);
          return;
        endif
        x0 = x;
        x = x0 - f(x0)/r1;
        count += 1;
      endwhile
    case 2
      do
        r1 = f1(x0);
        if r1 == 0
          error("f'(%f) == 0.", x0);
        endif
        x0 = x;
        x = x0 - f(x0)/r1;
        count += 1;
      until ((abs(x - x0) / abs(x)) <= d)
  endswitch
endfunction

