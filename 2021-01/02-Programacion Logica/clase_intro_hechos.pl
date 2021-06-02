
% hechos
% V and V = V
% V and F = F

% Base de conocimiento:
% Todas las personas que yo se que comen sopaipillas
% relacion(argumento/objeto, argumento/objeto) % aridad 2
% comer(persona, comida).

% Cuando texto aparece con la primera letra en mayuscula es una VARIABLE INCOGNITA
% Cuando texto aparece con la primera letra en minuscula es un ARGUMENTO (ATOMO)
come(gonzalo, sopaipilla).
come(bastian, sopaipilla).
come(benjamin, completo).
come(fabrizio, hamburguesa_doble).
come(fabrizio, completo).
% come(porotos, jose).
come(persona, sopaipilla).

nota(jose, paradigmas, 7).
nota(jose, eda, 4).
nota(ricardo, paradigmas, 7).

% Quienes son los estudiantes que han tenido un 7 paradigmas?
%nota(Estudiante, paradigmas, 7).


% Quienes son los estudiantes que han tenido un 7 y en que ramo lo han obtenido?
%nota(Estudiante, Asignatura, 7).

suma(2,2,4).

