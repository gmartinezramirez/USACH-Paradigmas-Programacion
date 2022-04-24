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

% Representar el grafo con hechos.
conecta(a, b, 1).
conecta(b, e, 2).
conecta(a, c, 3).
conecta(c, d, 2).
conecta(e, d, 3).
conecta(d, f, 2).
conecta(d, g, 3).

% Consulta: ¿hay camino directo entre 2 ciudades?
existeCaminoDirecto(Inicio, Destino) :- 
	conecta(Inicio, Destino, _).

% existeCaminoDirecto(a,b). true
% existeCaminoDirecto(a,c). true
% existeCaminoDirecto(a,d). false
% existeCaminoDirecto(b,d). false

% Consulta: existe un camino entre un punto Inicio y un punto Destino?
existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Destino, _).

existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Intermedio, _),
	existeUnCamino(Inicio, Intermedio),
    existeUnCamino(Intermedio, Destino).


% existeUnCamino(a, d, Camino).

% Consulta: cual es el costo total entre un nodo origen y un destino

%costoCamino(Origen, Destino, CostoTotal).
costoCamino(Inicio, Inicio, 0) :- !.
costoCamino(Inicio, Destino, CostoTotal):-
	conecta(Inicio, Intermedio, CostoInicioAIntermedio), 
	costoCamino(Intermedio, Destino, CostoIntermedioADestino),
	CostoTotal is CostoInicioAIntermedio + CostoIntermedioADestino.

%costoTotalDeOrigenADestino(a, d, CostoTotal).


% consulta: obtener todos los caminos entre punto inicio y punto final, junto con el costo total de este
% obtener camino entre un Punto Inicio y Punto final, sumando los costos
%encontrarUnCamino(Inicio, Destino, CostoTotal, CaminoEncontrado, []).
%https://www.swi-prolog.org/pldoc/man?predicate=%5C%2B/1

obtenerCamino(Inicio, Destino, CostoTotal, [Inicio,Destino], _) :- 
    conecta(Inicio, Destino, CostoTotal).

obtenerCamino(Inicio, Destino, CostoTotal, [Inicio|SiguientesPuntos], V) :- 
	\+ member(Inicio, V),
	conecta(Inicio, Z, Costo1),
	obtenerCamino(Z, Destino, Costo2, SiguientesPuntos, [Inicio|V]),
	CostoTotal is Costo1 + Costo2.


%encontrarUnCamino(a, d, CostoTotal, CaminoEncontrado, [])


%1)
transicion(a,b,50).
transicion(a,c,75).
transicion(b,c,15).
transicion(b,y,60).
transicion(c,y,85).
transicion(b,x,35).
transicion(y,x,25).
transicion(x,z,40).
transicion(y,z,10).

%2)
% Implementar un predicado verificar(Origen, Destino, Costo) que permita consultar si se puede ir de un estado a otro, 
% o bien, a qué estado se puede llegar dado un costo determinado.

verificar(Origen, Origen, 0).
verificar(Origen, Destino, Costo) :-
	transicion(Origen, X, Y), 
	C2 is (Costo - Y), 
	verificar(X, Destino, C2).

%3.1)
% Implementar un predicado camino(Origen, Destino, Intermedio, Costo) que calcule el costo total de todos los posibles caminos
% que conectan a dos estados, pero pasando por un punto intermedio (no necesariamente tienen que ser contiguos el origen,
% destino y el punto intermedio)

camino(Origen, Origen, Intermedio, 0).
camino(Origen, Destino, O, CostoTotal) :-
	transicion(Origen, X1, C1), 
	camino(X1, Destino, Origen, C2), 
	CostoTotal is C1 + C2.
camino(Origen, Destino, Intermedio, CostoTotal) :-
	transicion(Origen, X1, C1), 
	camino(X1, Destino, Intermedio, C2), 
	CostoTotal is C1 + C2.

%3.2)
camino(Origen, Destino, Intermedio, CostoTotal) :-
	verificar(Origen, Intermedio, C1), 
	verificar(Intermedio, Destino, C2),
	CostoTotal is C1 + C2.

%4)
% Implementar un predicado estadosIntermedios(Origen, Destino, Costo) que retorne una lista con todos los estados
% intermedios de los posibles caminos que conectan a dos estados (no necesariamente tienen que ser contiguos)
estadosIntermedios(O, D, L) :-
	transicion(O, D, _), 
	L = [].
estadosIntermedios(O, D, L) :-
	transicion(O, X, _), 
	X \= D, 
	estadosIntermedios(X, D, L2),
	\+(member(L2, X)),
	append([X], L2, L).
