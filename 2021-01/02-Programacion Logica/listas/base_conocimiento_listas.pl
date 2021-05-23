% Bases de conocimiento usando listas 

% Estudiantes
% estudiante( id, nombreCompleto([nombre, apellido]), notas([pep1, pep2, pep3, controles]) ).
% ejemplo:
% estudiante( 100, nombreCompleto([peter, griffin]), notas([1, 2, 3, 7]) ).

estudiante( 1, nombreCompleto( [gonzalo, martinez] ), notas( [1, 2, 3, 7] ) ).
estudiante( 2, nombreCompleto( [compadre, moncho] ), notas( [7, 7, 7, 7] ) ).
estudiante( 4, nombreCompleto( [gonzalo, cruise] ), notas( [1, 2, 3, 7] ) ).
estudiante( 5, nombreCompleto( [tom, martinez] ), notas( [4, 4, 4, 7] ) ).
estudiante( 6, nombreCompleto( [frodo, bolson] ), notas( [3, 4, 1, 1] ) ).


% Consultas
% Como le fue a todos los gonzalos en la pep1?
%

% Como le fue a la gente de apellido martinez en la pep2?
%

% Que nota de control tuvo el estudiante con id 6?
%

% Quien tuvo 7 en las nota de control?
%

% Alguien obtuvo un 7 en cualquier nota?
%

% Que estudiante tuvo el mejor promedio?
%

% Cursos
% curso(id, nombre, estudiantes, semestre)
% ejemplo:
% curso(1, "paradigmas de programación", Estudiantes, "01/2021").

curso( 1, "paradigmas de programación", EstudiantesParadigmas, "01/2021" ).
curso( 2, "EDA", EstudiantesEDA, "01/2021" ).
curso( 3, "Metodos", EstudiantesMetodos, "01/2021" ).


% Como inscribir alumnos a un curso?
% inscribir( Estudiante, Curso, ListadoDelCurso )

%inscribir( Estudiante, EstudiantesParadigmas, EstudiantesParadigmasActualizado )

inscribir ( Estudiante, [], [Estudiante] ).
inscribir ( Estudiante, [Cabeza|Resto], [Estudiante|Resto] ).
