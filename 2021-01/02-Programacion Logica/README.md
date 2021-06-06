# Prolog

\+ = 'if unsure or false, assume false'


= opera como unificación
== comparación


    < (less than) - operates on numbers and variables only
    > (greater than) - operates on numbers and variables only
    =< (less than or equal to) - operates on numbers and variables only
    >= (greater than or equal to) - operates on numbers and variables only
    is - the two operands have the same values
    = - the two operands are identical
    =\= - the two operands do not have the same values




Clase 1 Aplicación Conceptos

producto("repollo", 120)
producto("tomate", 250)
producto("limones", 180)

%reglas
% a) Agregar productos
agregarProductos(NOMBRE_PRODUCTO, [], [NOMBRE_PRODUCTO]):- PRODUCTO(NOMBRE_PRODUCTO).
agregarProductos(NOMBRE_PRODUCTO, [H|T], [NOMBRE_PRODUCTO, H|T]):- PRODUCTO(NOMBRE_PRODUCTO).

%b ) remover producto
removerProducto(NOMBRE_PRODUCTO, [NOMBRE_PRODUCTO | T], T).
removerProducto(NOMBRE_PRODUCTO, [H | T], [H|OtraCosa]):- removerProducto(NOMBRE_PRODUCTO, T, OtraCosa).

%c) Asignar precio
asignarPrecio(NOMBRE, PRECIO,[NOMBRE, PRECIO]).



Clase 2 Aplicación Conceptos

%insertar([],ELEM,[ELEM]).
%insertar([Cabeza|Cola],ELEM,[ELEM,Cabeza|Cola]).

%agregarProducto([],PRODUCTO,[PRODUCTO]).
% agregarProducto([PrimerProducto|OtrosProductos],PRODUCTO,[PRODUCTO,PrimerProducto|OtrosProductos]).
%


%Nombre,Precio,Cantidad
%String,Número,Número

%producto(Tipo,Nombre,Precio,Cantidad)
%producto([Tipo,Nombre,Precio,Cantidad]).


%agregarProducto([],["FrutasVegetales","Platano",500,3],R).
%listaProductos([[FrutasVegetales],[Lacteos],[Limpieza]]).


agregaProducto([[],Lacteos,Limpieza],["FrutasVegetales",N,P,C],[[["FrutasVegetales",N,P,C]],Lacteos,Limpieza]).
agregaProducto([FrutasVegetales,[],Limpieza],["Lacteos",N,P,C],[FrutasVegetales,[["Lacteos",N,P,C]],Limpieza]).
agregaProducto([FrutasVegetales,Lacteos,[]],["Limpieza",N,P,C],[FrutasVegetales,Lacteos,[["Limpieza",N,P,C]]]).

agregaProducto([FrutasVegetales,[H|T],Limpieza],["Lacteos",N,P,C],[FrutasVegetales,[["Lacteos",N,P,C],H|T],Limpieza]).
agregaProducto([[H|T],Lacteos,Limpieza],["FrutasVegetales",N,P,C],[[["FrutasVegetales",N,P,C],H|T],Lacteos,Limpieza]).
agregaProducto([FrutasVegetales,Lacteos,[H|T]],["Limpieza",N,P,C],[FrutasVegetales,Lacteos,[["Limpieza",N,P,C],H|T]]).





insertarSinDuplicados([],ELEM,[ELEM]).
insertarSinDuplicados([ELEM|T],ELEM,[ELEM|T]):-!.
insertarSinDuplicados([H|T],ELEM,[H|T2]):-insertarSinDuplicados(T,ELEM,T2).


;Ejemplo de Consulta
,S):-largo(FrutasVerduras,S1),largo(Lacteos,S2),largo(Limpieza,S3),S is S1 + S2 + S3.

totalSublista([],0).
totalSublista([[_,_,P,C]|T],V):-VH is P*C,totalSublista(T,V2),V is V2 + VH.

totalCarrito([FrutasVerduras,Lacteos,Limpieza],T):-T1 is totalSublista(FrutasVerduras),T2 is totalSublista(Lacteos),T3 is totalSublista(Limpieza),T is T1+T2+T3.







%carrito = [  [] , [] , [] ]  = [ ListaFrutasVerduras, ListaLacteos, ListaLimpieza]
%producto = [Tipo, Nombre, Precio, Cantidad]

