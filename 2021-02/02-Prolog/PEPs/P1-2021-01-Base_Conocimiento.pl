% 1.Estudiantes de la carrera de “Ingeniería Civil en Informática”. 
carrera(Codigo,"Ingeniería Civil en Informática"), estudiante(Rut,Nombre,Apellido,Codigo).


% 2. Profesores que dictan clases de la carrera de “Administración de Empresas”
% CC: Codigo Carrera
% CA: Codigo Asignatura
% RP: Rut Profesor
% CA: Codigo Asignatura
% N: Nombre, A: Apellido, Experiencia

carrera(CC,"Administración de Empresas"),
asignatura(CA,_,_,_,CC),
seccion(_,RP,CA,_),
profesor(RP,N,A,E).

% 3. si un estudiante puede inscribir una determinada asignatura considerando los prerrequisitos de ésta.

% CP: 

inscribir(RE,CA) :-
    asignatura(CA,_,_,CP,_),
    seccion(CS,_,CP,_),
    inscripcion(RE,CS),
    calificacion(CS,RE,N),N>=4.

% 4. si dos estudiantes están cursando una misma asignatura (en cualquiera de sus secciones).
% RE: Rut estudiante
% CA: Codigo Asignatura

compañeros(RE1,RE2,CA) :- 
    RE\=RE2,
    seccion(CS,_,_,CA,_),
    inscripcion(RE1,CS),
    inscripcion(RE2,CS).

% 5. el Rut del estudiante cuya calificación sea la más alta en una sección.

mejorNota(CS,RE) :- 
    calificacion(CS,RE,N),
    calificacion(CS,RE2,M),
    RE\=RE2,M>N.

estudianteMejorCalificacion(CS,RE) :-
    calificacion(CS,RE,_),
    not(mejorNota(CS,RE)),
    !.
