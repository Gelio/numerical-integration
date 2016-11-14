% nodeValues = tabulateIntegrationNodeValues(f, P2, n, hx, hy) - funkcja
% tablicuje wartosci w wierzcholkach oraz srodkach bokow trojkatow w celu
% pozniejszego wielokrotnego wykorzystania. Jest to rozwiazanie bardziej
% efektywne niz obliczanie tych wartosci kazdorazowo dla poszczegolnych
% trojkatow. Korzysta z wczesniej obliczonych parametrow hx, hy,
% ilosci podzialow n oraz wspolrzednej P2 trojkata, na ktorym odbywa sie
% kwadratura. Zwraca macierz rozmiaru 2n+1 x 2n+1.
%
% Wejscie:
% * f - funkcja podcalkowa (funkcja dwoch zmiennych)
% * P2 - wspolrzedne wierzcholka P2 trojkata (punkt orientacyjny, wiecej
% informacji w sprawozdaniu)
% * n - liczba okreslajaca ilosc podzialow
% * hx - wektor przesuniecia do nastepnej kolumny w trojkacie Di (kolumna
% zawiera dwa trojkaty)
% * hy - wektor przesuniecia do nastepnego wiersza w trojkacie Di
%
% Wyjscie:
% * nodeValues - macierz rozmiaru 2n+1 x 2n+1 zawierajaca stablicowane
% wartosci z punktach potrzebnych do kwadratury.
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function nodeValues = tabulateIntegrationNodeValues(f, P2, n, hx, hy)
% Pierwiastek z ilosci punktow do stablicowania
nodesAmountRoot = 2*n + 1;

hxHalved = hx / 2;
hyHalved = hy / 2;

% Wypelnienie tablicy zerami
nodeValues = zeros(nodesAmountRoot, nodesAmountRoot);

% Sprawdzenie czy funkcja f przyjmuje wektor dwuelementowy, czy dwa skalary
% jako argumenty
vectorF = f;
if nargin(vectorF) == 2
    % Zamiana na funkcje przyjmujaca wektor dwuelementowy.
    vectorF = @(x)(f(x(1), x(2)));
end

% Ustalenie wspolrzednych pierwszego punktu do stablicowania w pierwszym
% wierszu
rowStartNode = P2;

% Petla obliczajaca wartosci w kolejnych punktach
for i=1:nodesAmountRoot
    currentNode = rowStartNode;
    for j=1:i
        % i, j - wspolrzedne aktualnego punktu do stablicowania
        nodeValues(i, j) = vectorF(currentNode);
        
        % Przejscie do kolejnego punktu do stablicowania w wierszu
        currentNode = currentNode + hxHalved;
    end
    
    % Przejscie do kolejnego wiersza punktow do stablicowania
    rowStartNode = rowStartNode + hyHalved;
end


end

