% TDA Fecha
% Formato: YYYY-MM-DD


% Predicado TDA fecha
fecha(YYYY, MM, DD, [YYYY, MM, DD]):-
    integer(YYYY), integer(MM), integer(DD),
    DD >= 1, DD =< 31, MM >= 1, MM =< 12, YYYY >= 0.

% Sin verificaciones
fecha(YYYY, MM, DD, [YYYY, MM, DD]).

% Como constructor
% fecha(2021, 6, 21, F).
% fecha(2021, 2, 32, F).

% Como pertenencia
% fecha(_, _, _, [2021, 6, 21]).
% fecha(_, _, _, "Hola mundo!").

% Como selector
% fecha(Y, _, _, [2021, 6, 21]).
% fecha(_, M, D, [2021, 6, 21]).

% Como modificador
% fecha(2020, 6, 21, F2).

% Consulta:
% fecha(2020, 6, 21, F1), modificarAnio(F1, 1990, F2).

% F1 = [2020, 6, 21],
% F2 = [1990, 6, 21]

modificarAnio(F1, Y, F2):-
    fecha(_, M, D, F1), 
    fecha(Y, M, D, F2).