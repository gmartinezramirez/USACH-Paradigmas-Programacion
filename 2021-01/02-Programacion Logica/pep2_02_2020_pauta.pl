% Pauta PEP 2 02/2020

%1. 

% Representaciones para implementar TDAs
% Categoria (C:String) ,Titulo (T:String) ,Duracion (D:Entero) ,Clasificación (N:symbol) 
%TituloFull = [C,T,D,N] y Titulo = [T,D,N]
%Catalogo: [ [C1, [[T1,D1,N1] , … , [Tn,Dn,Nn]]], … , [Cm, [[T1,D1,N1] … , [Tp,Dp,Np]]]
%Predicados
%insertaTitulo(TitulosIn,Titulo,TitulosOut).
%addTituloCatalogo(CatalagosIn,TituloFull,CatalagosOut).
%titulosRango(ListaTitulo,Entero,Entero,Tiulo).
%seleccionar(Catalogo,Entero,Entero,TituloFull).
%Metas
%Principal: addTituloCatalogo, removeTituloCatalago, seleccionar
%Secundarias: insertaTitulo, eliminaTitulo, titulosRango

%1a. 

% Categoría (C:String), Titulo (T:String), Duración (D:Entero), Clasificación (N:symbol) 
%Predicados
%insertaTitulo(TitulosIn,Titulo,TitulosOut).
%addTituloCatalogo(CatalogosIn,TituloFull,CatalagosOut)


%insertaTitulo(TitulosIn,Titulo,TitulosOut).
% TitulosIn: Lista de titulos actuales, también puede llamarse: TitulosActuales
% Titulo: Titulo a agregar
% TitulosOut: lista de titulos con el nuevo titulo agregado, también puede llamarse: TitulosActualizados

insertaTitulo([],T,[T]).

insertaTitulo([[T,D,N]|Ts],[T,_,_],[[T,D,N]|Ts]):-!.

insertaTitulo([H|Ts],[T,D,N],[H|T2]):-
	insertaTitulo(Ts,[T,D,N],T2).

addTituloCatalogo([],[C,T,D,N],[[C,[[T,D,N]]]]).

addTituloCatalogo([[C,Ts]|Cs],[C,T,D,N],[[C,Ts2]|Cs]):-
	insertaTitulo(Ts,[T,D,N],Ts2).

addTituloCatalogo([[C2,Ts]|Cs],[C,T,D,N],[[C2,Ts]|Cs2]):-
	addTituloCatalogo(Cs,[C,T,D,N],Cs2).



%1b.

% Categoría (C:String), Titulo (T:String), Duración (D:Entero), Clasificación (N:symbol) 

% Eliminar un titulo
eliminaTitulo( [[T,_,_]|Ts],T,Ts ).

eliminaTitulo( [T2|Ts],T,[T2|Ts2] ):-
	eliminaTitulo( Ts,T,Ts2 ).

% Remover titulo del catalogo
removeTituloCatalago( [[C,[[T,_,_]]]|Cs],C,T,Cs ).

removeTituloCatalogo( [[C,Ts]|Cs],C,T,[[C,Ts2]|Cs] ):-
	eliminaTitulo( Ts,T,Ts2 ).

removeTituloCatalogo( [[C2,Ts]|Cs],C,T,[[C2,Ts]|Cs2] ):-
	removeTituloCatalogo( Cs,C,T,Cs2 ).

%1c.

% Categoria (C:String) ,Titulo (T:String), Duración (D:Entero), Clasificación (N:symbol) 
%titulosRango(ListaTitulo,Entero,Entero,Tiulo).
%seleccionar(Catalogo,Entero,Entero,TituloFull).

titulosRango([[T,D,N]|_],Dmin,Dmax,[T,D,N]):-
	D>=Dmin,
	D=<Dmax.

titulosRango([_|Ts],Dmin,Dmax,T):-
	titulosRango(Ts,Dmin,Dmax,T).

seleccionar([[C,Ts]|_],Dmin,Dmax,[C,T]):-
	titulosRango(Ts,Dmin,Dmax,T).

seleccionar([_|Cs],Dmin,Dmax,Ts):-
	seleccionar(Cs,Dmin,Dmax,Ts).

%1d. 

%Realizar una consulta que permita añadir 4 títulos al catálogo, eliminar 1 de estos y luego seleccionar películas con una duración de entre 30 y 70 minutos.

%addTituloCatalogo(CatalagosIn,TituloFull,CatalagosOut).
%addTituloCatalogo([[C,Ts]|Cs],[C,T,D,N],[[C,Ts2]|Cs])
%removeTituloCatalogo([[C2,Ts]|Cs],C,T,[[C2,Ts]|Cs2])

addTituloCatalogo([],[misterio,peli1,60,te],C2),
addTituloCatalogo(C2,[misterio,peli2,30,21],C3),
addTituloCatalogo(C3,[drama,peli3,50,te],C4),
addTituloCatalogo(C4,[drama,peli4,50,te],C5),
removeTituloCatalogo(C5,misterio,peli2,C6),
seleccionar(C6,40,70,TFull).

