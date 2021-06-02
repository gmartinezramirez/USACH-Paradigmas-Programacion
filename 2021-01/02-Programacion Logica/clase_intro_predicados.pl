% Predicados
% Los hechos se expresan mediante predicados
estudia(juan, paradigmas).
estudia(sebastian, paradigmas).
estudia(benjamin, eda).
enseña(gonzalo, paradigmas).
enseña(jose, eda).

usuario(felipe, socialnetwork).
usuario(bastian, socialnetwork).
usuario(jose, socialnetwork).

% Reglas
% la coma (,) representa un AND
profesor(Persona, Estudiante) :-
    enseña(Persona, Asignatura), estudia(Estudiante, Asignatura).