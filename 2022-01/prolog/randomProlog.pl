set_prolog_flag(answer_write_options,[max_depth(0)]).

myRandom(Xn, Xn1):-
	AX is 1103515245 * Xn, % writeln(AX),
	AXC is AX + 12345, % writeln(AXC),
	Xn1 is (AXC mod 2147483647)
	% , writeln(Xn1)
	.


generaListaRandoms(0, _, _, []).

generaListaRandoms(Cont, Xi, Hasta, [PrimerNumero|LR2]):-
	not(Cont = 0),
	myRandom(Xi, Xi1),
	ContMenos1 is Cont -1,
	generaListaRandoms(ContMenos1, Xi1, Hasta, LR2),
	PrimerNumero is Xi1 mod Hasta.

