% limpando memoria
close;
clear all;
clc;

% load function file
source './functions/zero-de-funcoes/common.m';
source './functions/zero-de-funcoes/newton.m';

% Metodo de Newton
% Pré-requisitos
% a f(x) deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.

% configurando f(x), intervalo [0, 1.5]
function y = f (x)
  y = e^(-x) - sin(3*pi*x);
endfunction

% configurando f'(x)
function y = f1 (x)
  y = -e^(-x) - 3*pi*cos(3*pi*x);
endfunction

% lendo parametros
a = input('Intervalo [a, b] -> a = ');
b = input('-> b = ');
x0 = input('Chute inicial x0 = ');
t = input(['Insira a condição de parada: ' ...
    '1) Valor absoluto |f(x)| < E ou ' ...
    '2) Erro relativo |Xk+1 - Xk|/|Xk+1| < E ou ' ...
    '3) máximo de interações < E | condicao = '
    ]);
d = 0;
if t == 1
  d = input('Insira o valor absoluto |f(x)| = ');
elseif t == 2
  d = input('Insira o erro relativo |Xk+1 - Xk|/|Xk+1| = ');
elseif t == 3
  d = input('Insira o máximo de interações = ');
else
  fprintf('Valor invalido inserido %d, usando valores padrão\n', t);
  d = 100;
  t = 3;
end

if t < 1 || t > 3
  t = 3;
  d = 100;
end

if t == 2
  k = zeroFuncaoEstimativaInteracoes(a, b, d);
  fprintf('a estimativa para a quantidade de interações é de %d\n', k);
end

[x, count] = zeroFuncaoNewton(@f, @f1, a, b, x0, t, d);

fprintf('a raiz aproximada é %f, após %d interações.\n', x, count);

