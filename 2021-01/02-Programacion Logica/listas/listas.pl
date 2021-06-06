% Listas

% 1. Pertenece
%	Pertenece(E, L) es verdadero si elemento E pertenece a lista L.

pertenece( Elemento, [Elemento|_] ).
pertenece( Elemento, [_|Resto] ) :-
	pertenece( Elemento, Resto ).

%% Consultas:
% ?- pertenece(a, [1,2,3,a,b,c]).
% true.
% ?- pertenece(z, [1,2,3,a]).
% false.

%% Trace:
% Call: pertenece(a, [1, 2, 3, a, b, c])
% Call: pertenece(a, [2, 3, a, b, c])
% Call: pertenece(a, [3, a, b, c])
% Call: pertenece(a, [a, b, c]) % true
% Exit: pertenece(a, [a, b, c]) % true 
% Exit: pertenece(a, [3, a, b, c]) % backforward
% Exit: pertenece(a, [2, 3, a, b, c])
% Exit: pertenece(a, [1, 2, 3, a, b, c])

obtenerByPosicion( [Cabeza|_], 0, Cabeza ).
obtenerByPosicion( [_|Cabeza], Posicion, Elemento) :- 
	PosicionAnterior is Posicion-1,
	obtenerByPosicion( Cabeza, PosicionAnterior, Elemento ).


% 2. Largo de una lista
%	len(Lista, Largo) es verdadero si Largo es el número de elementos de una lista.

len( [], 0 ).
len( [_|Resto], Largo ) :-
	len( Resto, LargoAcumulado ),
	Largo is LargoAcumulado + 1.

%% Consultas:
% ?- len([1,2,3,a,b,c], L).
% L=6.
% ?- len([], L).
% L=0.

%% Trace:
% Call: len([a, b, c], L)
% Call: len([b, c], L)
% Call: len([c], L)
% Call: len([], L)
% Exit: len([], 0)
% Call: L is 0+1
% Exit: 1 is 0+1
% Exit: len([c], 1)
% Call: L is 1+1
% Exit: 2 is 1+1
% Exit: len([b, c], 2)
% Call: L is 2+1
% Exit: 3 is 2+1
% Exit: len([a, b, c], 3)


% 3. Unir dos listas (join)
%	join(L1, L2, L3) es verdadero si L3 es el resultado de unir L1 y L2.

join( [], Lista, Lista ).
join( [CabezaL1|RestoL1], Lista2, [CabezaL1|ListaResultado] ) :-
	join( RestoL1, Lista2, ListaResultado ).

%% Consultas:
% ?- join([1,2,3], [a,b,c], R).
% R = [1,2,3,a,b,c]
% ?- join([], [a,b,c], R).
% R = [a, b, c]

%% Trace:
%  join([1, 2, 3], [a, b, c], R)
%  Call: join([2, 3], [a, b, c], R)                      % join(RestoL1,Lista2,ListaResultado)
%  Call: join([3], [a, b, c], R)                         % join(RestoL1,Lista2,ListaResultado)
%  Call: join([], [a, b, c], R)                          % join(RestoL1,Lista2,ListaResultado)
%  Exit: join([], [a, b, c], [a, b, c])                  % join( [], Lista, Lista ).
%  Exit: join([3], [a, b, c], [3, a, b, c])              % Ejecuta la regla: join([CabezaL1|RestoL1], Lista2, [CabezaL1|ListaResultado])
%  Exit: join([2, 3], [a, b, c], [2, 3, a, b, c])        % Ejecuta la regla: join([CabezaL1|RestoL1], Lista2, [CabezaL1|ListaResultado])
%  Exit: join([1, 2, 3], [a, b, c], [1, 2, 3, a, b, c])  % Ejecuta la regla: join([CabezaL1|RestoL1], Lista2, [CabezaL1|ListaResultado])

% 4. Eliminar la primera ocurrencia de un elemento E
%	borrarPrimeraOcurrencia(Elemento, Lista, Resultado).
%	R es el resultado de remover la primera ocurrencia (instancia) de E en L.

% Caso base: El elemento a eliminar es la cabeza de la lista
borrarPrimeraOcurrencia( Elemento, [Elemento|Resto], Resto ). 
borrarPrimeraOcurrencia( Elemento, [Cabeza|Resto], [Cabeza|Resultado] ) :-
	Elemento\=Cabeza, % Elemento no es la cabeza de la lista
	borrarPrimeraOcurrencia( Elemento, Resto, Resultado ).

%% Consultas:
% ?- borrarPrimeraOcurrencia(a, [a,b,c,d], R).
% R = [b, c, d]
% ?- borrarPrimeraOcurrencia(c, [a,b,c,d,c,d], R).
% R = [a, b, d, c, d]

%% Trace:
% Call: borrarPrimeraOcurrencia(c, [a, b, c, d, c, d], R)
% Call: c\=a
% Exit: c\=a
% Call: borrarPrimeraOcurrencia(c, [b, c, d, c, d], R)
% Call: c\=b
% Exit: c\=b
% Call: borrarPrimeraOcurrencia(c, [c, d, c, d], R)
% Exit: borrarPrimeraOcurrencia(c, [c, d, c, d], [d, c, d])
% Exit: borrarPrimeraOcurrencia(c, [b, c, d, c, d], [b, d, c, d])
% Exit: borrarPrimeraOcurrencia(c, [a, b, c, d, c, d], [a, b, d, c, d])

