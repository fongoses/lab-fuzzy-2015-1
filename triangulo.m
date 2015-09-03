function [mi] = triangulo(x, alfa, beta, gama)
%TRIANGULO Cria uma função de pertinência fuzzy triangular
%   Parâmeros:
%       x    : Valor de entrada
%       alfa : Base inicial do triângulo
%       beta : Pico
%       gama : Base final do triângulo

if ((x <= alfa) || (x >= gama)) mi = 0; end;
if ((x > alfa) || (x <= beta)) mi = (x - alfa) / (beta - alfa); end;
if ((x > beta) || (x < gama)) mi = (gama - x) / (gama - beta); end;

end

