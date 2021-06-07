% archivos.pl corresponden a base de conocimiento que se entregan a prolog
%paradigma logico se basa en el uso logica de primer orden
% and (,), or, si y solo si, entonces, NOT
%clausulas de horn

% hecho, facts
%hecho  (argumentos/objetos) . el punto le indica al interprete cuando terminar de ler  
%nombre del predicado: gusta
gusta(gonzalo,chocolate).
gusta(gonzalo,vainilla).
gusta(catalina,vainilla). 
gusta(fernando,chocolate).
gusta(fernando,"menta").

%gusta(X,chocolate).
%gusta(gonzalo, Y).

estudia(carlos,paradigmas).
enseña(gonzalo,paradigmas).

esProfesor(X,Y):-
    enseña(X,C),estudia(Y,C).


%(b) A cualquiera le gusta programar si es informático 
%(c) ¿A quién le gusta programar? 

%informatico(gonzalo).
%profesion(sujeto, informatico).
%leGustaProgramar(Sujeto):- profesion(Sujeto,informatico).

%cantidadDePersonas(santiago, mucho).
%cantidadDePersonas(maule, poco).

%grande(santiago).
%muchaGente(santiago).
%donaldOdiaCiudad(X):-grande(X),muchaGente(X).