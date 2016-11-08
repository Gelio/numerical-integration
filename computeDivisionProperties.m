% [hx, hy, P] = computeDivisionProperties(P0, P1, P2, n) - funkcja
% obliczajaca wlasciwosci podzialu trojkata o wierzcholkach P0, P1, P2 na
% n^2 trojkatow. Zakladamy, ze trojkat przed podzialem jest rownoboczny.
%
% Wejscie:
% * P0, P1, P2 - wierzcholki trojkata (wektory)
% * n - liczba okreslajaca liczbe podzialow trojkata
%
% Wyjscie:
% * hx - wektor przesuniecia do nastepnego wiersza w podziale
% * hy - wektor przesuniecia do nastepnej kolumny w wierszu (zakladam, ze
% w kazdej kolumnie sa dwa trojkaty, wiecej informacji w sprawozdaniu)
% * P - pole trojkata po podziale
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [hx, hy, P] = computeDivisionProperties(P0, P1, P2, n)
% Obliczenie wektorow przesuniec
hx = (P1 - P0) / n;
hy = (P0 - P2) / n;


% Macierz potrzebna do obliczenia pola ca³ego trójk¹ta
areaMatrix = [  1     1     1  ;
              P0(1) P1(1) P2(1);
              P0(2) P1(2) P2(2)
             ];
totalArea = det(areaMatrix) / 2;

% Obliczenie pola trójk¹ta po podziale
P = totalArea / (n^2);
end

