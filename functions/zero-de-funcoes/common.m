# Prevent Octave from thinking that this
# is a function file:
1;

% função para calcular a quantidade aproximada de interações que será necessaria dado o erro relativo
function k = zeroFuncaoEstimativaInteracoes(a, b, d)
  k = ceil((log(b - a) - log(d)) / log(2));
endfunction

