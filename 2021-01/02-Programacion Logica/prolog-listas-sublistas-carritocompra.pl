%scheme LISP, (listas) lista = (1 2 3 4 5) 
%car lista = 1
%cdr lista = 2,3,4,5
% (1 (2 (3 (4 ( 5))))) = 1,2,3,4,5

% lista en prolog
%[1,2,3,4,5] = [H|T]   H = 1  T=2,3,4,5

%funcion de pertenencia de la lista
perteneceALista(X, [X|_]).
perteneceALista(X, [_|T]):- perteneceALista(X,T).
%perteneceALista(1,[1,2,3,4]).

%head tail
       %head tail

%len lista
size([],0).
size([_|T], N):- size(T, N1), N is N1+1.
%size([1,2,3,4],N).

%TDA
% and es ,
% or es con ;

%capas: constructor, selectores, modificadores y otras funciones.

%puntoCartesiano(x,y)
%dominio: X numero e Y que es numero
puntoCartesiano(X, Y, P):- number(X), number(Y), P=[X,Y].
%puntoCartesiano(1,2,P).

%capa pertenencia
esPuntoCartesiano([X,Y]):- number(X), number(Y).
%esPuntoCartesiano([4,6]).

%capa de selector
getPuntoX([X,Y], X):-esPuntoCartesiano([X,Y]).
%getPuntoX([8,6], X).

%capa de modificador
setPuntoX([X,Y],NewX,[NewX,Y]):- esPuntoCartesiano([X,Y]),number(NewX).

%setPuntoX([1,2],3,[3,Y]).

%setPuntoX([1,2],3,L).
%P =[newX, Y] %esto es solo para la capa de constructor
%setPuntoX([1,2],3,[newX,Y]).


%lista
%add por head: agregar al inicio
%addToBeginning(L,E,newList)

addToBeginning([], E, [E]).
addToBeginning(L, E, [E|L]).
%addToBeginning([1,5,8], 2, L).

%add por tail: agregar al final
addToEnding([], E, [E]).
addToEnding([H|Tail], E, [H|NewTail]):- addToEnding(Tail, E, NewTail).
%addToEnding([2,3,4], 1, L).

%segundo elemento de una lista
getSecondItem([_,T|_], T).
%getSecondItem([1,2,3], E).

%Producto
%nombre(string), precio (numero), cantidad (numero)
%producto([Tipo, Nombre, Precio, Cantidad]).

%agregarProducto([], ["manzana", "producto2", 500, 3])
esListaVacia([], true).
esListaVacia([_|_], false).

%Lab
%Usuario = [User,Pass]
%createUser(User, Pass, [User, Pass])
%username([User|Password], User)
%password([User|Password], Passoword)

%registrar: tener una lista vacia y llenarla?
%register([], User, Pass, [[User,Pass]], L).

%len(a,b,c)
%register(blablabla, L):- L is len

% Carrito de compra es una lista.
% Carrito de compra [productosLacteos, productosFruta, productosVerdura]

% lenCarritoDeCompraCategorias(X;Y;LargoFinal):- len(productosLacteos, L1), len(productosFruta, L2), LargoFinal is L1 + L2

% Carrito con productos
% Tipo, Producto, nombre, precio, cantidad
%1. agregar productos a carrito de compra

%agregar por head (primero), agregar por tail (ultima)

addProductoEnCarrito([Tipo, Nombre, Precio, Cantidad], [], [[Tipo, Nombre, Precio, Cantidad]]).
addProductoEnCarrito([Tipo, Nombre, Precio, Cantidad], [Head|Tail], [[Tipo, Nombre, Precio, Cantidad], [H|T]]).

% insertar solo si no es duplicado
%!
%[1,2,3]  1 = [1,2,3]   no deberia decir 1,2,3,1
%[2,3]  1 = [2,3,1]
insertWithoutDuplicates([], E, [E]).
insertWithoutDuplicates([E|T], E, [E|T]):- !.
insertWithoutDuplicates([H|T], E, [H|NewT]):- insertWithoutDuplicates(T,E,NewT).

