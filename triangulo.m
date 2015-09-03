function [mi] = triangulo(x, alfa, beta, gama)
%TRIANGULO Cria uma fun��o de pertin�ncia fuzzy triangular
%   Par�meros:
%       x    : Valor de entrada
%       alfa : Base inicial do tri�ngulo
%       beta : Pico
%       gama : Base final do tri�ngulo

if ((x <= alfa) || (x >= gama)) mi = 0; end;
if ((x > alfa) || (x <= beta)) mi = (x - alfa) / (beta - alfa); end;
if ((x > beta) || (x < gama)) mi = (gama - x) / (gama - beta); end;

end

