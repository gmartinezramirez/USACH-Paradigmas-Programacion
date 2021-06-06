% Recursion

sumatoria_rango(NumeroInicial, NumeroInicial, NumeroInicial).

sumatoria_rango(NumeroInicial, NumeroFinal, Resultado):-
	SiguienteNumero is NumeroInicial + 1,
	sumatoria_rango(SiguienteNumero, NumeroFinal, SumaAcumulada),
	Resultado is NumeroInicial + SumaAcumulada.


% Clausulas de Horn
% Hechos, axiomas, verdades, base de conocimiento, base de datos
fib(0, 0).
fib(1, 1).

fib(Indice, Resultado):-
	Indice > 1,
	Indice1 is Indice-1, Indice2 is Indice-2,
	fib(Indice1, Resultado1), fib(Indice2, Resultado2),
	Resultado is Resultado1 + Resultado2.



%Lista
peopleList([alice, bob, carol, diane, eddy]).
[Head|Tail] = [red, white, black, yellow].
[H1, H2|T] = [red, white, black, yellow].


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

% 2. Largo de una lista
%	len(Lista, Largo) es verdadero si Largo es el número de elementos de una lista.

len( [], 0 ).
len( [_|Resto], Largo ) :-
	len( Resto, LargoAcumulado ),
	Largo is LargoAcumulado + 1.


% 11. Sumatoria de los elementos de una lista 

% Suma de los elementos de una lista
% Consulta: ?- sumarELementos([1,2,10,0], Sum).
% Resultado: Sum = 13

sumarElementos( [],0 ).
sumarElementos( [Cabeza|Resto], Suma ) :- 
    sumarElementos( Resto, SumaParcial ), 
    Suma is Cabeza + SumaParcial.


%% Consultas:
% ?- len([1,2,3,a,b,c], L).
% L=6.
% ?- len([], L).
% L=0.


% 3. Unir dos listas (join)
%	join(L1, L2, L3) es verdadero si L3 es el resultado de unir L1 y L2.

join( [], Lista, Lista ).
join( [CabezaL1|RestoL1], Lista2, [CabezaL1|ListaResultado] ) :-
	join( RestoL1, Lista2, ListaResultado ).

% 7. Insertar un elemento al principio de la lista (insertar por cabeza)

% Caso base: insertar un elemento a una lista vacia
insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).


% 8. Insertar un elemento al final de la lista (insertar por cola)

% Caso base: insertar un elemento a una lista vacia
insertarAlFinal( Elemento, [], [Elemento] ).
insertarAlFinal( Elemento, [Cabeza|Resto], [Cabeza|Lista] ) :-
        insertarAlFinal( Elemento, Resto, Lista ).

% 10. Insertar un elemento a una lista sin duplicados
% Insertar sin duplicados

insertarSinDuplicados( [], Elemento, [Elemento] ).
insertarSinDuplicados( [Elemento|Resto], Elemento, [Elemento|Resto] ) :- !.
insertarSinDuplicados( [Cabeza|Resto], Elemento, [Cabeza|NuevoResto] ):-
	insertarSinDuplicados( Resto, Elemento, NuevoResto ).