%insertWithoutDuplicates([1,2,3], 1, L).

%2. contar el total de productos del carrito de compra
%len de la lista

%cantidad de productos del carrito de compra (lista)
countProducts([], 0).
countProducts([[_,_,_,Cantidad]|Tail], Total):-
       countProducts(Tail,TotalTail), Total is TotalTail + Cantidad.

%countProducts([["Frutas", "Pera", 1000, 1], ["Vegetales", "Lechuga", 13000, 2]]).

% Problema 3: calcular el total a pagar del carrito
% Descomponer en subproblemas
% Subproblema 1: Calcular el total del producto. Total_Producto = Precio * Cantidad
% Subproblema 2: Calcular el total del carrito. sumatoria de todos los Total_producto

%subproblema 1
precioTotalDelProducto([_,_,Precio,Cantidad], TotalProducto):- 
       TotalProducto is Precio * Cantidad.

%subproblem 2
precioTotalDelCarrito([],0).
precioTotalDelCarrito([Producto|Productos],TotalCarrito):-
       precioTotalDelCarrito(Productos, TotalCarrito2),
       precioTotalDelProducto(Producto, TotalProducto), 
       TotalCarrito is TotalCarrito2 + TotalProducto.

%tip: coloquen los hechos al principio y descompongan en problemas

% asumir que tenemos 3 categorias, vegetales, frutas y lacteos
% Carrito 2.0 [ListaVegatales, ListaFrutas, ListaLacteos]   - lista con categorias
% Carrito 1.0 [["Lacteos", "yougurt", precio, cantidad], ["Frutas", "yougurt", precio, cantidad], ["Vegetales", "yougurt", precio, cantidad]]

% Agregar productos en carrito 2.0
% caso base vegetales
% in
%[[], Frutas, Lacteos]
% Elemento a agregar
%["vegetal", Nombre, Precio, Cantidad]
% out 
%[["vegetal", Nombre, Precio, Cantidad], Frutas, Lacteos]
addProductoCategoria([[], Frutas, Lacteos], ["vegetal", Nombre, Precio, Cantidad], [["vegetal", Nombre, Precio, Cantidad], Frutas, Lacteos]).

%fruta
addProductoCategoria([Vegetales, [], Lacteos], ["fruta", Nombre, Precio, Cantidad], [Vegetales, ["frutas", Nombre, Precio, Cantidad], Lacteos]).

%agregar sin duplicados


% Lista del carrito, tamaño del carrito
% subproblema 1: obtener el largo de una lista de productos
% subproblema 2: obtener el largo de todo el carrito (es decir, todas las listas) largoVegetales + largoFrutas + largo Cantidad

% subproblema 1
lenProductos([], 0).
lenProductos([H|T], L):- lenProductos(T, L2), L is L2+1.

% subproblema 2
lenCarrito([Vegetales, Frutas, Lacteos], L):-
       lenProductos(Vegetales, LargoV),
       lenProductos(Frutas, LargoF), 
       lenProductos(Lacteos, LargoL), 
       L is LargoV + LargoF + LargoL. 

% Precio total del carrio
% subproblema 1: obtener el precio total de cada lista, precioVegetal, precioF, precioL
% subproblema 2: obtener el precio total del carrito. PrecioCarrito = PV + PF + PL

%subproblema 1:
precioTotalSublista([],0).
precioTotalSublista([_,_,Precio,Cantidad|Tail], PrecioSublista):-
       PrecioHead is Precio * Cantidad,
       PrecioTotalSublista(Tail, PrecioTail),
       PrecioSublista is PrecioTail + PrecioHead.

% subproblema 2:
precioTotal([Frutas,Verduras,Lacteos], PrecioTotalCarrito):-
       PrecioTotalFrutas is precioTotalSublista(Frutas),
       PrecioTotalVerduras is precioTotalSublista(Verduras),
       PrecioTotalLacteos is precioTotalSublista(Lacteos),
       PrecioTotalCarrito is PrecioTotalFrutas +  PrecioTotalVerduras + PrecioTotalLacteos.