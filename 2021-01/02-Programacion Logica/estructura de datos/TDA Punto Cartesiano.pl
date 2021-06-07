
% Listas
%[1,2,3,4]


isMember(X,[X|_]).
isMember(X,[_|T]) :- isMember(X,T).
%isMember(1,[1,2,3]).

%length of a list
size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.
%  or size([_|T],N) :- size(T,N1), N is N1+1.

%size([1,2,3,4],N).


% obtenerSegundoElemento(L, Elem).

obtenerSegundoElemento([_,B|_], B).
% obtenerSegundoElemento([1,2,3,4,5], Elem).

% como saber si un elemento está en la lista
existeElemento([E], E).
existeElemento([E|_], E) :- !.
existeElemento([_|Cola], E) :- existeElemento(Cola, E).

%existeElemento([1,2,3,4,5], 2).
%agregarAlInicio(L, E, LResultante).

agregarAlInicio([], E, [E]).
agregarAlInicio(L, E, [E|L]).
%agregarAlInicio([1,2,3,4], 5, LResultante).


agregarAlFinal([], E, [E]).
agregarAlFinal([A|Cola], E, [A|NvaCola]) :-
    agregarAlFinal(Cola, E, NvaCola).
    
%agregarAlFinal([1,2,3,4], 5, LResultante).    
% TDA punto cartesiano
%constructor
punto(X, Y, P) :- number(X), number(Y), P = [X, Y].
%punto(2,3,P).
%punto(X, Y, P) :- number(X), number(Y), P = [X, Y].


%punto(1, 2, P) :- number(X), number(Y), P = [X, Y].

%función de pertenencia
esPunto([A, B]) :- number(A), number(B).
%esPunto([1,2]).

%selectores
puntoGetX([A, B], A) :- esPunto([A, B]).
%puntoGetX([1,2], X).

puntoGetY([A, B], B) :- esPunto([A, B]).
%puntoGetY([1,2], X).

%modificadores
puntoSetX([A, B], NvoX, [NvoX, B]) :- esPunto([A, B]), number(NvoX).

puntoSetY([X, Y], newY, [X, newY]) :- esPunto([X, Y]), number(newY).
%puntoSetY([1, 2], 3, [X, 3]).

%punto(2,3,P).
%puntoSetX(punto, 2, [2, B]).
%puntoSetX([1, 2], 3, [newX, B]).

%puntoSetX([1, 2], 3, [3, B]).

%puntoSetX([1, 2], 2).