
% 1) exprese el grafo en la base de conocimientos
trayectoria(i, h, 5).
trayectoria(h, g, 10).
trayectoria(g, f, 5).
trayectoria(f, e, 15).
trayectoria(e, d, 20).
trayectoria(d, c, 3).
trayectoria(c, a, 6).
trayectoria(a, b, 8).
trayectoria(h, a, 80).
trayectoria(j, k, 1).

% 2) Realice un predicado que permita saber si es posible ir de un nodo a otro para cualquier otro grafo con la estructura que definió en la pregunta anterior, debe indicar el costo del camino recorrido.


contains([], _):- !, false.
contains([X|_], X):- !.
contains([_|Y], X):- contains(Y, X).

hayCamino(A, B, PASADOS, C, [B|PASADOS]):- trayectoria(A, B, C), not(contains(PASADOS, B)).
hayCamino(A, B, PASADOS, C, [B|PASADOS]):- trayectoria(B, A, C), not(contains(PASADOS, B)).
hayCamino(A, B, PASADOS, C, PASADOS_FINAL2):-
	trayectoria(A, INTERMEDIO, C_AI),
	not(contains(PASADOS, INTERMEDIO)),
	hayCamino(INTERMEDIO, B, [INTERMEDIO|PASADOS], C_IB, PASADOS_FINAL2),
	C is C_AI + C_IB.
hayCamino(A, B, PASADOS, C, PASADOS_FINAL2):-
	trayectoria(INTERMEDIO, A, C_AI),
	not(contains(PASADOS, INTERMEDIO)),
	hayCamino(INTERMEDIO, B, [INTERMEDIO|PASADOS], C_IB, PASADOS_FINAL2),
	C is C_AI + C_IB.

todosLosCaminos(A, B, TODOS_LOS_RESULTADOS):- findall([C, L], hayCamino(A, B, [A], C, L), TODOS_LOS_RESULTADOS).

caminoMasCortorRec([], COSTO_MENOR, CAMINO_MENOR, COSTO_MENOR, CAMINO_MENOR).
caminoMasCortorRec([[C,CAMINO]|OTROS_CAMINOS], COSTO_MENOR_HASTA_AHORA, CAMINO_MENOR_HASTA_AHORA, RESULT_COSTO, RESULT_CAMINO):-
	COSTO_MENOR_HASTA_AHORA < C,
	caminoMasCortorRec(OTROS_CAMINOS, COSTO_MENOR_HASTA_AHORA, CAMINO_MENOR_HASTA_AHORA, RESULT_COSTO, RESULT_CAMINO).
caminoMasCortorRec([[C,CAMINO]|OTROS_CAMINOS], COSTO_MENOR_HASTA_AHORA, CAMINO_MENOR_HASTA_AHORA, RESULT_COSTO, RESULT_CAMINO):-
	COSTO_MENOR_HASTA_AHORA >= C,
	caminoMasCortorRec(OTROS_CAMINOS, C, CAMINO, RESULT_COSTO, RESULT_CAMINO).

caminoMasCorto(A, B, COSTO_MENOR, CAMINO_MENOR):-
	todosLosCaminos(A, B, [[C|CAMINO]|CAMINO_COSTO_OTROS]),
	caminoMasCortorRec([[C|CAMINO]|CAMINO_COSTO_OTROS], C, CAMINO, COSTO_MENOR, CAMINO_MENOR), !.

