% producto: nombre X precio
% item: producto X cantidad
% carrito: cantidadItems X precioTotal X listaItems

carritoVacio([0,0,[]]).

producto(Nombre, Precio, [Nombre, Precio]):-
  string(Nombre), number(Precio), Precio>=0.

item(Producto, Cantidad, [Producto, Cantidad]):-
  producto(_, _, Producto), number(Cantidad), Cantidad>=0.

agregaItem(Prod, Cant, LIin, [NewItem|LIin]):-
  item(Prod, Cant, NewItem).

agregaProd([Nm,Pr], Cant, [CI, PT, LItems], [NCI, NPT, NLItems]):-
  NCI is CI+1, NPT is PT+Pr*Cant, producto(Nm, Pr, Prod), agregaItem(Prod, Cant, LItems, NLItems).