% Un cubo mágico sus posiciones en horizontal suman "algo"
% Todas sus horizontales suman "algo"
% Todas sus verticales suman "algo"
% Todas sus diagonales suman "algo"

%cuadrado_magico(A, B, C, D, E, F, G, H, I).

valor_valido(1).
valor_valido(2).
valor_valido(3).
valor_valido(4).
valor_valido(5).
valor_valido(6).
valor_valido(7).
valor_valido(8).
valor_valido(9).

cuadrado_magico(A, B, C, D, E, F, G, H, I) :-
	horizontales_iguales(A, B, C, D, E, F, G, H, I, ALGO),
	verticales_iguales(A, B, C, D, E, F, G, H, I, ALGO),
	diagonales_iguales(A, B, C, D, E, F, G, H, I, ALGO).

horizontales_iguales(A, B, C, D, E, F, G, H, I, ALGO) :-
	valores_validos(A, B, C, D, E, F, G, H, I),
	ALGO is A+B+C,
	ALGO is D+E+F,
	ALGO is G+H+I.

verticales_iguales(A, B, C, D, E, F, G, H, I, ALGO) :-
	valores_validos(A, B, C, D, E, F, G, H, I),
	ALGO is A+D+G,
	ALGO is B+E+H,
	ALGO is C+F+I.

diagonales_iguales(A, B, C, D, E, F, G, H, I, ALGO) :-
	valores_validos(A, B, C, D, E, F, G, H, I),
	ALGO is A+E+I,
	ALGO is C+E+G.
valores_validos(A, B, C, D, E, F, G, H, I):-
	valor_valido(A),valor_valido(B),valor_valido(C),
	valor_valido(D),valor_valido(E),valor_valido(F),
	valor_valido(G),valor_valido(H),valor_valido(I).
