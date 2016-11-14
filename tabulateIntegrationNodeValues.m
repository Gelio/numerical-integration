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

