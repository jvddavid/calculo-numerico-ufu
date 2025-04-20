# Prevent Octave from thinking that this
# is a function file:
1;

% Metodo Iterativo Linear
% Pré-requisitos
% a f(x) deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.

% função do metodo iterativo linear retornando a raiz e a quantidade de iterações
function [raiz, iteracoes] = zeroFuncaoInterativoLinear(f, g, x0, tol, max_iter)
  % f: função original
  % g: função de iteração
  % x0: aproximação inicial
  % tol: tolerância para o erro
  % max_iter: número máximo de iterações

  iteracoes = 0;
  x = x0;

  while iteracoes < max_iter
    x_next = g(x); % Calcula a próxima aproximação
    erro = abs(x_next - x); % Calcula o erro

    if erro < tol
      raiz = x_next;
      return;
    end

    x = x_next;
    iteracoes = iteracoes + 1;
  end

  error('O método não convergiu dentro do número máximo de iterações.');
end