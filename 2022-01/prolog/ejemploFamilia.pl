%Dominios
%Rut: Entero
%Nombres,ApPaterno,ApMaterno: String
%Padre,Hijo,Nombre: Symbol

%Predicados
%persona(Rut,Nombres,ApPaterno,ApMaterno).
%padres(Padre,Padre,Hijo).
%hermanos(Nombre,Nombre)

%Metas
%Principal: hermanos
%Secundarias: padres, persona

%Clausulas de Horn
%Hechos o Axiomas
padres(juan,maria,diego).
padres(jose,marta,mariana).
padres(mauricio,mirta,josefa).
padres(juan,maria,martin).
padres(jose,marta,julia).

%Reglas
hermanos(Nombre1,Nombre2):-padres(P1,P2,Nombre1),padres(P1,P2,Nombre2),not(Nombre1=Nombre2).
primos(Nombre1,Nombre2):-not(hermanos(Nombre1,Nombre2)).