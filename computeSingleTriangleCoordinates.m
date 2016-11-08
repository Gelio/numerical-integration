% [P0ij, P1ij, P2ij] = computeSingleTriangleCoordinates(P2, hx, hy, i, j) -
% funkcja obliczajaca wspolrzedne pojedynczego trojkata, na ktorym
% bezposrednio ma zostac zastosowana kwadratura rzedu 4.
%
% Wejscie:
% * P2 - wspolrzedne wierzcholka P2 trojkata (punkt orientacyjny, wiecej
% informacji w sprawozdaniu)
% * hx - wektor przesuniecia do nastepnej kolumny w trojkacie Di (kolumna
% zawiera dwa trojkaty)
% * hy - wektor przesuniecia do nastepnego wiersza w trojkacie Di
% * i - wiersz trojkata, dla ktorego chcemy obliczyc wspolrzedne
% * j - numer w wierszu trojkata, dla ktorego chcemy obliczyc wspolrzedne
%
% Wyjscie:
% [P0ij, P1ij, P2ij] - wektor zawierajacy szukane wspolrzedne trzech
% wierzcholkow pojedynczego trojkata
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [P0ij, P1ij, P2ij] = computeSingleTriangleCoordinates(P2, hx, hy, i, j)
if mod(j, 2) == 0
    % Srodek ciezkosci szukanego trojkata znajduje sie blizej wierzcholka
    % P2 (trojkat jest "na gorze")
    P2ij = P2 + (i-1) * hy + (j-2)/2 * hx;
    P1ij = P2ij + hx;
    P0ij = P1ij + hy;
else
    % Srodek ciezkosci szukanego trojkata znajduje sie dalej od wierzcholka
    % P2 (trojkat jest "na dole")
    P2ij = P2 + (i-1) * hy + (j-1)/2 * hx;
    P0ij = P2ij + hy;
    P1ij = P0ij + hx;
end

end