%Contabilizar todos los elementos en un carrito de compra

cantidadSublista([],0).
cantidadSublista([[_,_,_,C]|Cola],Cantidad):-cantidadSublista(Cola,CantidadCola),Cantidad is C + CantidadCola.

%recordando, esto es el largo de una lista ... ¿similitudes con lo anterior?
%largo([],0).
%largo([_|T],L):-largo(T,L2),L is 1 + L2.

%cantidad total en carrito
cantidadProductosCarrito([ListaFrutasVerduras,ListaLacteos,ListaLimpieza],T):-cantidadSublista(ListaFrutasVerduras,TFV),cantidadSublista(ListaLacteos,TLacteos),cantidadSublista(ListaLimpieza,TLimpieza),T is TFV + TLacteos + TLimpieza.

%total carrito

totalProducto([_,_,P,C],TP):- TP is C*P.

totalSublista([],0).
totalSublista([P|Cola],TS):-totalSublista(Cola,TC),totalProducto(P,TP),TS is TC + TP.

totalCarrito([ListaFrutasVerduras,ListaLacteos,ListaLimpieza],T):-totalSublista(ListaFrutasVerduras,TFV),totalSublista(ListaLacteos,TLacteos),totalSublista(ListaLimpieza,TLimpieza),T is TFV + TLacteos + TLimpieza.





%insertar([],ELEM,[ELEM]).
%insertar([Cabeza|Cola],ELEM,[ELEM,Cabeza|Cola]).

%agregarProducto([],PRODUCTO,[PRODUCTO]).
% agregarProducto([PrimerProducto|OtrosProductos],PRODUCTO,[PRODUCTO,PrimerProducto|OtrosProductos]).
%


%Nombre,Precio,Cantidad
%String,N�mero,N�mero

%producto(Tipo,Nombre,Precio,Cantidad)
%producto([Tipo,Nombre,Precio,Cantidad]).


%agregarProducto([],["FrutasVegetales","Platano",500,3],R).
%listaProductos([[FrutasVegetales],[Lacteos],[Limpieza]]).

agregaProducto([[],Lacteos,Limpieza],["FrutasVegetales",N,P,C],[[["FrutasVegetales",N,P,C]],Lacteos,Limpieza]).
agregaProducto([FrutasVegetales,[],Limpieza],["Lacteos",N,P,C],[FrutasVegetales,[["Lacteos",N,P,C]],Limpieza]).
agregaProducto([FrutasVegetales,Lacteos,[]],["Limpieza",N,P,C],[FrutasVegetales,Lacteos,[["Limpieza",N,P,C]]]).

agregaProducto([FrutasVegetales,[H|T],Limpieza],["Lacteos",N,P,C],[FrutasVegetales,[["Lacteos",N,P,C],H|T],Limpieza]).
agregaProducto([[H|T],Lacteos,Limpieza],["FrutasVegetales",N,P,C],[[["FrutasVegetales",N,P,C],H|T],Lacteos,Limpieza]).
agregaProducto([FrutasVegetales,Lacteos,[H|T]],["Limpieza",N,P,C],[FrutasVegetales,Lacteos,[["Limpieza",N,P,C],H|T]]).


insertarSinDuplicados([],ELEM,[ELEM]).
insertarSinDuplicados([ELEM|T],ELEM,[ELEM|T]):-!.
insertarSinDuplicados([H|T],ELEM,[H|T2]):-insertarSinDuplicados(T,ELEM,T2).

largo([],0).
largo([_|T],L):-largo(T,L2),L is L2 + 1.

sizeCarrito([FrutasVerduras,Lacteos,Limpieza],S):-largo(FrutasVerduras,S1),largo(Lacteos,S2),largo(Limpieza,S3),S is S1 + S2 + S3.

totalSublista([],0).
totalSublista([[_,_,P,C]|T],V):-VH is P*C,totalSublista(T,V2),V is V2 + VH.

totalCarrito([FrutasVerduras,Lacteos,Limpieza],T):-T1 is totalSublista(FrutasVerduras),T2 is totalSublista(Lacteos),T3 is totalSublista(Limpieza),T is T1+T2+T3.