
%Hechos
ciudad(toluca).
ciudad(tlaxcala).
ciudad(puebla).
ciudad(df).
ciudad(cancun).
ciudad(cuernavaca).

camino(toluca, tlaxcala, 340).
camino(toluca, puebla, 350).
camino(toluca, cuernavaca, 150).
camino(toluca, df, 100).
camino(puebla, toluca, 350).
camino(puebla, tlaxcala, 20).
camino(df, cuernavaca, 90).
camino(df, toluca, 100).
camino(cuernavaca, df, 90).
camino(cuernavaca, puebla, 100).

% Pregunta b: ¿hay camino directo
% entre 2 ciudades?
camino_directo(A, B) :- 
	camino(A, B, _).

% Pregunta c: ¿cuales ciudades se 
% recorren para llegar de 
% una ciudad a otra?
ruta(A, B, Pasadas, [A, B], KM) :-
	camino(A, B, KM).

ruta(A, B, Pasadas, [A|LCiudades], KM) :-
	camino(A, Intermedia, KM1),
	not(pertenece(Intermedia, Pasadas)),
	ruta(Intermedia, 
		B, 
		[Intermedia|Pasadas],
		LCiudades, KM_REC),
	KM is KM_REC + KM1.

% Pregunta d: ¿cual es el camino mínimo
% para llegar desde la ciudad A a B?
todos_los_caminos(A, B, CAMINOS) :-
	findall([L, KM], ruta(A, B, [A], L, KM), CAMINOS).

%menor_camino(CAMINOS, [EL_MAS_CORTO_HASTA_AHORA, KM_DEL_MAS_CORTO_HASTA_AHORA], [EL_MAS_CORTO_FINAL, KM_DEL_MAS_CORTO_FINAL]).

% Este caso es para evitar que si no hay caminos realmente, no devuelva [_, 10000000]
menor_camino([], [_, 10000000], [_,_]) :- !, false.
% Caso base
menor_camino([], [C, KM], [C, KM]).

menor_camino([[C1,KM1]|CR], [C, KM], R) :-
	KM1 < KM,
	menor_camino(CR, [C1,KM1], R).
	
menor_camino([[C1,KM1]|CR], [C, KM], R) :-
	KM1 >= KM,
	menor_camino(CR, [C, KM], R).

camino_mas_corto(A, B, C, KM) :-
	todos_los_caminos(A, B, CAMINOS),
	menor_camino(CAMINOS, [_, 10000000], [C, KM]), !.

pertenece(X, [X|_]):- !.
pertenece(X, [_|L]):- 
	pertenece(X,L).
