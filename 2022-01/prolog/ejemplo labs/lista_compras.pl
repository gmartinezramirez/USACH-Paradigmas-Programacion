

% Producto = [Nombre, Precio]

producto( Nombre, Precio, [Nombre, Precio] ).


% Caso base: Se agrega un producto a una lista vacia
%            cuando se agrega la cantidad queda en 1
agregarProducto( [Nombre, Precio], [], [[Nombre, Precio, 1]] ).

% Caso: Cuando ya existe el producto en la lista de productos
%       Entonces se aumenta en uno la cantidad actual
agregarProducto( [ Nombre, Precio ], 
                 [ [Nombre, Precio, CantidadActual] | SiguientesProductos], 
                 [ [Nombre, Precio, NuevaCantidad]  | SiguientesProductos] ) :- 
    NuevaCantidad is CantidadActual + 1, !.

% Cuando el producto no existe en la lista actual de productos
% y se agrega a una lista que ya contiene otros productos
agregarProducto( [ Nombre, Precio ],
                 [ [LNombre, LPrecio, LCantidad] | SiguientesProductos ],
                 [ [LNombre, LPrecio, LCantidad] | NuevoProductos] ) :- 
    agregarProducto( [Nombre, Precio], SiguientesProductos, NuevoProductos ).

% agregarProducto(["Pan", 500], [], L).
% agregarProducto(["Pan", 500], [], L), agregarProducto(["Carne", 700], L, NL).

% agregarProducto(["Pan", 500], [], L), agregarProducto(["Carne", 700], L, NL), agregarProducto(["Pan", 500], NL, NNL).

%Call:agregarProducto(["Pan", 500], [], _7238)
% Exit:agregarProducto(["Pan", 500], [], [["Pan", 500, 1]])
% Call:agregarProducto(["Carne", 700], [["Pan", 500, 1]], _7242)
% Call:agregarProducto(["Carne", 700], [], _7652)
% Exit:agregarProducto(["Carne", 700], [], [["Carne", 700, 1]])
% Exit:agregarProducto(["Carne", 700], [["Pan", 500, 1]], [["Pan", 500, 1], ["Carne", 700, 1]])
% Call:agregarProducto(["Pan", 500], [["Pan", 500, 1], ["Carne", 700, 1]], _7246)
% Call:_7728 is 1+1
% Exit:2 is 1+1
% Exit:agregarProducto(["Pan", 500], [["Pan", 500, 1], ["Carne", 700, 1]], [["Pan", 500, 2], ["Carne", 700, 1]])

% Problema lista de compras


% Calcular el total de la lista de compra
% sumaDePrecios(ListaProductos, SumaPrecios).
% Como ejemplo: ["Pan", 500, 2], ["Carne", 700, 1]]

sumaDePrecios( [], 0 ).
sumaDePrecios( [[_, Precio, Cantidad] | RestoProductos], Total ) :- 
	sumaDePrecios( RestoProductos, SumaParcial ), 
	Total is SumaParcial + Precio * Cantidad.

% Consulta
% sumaDePrecios([["Pan", 500, 2], ["Carne", 700, 1]], Suma). 
% 
% Call:sumaDePrecios([["Pan", 500, 2], ["Carne", 700, 1]], _6272)
% Call:sumaDePrecios([["Carne", 700, 1]], _6596)
% Call:sumaDePrecios([], _6598)
% Exit:sumaDePrecios([], 0)
% Call:_6596 is 0+700*1
% Exit:700 is 0+700*1
% Exit:sumaDePrecios([["Carne", 700, 1]], 700)
% Call:_6272 is 700+500*2
% Exit:1700 is 700+500*2
% Exit:sumaDePrecios([["Pan", 500, 2], ["Carne", 700, 1]], 1700)
% Suma = 1700
