% Clase listas martes 1 de junio

% caso base: un elemento pertenece a la lista cuando este elemento es la cabeza de la lista
% ES VERDADERO QUE UN ELEMENTO PERTENECE A UNA LISTA SI ESTE ES LA CABEZA DE ELLA
pertenece( Elemento, [Elemento|_] ).
pertenece( Elemento, [_|Resto] ) :-
    pertenece( Elemento, Resto ).

% pertenece(a, [1,2,3,a,b,c]). 
% Exit:pertenece(a, [a, b, c]) TRUE
% Exit:pertenece(a, [3, a, b, c])    TRUE
% Exit:pertenece(a, [2, 3, a, b, c])    TRUE
% Exit:pertenece(a, [1, 2, 3, a, b, c])     TRUE

% Ustedes vean donde va el operador de corte

% Predicado
% Lista de articulos
% [Articulo1, Articulo2, Articulo3, Articulo4]

carrito([a1,a2,a3]).

% Lista de articulos == Lista de numeros == Lista de strings == Listas elementos

% Articulo. Nombre y Precio
articulo([nombre1,precio1]).
articuloV2(nombre,precio).   % functor

% Obtener el largo de la lista de compra

% caso base: 
% ES VERDADERO QUE EL LARGO DE UNA LISTA SIN ELEMENTOS, ES 0
largo( [], 0).
largo( [_|Resto], Largo) :-
    largo( Resto, LargoAcumulado),
    Largo is LargoAcumulado + 1.
    
%largo ([1,2,3,4], L).
% largo ([2,3,4], LargoAcumulado) -- pendiente 1
% largo ([3,4], LargoAcumulado) -- pendiente 2
% largo ([4], LargoAcumulado) -- pendiente 3
% largo ([], LargoAcumulado) = largo( [], 0) -- este no
% largo ( [], 0) 
% Largo is 0 + 1 = 1
% Resolver estado pendiente 3: Largo is 1 + 1 = 2
% Resolver estado pendiente 2: Largo is 2 + 1 = 3
% Resolver estado pendiente 1: Largo is 3 + 1 = 4
% 
% largo ([1,2,3,4], L)  =  ([1,2,3,4], 4).
% L=4
% Entonces Largo = 4
% largo([E], 1).


% P2. Insertar un articulo a una lista
% Insertar un elemento a una lista

% Por cabeza (insertar al principio de la lista)
% caso base: insertar a una lista vacia
insertarPorCabeza( Elemento, [], [Elemento]).
% insertarPorCabeza(4, [a,b,c], L).
% insertarPorCabeza(4, [a,b,c], [H|T]).
insertarPorCabeza( Elemento, Lista, [Elemento|Lista] ).

% Insertar por cola (tail), insertar al final de la lista

insertarAlFinal( Elemento, [], [Elemento]).
%insertarPorCabeza(4, [a,b,c], L).  L =[a,b,c,4]
%                   
insertarAlFinal( Elemento, [Cabeza|Resto], [Cabeza|NuevaLista]) :-
    insertarAlFinal(Elemento, Resto, NuevaLista).


%insertar
% insertarPorCabeza(4, [a, b, c], [4, a, b, c]) = insertarPorCabeza(4, [a,b,c], L))
% [4, a, b, c]


