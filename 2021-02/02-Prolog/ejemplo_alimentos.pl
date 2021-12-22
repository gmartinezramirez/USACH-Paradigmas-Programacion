alimento_contiene("papas fritas", "grasas saturadas", "tiene").
alimento_contiene("tocino", "grasas saturadas", "tiene").
alimento_contiene("arroz", "grasas saturadas", "no tiene").
alimento_contiene("puré de papas", "grasas saturadas", "no tiene").
alimento_contiene("tomate", "grasas saturadas", "no tiene").
alimento_contiene("lechuga", "grasas saturadas", "no tiene").
alimento_contiene("pescado frito", "grasas saturadas", "tiene").
alimento_contiene("carne frita", "grasas saturadas", "tiene").
alimento_contiene("carne asada", "grasas saturadas", "tiene").



alimento_contiene("papas fritas", "sal", "tiene mucho").
alimento_contiene("tocino", "sal", "tiene mucho").
alimento_contiene("arroz", "sal", "tiene poco").
alimento_contiene("puré de papas", "sal", "tiene poco").
alimento_contiene("tomate", "sal", "no tiene").
alimento_contiene("lechuga", "sal", "no tiene").
alimento_contiene("pescado frito", "sal", "tiene poco").
alimento_contiene("carne frita", "sal", "tiene poco").
alimento_contiene("carne asada", "sal", "tiene poco").


alimento_contiene("papas fritas", "calorias", "tiene mucho").
alimento_contiene("tocino", "calorias", "tiene mucho").
alimento_contiene("arroz", "calorias", "tiene poco").
alimento_contiene("puré de papas", "calorias", "tiene poco").
alimento_contiene("tomate", "calorias", "no tiene").
alimento_contiene("lechuga", "calorias", "no tiene").
alimento_contiene("pescado frito", "calorias", "tiene poco").
alimento_contiene("carne frita", "calorias", "tiene media").
alimento_contiene("carne asada", "calorias", "tiene media").


cuantificar_alimento("no tiene", 0).
cuantificar_alimento("tiene", 1).
cuantificar_alimento("tiene poco", 1).
cuantificar_alimento("tiene media", 2).
cuantificar_alimento("tiene mucho", 3).

% Cada plato es una lista de 3 alimentos. Ejemplo:
% ["lechuga", "arroz", "carne asada"]

% Otra forma es decir que un plato es una relación en prolog:
%Ejemplo: plato("lechuga", "arroz", "carne asada").

plato(X, Y, Z) :-
	alimento_contiene(X, _, _),
	alimento_contiene(Y, _, _),
	alimento_contiene(Z, _, _),
	X \= Y,
	X \= Z,
	Y \= Z.

saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "no tiene"),
	alimento_contiene(X, "sal", "tiene poco"),
	alimento_contiene(X, "calorias", "tiene poco").
	
saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "no tiene"),
	alimento_contiene(X, "sal", "no tiene"),
	alimento_contiene(X, "calorias", "no tiene").
	
saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "no tiene"),
	alimento_contiene(X, "sal", "tiene poco"),
	alimento_contiene(X, "calorias", "no tiene").
	
saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "no tiene"),
	alimento_contiene(X, "sal", "no tiene"),
	alimento_contiene(X, "calorias", "tiene poco").
	
medio_saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "no tiene"),
	(	alimento_contiene(X, "sal", "tiene media") ;
		alimento_contiene(X, "sal", "tiene poco") ;
		alimento_contiene(X, "sal", "no tiene")
	),
	(	alimento_contiene(X, "calorias", "tiene media") ;
		alimento_contiene(X, "calorias", "tiene poco") ;
		alimento_contiene(X, "calorias", "no tiene")
	).
	
no_saludable(X) :- 
	alimento_contiene(X, "grasas saturadas", "tiene"),
	alimento_contiene(X, "sal", "tiene mucho"),
	alimento_contiene(X, "calorias", "tiene mucho").

plato_saludable(X, Y, Z) :-
	plato(X, Y, Z),
	saludable(X),
	saludable(Y),
	saludable(Z).

plato_medio_saludable(X, Y, Z) :-
	plato(X, Y, Z),
	(saludable(X); saludable(Y); saludable(Z)),
	((medio_saludable(X), medio_saludable(Y)); (medio_saludable(X), medio_saludable(Z));
	(medio_saludable(Y), medio_saludable(Y))).

plato_no_saludable(X, Y, Z) :- 
	plato(X, Y, Z),
	no_saludable(X),
	no_saludable(Y),
	no_saludable(Z).
