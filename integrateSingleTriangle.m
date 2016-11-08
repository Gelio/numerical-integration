% S = integrateSingleTriangle(f, P0, P1, P2, P) - funkcja obliczajaca calke
% z funkcji f na trojkacie o wierzcholkach P0, P1, P2 i polu P 
% wykorzystujaca kwadrature rzedu 4-tego. Wzor kwadratury zostal podany na
% wykladzie.
%
% Wejscie:
% * f - funkcja podcalkowa (funkcja dwoch zmiennych)
% * P0, P1, P2 - wierzcholki trojkata, na ktorym obliczamy calke (wektory)
% * P - pole trojkata, na ktorym obliczamy calke
%
% Wyjscie:
% * S - obliczona wartosc kwadratury
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function S = integrateSingleTriangle(f, P0, P1, P2, P)
% Obliczenie srodka ciezkosci
P012 = (P0 + P1 + P2) / 3;
% Obliczenie wezlow posrednich (srodki bokow trojkata)
P01 = (P0 + P1) / 2;
P02 = (P0 + P2) / 2;
P12 = (P1 + P2) / 2;


% Sprawdzenie czy funkcja f przyjmuje wektor dwuelementowy, czy dwa skalary
% jako argumenty
vectorF = f;
if nargin(vectorF) == 2
    % Zamiana na funkcje przyjmujaca wektor dwuelementowy.
    vectorF = @(x)(f(x(1), x(2)));
end


% Obliczenie wartosci posrednich (zwieksza czytelnosc kodu)
% Wartosci w srodkach bokow trojkata
means = vectorF(P01) + vectorF(P02) + vectorF(P12);
% Wartosci w wierzcholkach trojkata
vertexes = vectorF(P0) + vectorF(P1) + vectorF(P2);


% Wykorzystanie wzoru kwadratury
S = P / 60   *   (27 * vectorF(P012)  +  3 * vertexes  +  8 * means);

end