% 5. Eliminar *cualquier* ocurrencia de un elemento E
%	borrarCualquierOcurrencia(Elemento, Lista, Resultado).
%	R es el resultado de remover *cualquier* ocurrencia (instancia) de E en L.

% Caso base: El elemento a eliminar es la cabeza de la lista
borrar( Elemento, [Elemento|Resto], Resto ). 
borrar( Elemento, [Cabeza|Resto], [Cabeza|Resultado] ) :-
	borrar( Elemento, Resto, Resultado ).

% Consultas
% ?- borrar(a, [b,a,c,d], R).
% R = [b, c, d]
% ?- borrar(a, [b,a,c,d,a], R).
% R = [b, c, d, a] ; [b, a, c, d]

%% Trace:
% Call: borrar(a, [b, a, c, d, a], R)
% Call: borrar(a, [a, c, d, a], R)
% Exit: borrar(a, [a, c, d, a], [c, d, a])
% Exit: borrar(a, [b, a, c, d, a], [b, c, d, a])


borrarAt( 0, [_], [] ).
borrarAt( 0, [_|Resto], Resto ).
borrarAt( Posicion, [Cabeza|Resto], [Cabeza|NuevoResto] ) :- 
	PosicionAnterior is Posicion-1,
	borrarAt( PosicionAnterior, Resto, NuevoResto ).

% 6. Verifica si una lista es sublista de otra
%	esSublista(Sublista, Lista). verdadero si Sublista es una sublista de Lista.

esSublista( [], _).
esSublista( [Cabeza|Resto], Lista ) :-
	borrar( Cabeza, Lista, ListaActual ),
	esSublista( Resto, ListaActual ).

% Consultas
% ?- esSublista([a], [a,b,c,d]).
% true
% ?- esSublista([b,c], [a,b,c,d]).
% true


% 7. Insertar un elemento al principio de la lista (insertar por cabeza)

% Caso base: insertar un elemento a una lista vacia
insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).


% 8. Insertar un elemento al final de la lista (insertar por cola)

% Caso base: insertar un elemento a una lista vacia
insertarAlFinal( Elemento, [], [Elemento] ).
insertarAlFinal( Elemento, [Cabeza|Resto], [Cabeza|Lista] ) :-
        insertarAlFinal( Elemento, Resto, Lista ).


% 9. Insertar a la lista un elemento de forma ordenada

% Caso base: insertar un elemento a una lista vacia
insertarOrdenado( Elemento, [], [Elemento] ).
insertarOrdenado( Elemento, [Cabeza|Resto], [Elemento, Cabeza|Resto] ) :-
	Elemento =< Cabeza.
insertarOrdenado( Elemento, [Cabeza|Resto], [Cabeza|Resultado] ) :-
	insertarOrdenado( Elemento, Resto, Resultado ).


% 10. Insertar un elemento a una lista sin duplicados
% Insertar sin duplicados

insertarSinDuplicados( [], Elemento, [Elemento] ).
insertarSinDuplicados( [Elemento|Resto], Elemento, [Elemento|Resto] ) :- !.
insertarSinDuplicados( [Cabeza|Resto], Elemento, [Cabeza|NuevoResto] ):-
	insertarSinDuplicados( Resto, Elemento, NuevoResto ).

% 11. Insertar un elemento en cierta posición de una lista

insertarAt( Elemento, 0, [], [Elemento] ).
insertarAt( Elemento, 0, [Cabeza|Resto], [Elemento, Cabeza|Resto] ).
insertarAt( Elemento, Posicion, [Cabeza|Resto], [Cabeza|NuevoResto] ) :- 
	PosicionAnterior is Posicion - 1,
	insertarAt( Elemento, PosicionAnterior, Resto, NuevoResto ).


% 11. Sumatoria de los elementos de una lista 

% Suma de los elementos de una lista
% Consulta: ?- sumarELementos([1,2,10,0], Sum).
% Resultado: Sum = 13

sumarElementos( [],0 ).
sumarElementos( [Cabeza|Resto], Suma ) :- 
    sumarElementos( Resto, SumaParcial ), 
    Suma is Cabeza + SumaParcial.

% 12. Obtener ultimo elemento de una lista

% P01 (*): Find the last element of a list

% my_last(X,L) :- X is the last element of the list L
%    (element,list) (?,?)

% Note: last(?Elem, ?List) is predefined

ultimoElemento( Elemento , [Elemento] ).
ultimoElemento( Elemento , [_|Lista] ) :- 
	ultimoElemento( Elemento, Lista ).

% 13. Reemplazar un elemento de una lista
% reemplazar tambien llamado replace

reemplazar( _, _, [], []).
reemplazar( Antiguo, Reemplazo , [Antiguo|Resto], [Reemplazo|NuevoResto] ):- 
    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).
reemplazar( Antiguo, Reemplazo, [Cabeza|Resto],[Cabeza|NuevoResto] ):- 
    Cabeza \= Antiguo, 
    reemplazar( Antiguo, Reemplazo, Resto, NuevoResto ).

%reemplazar(2, b, [1,2,3,4], NuevaLista).
