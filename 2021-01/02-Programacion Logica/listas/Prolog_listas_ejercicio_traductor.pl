%Listas
%[1,2,3,4,5]
%Scheme: (1 2 3)
%car: 1    HEAD
%cdr: 2 3  TAIL
%  Prolog: [X | Y]  = [Head|Tail]
% | operador pipe

lista([H|T], H, T).
%lista([a,b,c], X, Y).

% X es un elemento de una lista cuyo primer elemento (HEAD) es X
%elemento(X,[X|R]).
% X es un elemento de una lista cuya cola es R si X es elemento de R
%elemento(X,[Y|R]):- elemento(X,R).

elemento(X,[X|_]).
elemento(X,[_|R]):- elemento(X,R).
%elemento(2,[1,2,3]).
%elemento(X,[1,2,3]).

%Ultimo elemento de una lista
%Ejemplo: ?- ultimo(X,[a,b,c,d]).
%(1 (2 (3 (4 (5 (6))))))
%ultimo elemento de una lista cuando llego a un elemento que tiene cabeza y es el mismo elemento, PERO NO TENGO cola

ultimo(X,[X]).
ultimo(X,[_|T]):- ultimo(X,T).

%Encontrar el numero de elementos de una lista
%len([],0)
%len([_],1)
%len([_,_],2)
%len([_,_,_],3)

%suma(A,B,Resultado):-Resultado is A+B.

%TODO: revisar que sucede
largoLista([_|Cola],Largo):- largoLista(Cola, LargoCola), Largo is LargoCola + 1.

%largoLista([1,2,3],N).

%problema 2
traduccion(eins,uno). 
traduccion(zwei,dos). 
traduccion(drei,tres). 
traduccion(vier,cuatro).
traduccion(fuenf,cinco). 
traduccion(sechs,seis). 
traduccion(sieben,siete).
traduccion(acht,ocho). 
traduccion(neun,nueve). 

% listaTraduccion([eins,neun,zwei],X)

%TA= Traduccion aleman, TAs = El resto de la traduccion, que es la cola
listaTraduccion([TA],[TE]):-traduccion(TA,TE).

listaTraduccion([TA|TAs], [TE|TEs]):-
    traduccion(TA,TE), listaTraduccion(TAs, TEs).