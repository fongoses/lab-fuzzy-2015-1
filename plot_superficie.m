%
% Disciplina: Redes Neurais e Sistemas Fuzzy - INF01017U
% Professor: Prof. Engel
%
% Laboratório 1 - Sistemas de Inferência Fuzzy
%
% Grupo:
% * Luiz Gustavo Frozi de Castro e Souza
% * Pedro Henrique Frozi de Castro e Souza
%
% Instituto de Informática - INF
% Universidade Federal do Rio Grande do Sul - UFRGS
%
% plot_superficie.m
% * Script para plotar a superfície da função de saída do SIF
%

theta = -180:5:180;
[ii p] = size(theta);

for i = 1:p
    %
    % thetaA: Conjuntos Fuzzy do Alvo
    %
    Ea(i) = triangulo(theta(i), -190, -180, 0);
    Fa(i) = triangulo(theta(i), -90, 0, 90);
    Da(i) = triangulo(theta(i), 0, 180, 190);

    %
    % thetaB: Conjuntos Fuzzy da Bola
    %
    Eb(i) = triangulo(theta(i), -190, -180, 0);
    Fb(i) = triangulo(theta(i), -90, 0, 90);
    Db(i) = triangulo(theta(i), 0, 180, 190);

    %
    % thetaR: Conjuntos Fuzzy do Robo
    %
    Er(i) = triangulo(theta(i), -190, -180, 0);
    Fr(i) = triangulo(theta(i), -180, 0, 180);
    Dr(i) = triangulo(theta(i), 0, 180, 190);
end;

%
% Plota os graficos dos conjuntos
%
figure;
subplot(3, 1, 1), plot(theta, Ea, 'b', theta, Fa, 'r', theta, Da, 'g'), title('Alvo'), legend('E', 'F', 'D', -1), xlabel('theta'), ylabel('mi'), xlim([-180 180]), ylim([0 1]);
subplot(3, 1, 2), plot(theta, Eb, 'b', theta, Fb, 'r', theta, Db, 'g'), title('Bola'), legend('E', 'F', 'D', -1), xlabel('theta'), ylabel('mi'), xlim([-180 180]), ylim([0 1]);
subplot(3, 1, 3), plot(theta, Er, 'b', theta, Fr, 'r', theta, Dr, 'g'), title('Robo'), legend('E', 'F', 'D', -1), xlabel('theta'), ylabel('mi'), xlim([-180 180]), ylim([0 1]);
hold on;

%
% Calcula o valor de saida do thetaR para todas as tuplas do produto
% cartesiano
%
for i = 1:p
    for j = 1:p
        % Calcula a forca de disparo das regras (min)
        alfa1(i, j) = min(Eb(i), Ea(j));
        alfa2(i, j) = min(Eb(i), Fa(j));
        alfa3(i, j) = min(Eb(i), Da(j));
        alfa4(i, j) = min(Fb(i), Ea(j));
        alfa5(i, j) = min(Fb(i), Fa(j));
        alfa6(i, j) = min(Fb(i), Da(j));
        alfa7(i, j) = min(Db(i), Ea(j));
        alfa8(i, j) = min(Db(i), Fa(j));
        alfa9(i, j) = min(Db(i), Da(j));

        % Calcula as alturas dos conjuntos cortados de saida (max)
        altEr(i, j) = max([alfa2(i, j), alfa3(i, j), alfa6(i, j)]);
        altFr(i, j) = max([alfa1(i, j), alfa5(i, j), alfa9(i, j)]);
        altDr(i, j) = max([alfa4(i, j), alfa7(i, j), alfa8(i, j)]);

        % Calcula o valor de saida pela media ponderada dos valores de
        % pico dos conjuntos originais de saida
        z(i, j) = (-180 * altEr(i, j) + 0 * altFr(i, j) + 180 * altDr(i, j)) / (altEr(i, j) + altFr(i, j) + altDr(i, j));
    end;
end;

%
% Plota a funcao de saida
%
figure;
[x y] = meshgrid([-180:5:180]);
surf(x, y, z);
