% S = integrateSingleTriangle(f, P0, P1, P2, P) - funkcja obliczajaca calke
% z funkcji f na trojkacie o wierzcholkach P0, P1, P2 i polu P 
% wykorzystujaca kwadrature rzedu 4-tego. Wzor kwadratury zostal podany na
% wykladzie.
%
% Wejscie:
% * f - funkcja podcalkowa (funkcja dwoch zmiennych)
% * P0, P1, P2 - wierzcholki trojkata, na ktorym obliczamy calke (wektory)
% * P - pole trojkata, na ktorym obliczamy calke
% * i - numer wiersza, w ktorym znajduje sie trojkat
% * j - numer trojkata w wierszu
% * nodeValues - macierz zawierajaca stablicowane wartosci (zobacz funkcje
% tabulateIntegrationNodeValues)
%
% Wyjscie:
% * S - obliczona wartosc kwadratury
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function S = integrateSingleTriangle(f, P0, P1, P2, P, i, j, nodeValues)
% Sprawdzenie czy funkcja f przyjmuje wektor dwuelementowy, czy dwa skalary
% jako argumenty
vectorF = f;
if nargin(vectorF) == 2
    % Zamiana na funkcje przyjmujaca wektor dwuelementowy.
    vectorF = @(x)(f(x(1), x(2)));
end

% Obliczenie srodka ciezkosci
P012 = (P0 + P1 + P2) / 3;


% Obliczenie wartosci posrednich (zwieksza czytelnosc kodu)
% Wartosci w srodkach bokow trojkata
% means = 0;
% Wartosci w wierzcholkach trojkata
% vertexes = 0;

if mod(j, 2) == 0
    % Trojkat "na gorze"
    means = nodeValues(2*i - 1, j) + nodeValues(2*i, j) + nodeValues(2*i, j + 1);
    vertexes = nodeValues(2*i - 1, j - 1) + nodeValues(2*i - 1, j + 1) + nodeValues(2*i + 1, j + 1);
else
    % Trojkat "na dole"
    means = nodeValues(2*i + 1, j + 1) + nodeValues(2*i, j) + nodeValues(2*i, j + 1);
    vertexes = nodeValues(2*i - 1, j) + nodeValues(2*i + 1, j) + nodeValues(2*i + 1, j + 2);
end


% Wykorzystanie wzoru kwadratury
S = P / 60   *   (27 * vectorF(P012)  +  3 * vertexes  +  8 * means);

end

