% Prolog como base de datos

% Hechos

% TDA Estudiante: 
%  Id, Nombre, Rut, Carrera

estudiante(1, gmartinez, "111111-1", "Ing Civil Informatica").
estudiante(2, fernando, "121212-2", "Ing Civil Mecanica").
estudiante(3, carla, "131313-3", "Diseño Grafico").

% TDA Nota Estudiante: 
%  Id Estudiante, Nota, Asignatura

nota_estudiante(1, 7, "Paradigmas de Programacion").
nota_estudiante(1, 2, "Comunicacion").
nota_estudiante(1, 4.2, "Ingles 1").
nota_estudiante(2, 5.7, "Paradigmas de Programacion").
nota_estudiante(2, 3.1, "Machine Learning").
nota_estudiante(2, 1.1, "Data Science").

% Reglas
% Meta principal: Nombre, Nota
% Meta secundaria: Id
findNotaByNombreEstudiante(Nombre, Nota) :-
    estudiante(Id, Nombre, _, _),
    nota_estudiante(Id, Nota, _).


% Consultas:
% findNotaByNombreEstudiante(gmartinez, Nota).
% findNotaByNombreEstudiante(gmartinez, 7).
% findNotaByNombreEstudiante(gmartinez, 1).