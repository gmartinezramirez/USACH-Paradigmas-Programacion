% Predicados
estudia(juan, paradigmas).
enseña(gonzalo, paradigmas).

% Reglas
profesor(X, Y) :-
    enseña(X, C), estudia(Y, C).
