% limpando memoria
close;
clear all;
clc;

% load function file
source './functions/zero-de-funcoes/common.m';
source './functions/zero-de-funcoes/iterativo-linear.m';

% Metodo Iterativo Linear
% Pré-requisitos
% a f(x) deve ser continua no intervalo [a. b].
% os sinais de f(x) nos extremos do intervalo [a, b] devem ser contrários, isto é f(a)f(b) < 0.
% Dentro do intervalo [a, b] deve existir um único x tal que f(x) = 0.

% definindo f(x), intervalo [2, 3]
function y = f (x)
  y = x^3 - 5*x^2 + 15;
endfunction

% definindo a função de interação de f(x)
function y = fit (x)
  y = 15 / (x^2 - 5 * x);
endfunction

% lendo parametros
% intervalo
a = -2.0;
b = -1.0;
% chute inicial
x0 = -1.5;
% tolerancia
t = 0.0001;
% maximo de iterações
d = 100;

[x, count] = zeroFuncaoInterativoLinear(@f, @fit, x0, t, d);

fprintf('a raiz aproximada é %f, após %d interações.\n', x, count);

