% Skrypt do zadania 33 z tematu 3, obliczajacy calke z funkcji f(x, y)
% na przedziale
% D = {(x, y) \in R^2: |x| + |y| <= 1 }.
% (zatem D - romb o wierzcholkach (1,0), (0,1), (-1,0), (0,-1))
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% Parametry:
% Funkcja podcalkowa
f = @(x, y)(x.^7 + x.^6 + y.^4 + y.^3);
% Liczba okreslajaca ilosc podzialow
n = 16;


% ======================================================================= %


fprintf('Obliczanie calki z funkcji %s (liczba podzialow n = %d)\n\n', func2str(f), n);

% Srodek rombu
P0 = [0 0];
% Wierzcholki rombu
P1 = [1 0];
P2 = [0 1];
P3 = [-1 0];
P4 = [0 -1];

% Kwadratura dla trojkatow w poszczegolnych cwiartkach ukladu wspolrzednych
tic;
S1 = numericalInterpolationTriangle(f, P0, P1, P2, n); % I cwiartka
S2 = numericalInterpolationTriangle(f, P0, P2, P3, n); % II cwiartka
S3 = numericalInterpolationTriangle(f, P0, P3, P4, n); % III cwiartka
S4 = numericalInterpolationTriangle(f, P0, P4, P1, n); % IV cwiartka
customIntegrationTime = toc;

% Sumowanie kwadratur dla poszczegolnych cwiartek
S = S1 + S2 + S3 + S4;

fprintf('Przyblizenie calki kwadratura z zadania: %g\n', S);
fprintf('Czas przyblizania: %f ms\n\n', customIntegrationTime * 1000);


% Porownanie z funkcja integral2 z Matlaba
yMin = @(x)(-1+abs(x));
yMax = @(x)(1-abs(x));
tic;
matlabS = integral2(f, -1, 1, yMin, yMax);
matlabIntegrationTime = toc;

fprintf('Przyblizenie calki funkcja integral2: %g\n', matlabS);
fprintf('Czas przyblizania: %f ms\n\n', matlabIntegrationTime * 1000);


fprintf('Roznica miedzy dwoma przyblizeniami calki: %g\n', abs(S - matlabS));