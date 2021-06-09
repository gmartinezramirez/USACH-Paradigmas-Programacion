% Tipo de problemas: GRAFOS
% Los grafos tambien son llamados DAG. Grafico dirigido
% Prolog graph
% Prolog DAG

% Grafo unidireccional.
%  a -1- b -2- e
%   \         /
%   3        3
%    \       /
%     c -2- d -2- f
%            \
%            3
%             \
%              g
%

% nodo(a,b,1).
% nodo(Inicio, Destino, Costo).
% conecta(Inicio, Destino, Costo).

% Pregunta a: Representar el grafo con hechos.
conecta(a, b, 1).
conecta(b, e, 2).
conecta(a, c, 3).
conecta(c, d, 2).
conecta(e, d, 3).
conecta(d, f, 2).
conecta(d, g, 3).

% Pregunta b: ¿hay camino directo entre 2 ciudades?
existeCaminoDirecto(Inicio, Destino) :- 
	conecta(Inicio, Destino, _).

% existeCaminoDirecto(a,b). true
% existeCaminoDirecto(a,c). true
% existeCaminoDirecto(a,d). false
% existeCaminoDirecto(b,d). false

% ExisteUnCamino?

existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Destino, _).

existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Intermedio, _),
	existeUnCamino(Inicio, Intermedio),
    existeUnCamino(Intermedio, Destino).


% existeUnCamino(a, d, Camino).
% Pregunta c: Costo total entre Origen y Destino

%costoTotalDeOrigenADestino(Origen, Destino, CostoTotal).
costoTotalDeOrigenADestino(Origen, Origen, 0) :- !.
costoTotalDeOrigenADestino(Origen, Destino, CostoTotal):-
	conecta(Origen, Intermedio, Costo1), 
	costoTotalDeOrigenADestino(Intermedio, Destino, Costo2),
	CostoTotal is Costo1 + Costo2.

%costoTotalDeOrigenADestino(a, d, CostoTotal).


% Pregunta d: obtener todos los caminos entre punto inicio y punto final, junto con el costo total de este
% encontrarUnCamino entre un Punto Inicio y Punto final, sumando los costos
%encontrarUnCamino(Inicio, Destino, CostoTotal, CaminoEncontrado, []).
%https://www.swi-prolog.org/pldoc/man?predicate=%5C%2B/1

encontrarUnCamino(Inicio, Destino, CostoTotal, [Inicio,Destino], _) :- 
    conecta(Inicio, Destino, CostoTotal).

encontrarUnCamino(Inicio, Destino, CostoTotal, [Inicio|SiguientesPuntos], V) :- 
	\+ member(Inicio, V),
	conecta(Inicio, Z, Costo1),
	encontrarUnCamino(Z, Destino, Costo2, SiguientesPuntos, [Inicio|V]),
	CostoTotal is Costo1 + Costo2.


%encontrarUnCamino(a, d, CostoTotal, CaminoEncontrado, [])
