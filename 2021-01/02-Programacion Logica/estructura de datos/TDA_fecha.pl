% Constructor del TDA fecha
% 	Una fecha se representa por DD (int) MM (int) AAAA (int)
% 	Sabemos que existe una cantidad fija de dias por meses

% Hecho: mes(numero_mes, cantidad_dias)

mes(1,31).
mes(2,28).
mes(2,29).
mes(3,31).
mes(4,30).
mes(5,31).
mes(6,30).
mes(7,31).
mes(8,31).
mes(9,30).
mes(10,31).
mes(11,30).
mes(12,31).

% Predicado TDA Fecha: Formato: DD-MM-AAAA
fecha(DD,MM,AAAA,[DD,MM,AAAA]) :- 
	integer(DD), integer(MM), integer(AAAA),
	mes(MM,Dias),
	DD>0,
	DD=<Dias.

% Otra opcion:
%	Una fecha se puede representar como: Formato: AAAA-MM-DD
%fecha(AAAA, MM, DD, [AAAA, MM, DD]):-
%    integer(AAAA), integer(MM), integer(DD),
%    DD >= 1, DD =< 31, 
%    MM >= 1, MM =< 12, 
%    AAAA >= 0.

%% Consultas
% Como constructor
% Consulta: fecha(11,10,2001, NuevaFecha).
% NuevaFecha = [11, 10, 2001]

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

% modificarAnio(F1, Y, F2):-
%    fecha(_, M, D, F1), fecha(Y, M, D, F2).