% S = numericalInterpolationTriangle(f, P0, P1, P2, n) - oblicza calke z
% funkcji f na trojkacie o wierzcholkach P0, P1, P2, dzielac go na n^2
% trojkatow i na kazdym stosujac kwadrature rzedu 4.
%
% Wejscie:
% f - funkcja podcalkowa (funkcja dwoch zmiennych)
% * P0, P1, P2 - wierzcholki trojkata (wektory)
% * n - liczba okreslajaca liczbe podzialow trojkata (domyslnie 1)
%
% Wyjscie:
% * S - wartosc kwadratury
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function S = numericalInterpolationTriangle(f, P0, P1, P2, n)
if nargin < 5
    n = 1; % parametr domyslny
end

% Obliczenie wlasnosci podzialu
[hx, hy, P] = computeDivisionProperties(P0, P1, P2, n);

% Zerowanie wartosci kwadratury
S = 0;

% i - wiersz, j - numer trojkata w wierszu
for i=1:n
    for j=1:(2*i - 1)
        % Obliczenie wspolrzednych trojkata (i, j) po podziale
        [P0ij, P1ij, P2ij] = computeSingleTriangleCoordinates(P2, hx, hy, i, j);
        % Zastosowanie kwadratury na tym trojkacie
        individualS = integrateSingleTriangle(f, P0ij, P1ij, P2ij, P);
        % Zaktualizowanie ogolnej wartosci kwadratury
        S = S + individualS;
    end
end


end

