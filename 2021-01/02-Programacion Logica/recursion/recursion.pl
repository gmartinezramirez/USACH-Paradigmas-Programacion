% Recursion


%% Sumar números que se encuentran en un rango

%%% sumatoria_rango(A, B, Result):
%%%		Retorna verdadero (true) si la suma de todos los enteros
%%% 	dentro del rango [A, B] es Result

% Clausulas

sumatoria_rango(NumeroInicial, NumeroInicial, NumeroInicial).

sumatoria_rango(NumeroInicial, NumeroFinal, Resultado):-
	SiguienteNumero is NumeroInicial + 1,
	sumatoria_rango(SiguienteNumero, NumeroFinal, SumaAcumulada),
	Resultado is NumeroInicial + SumaAcumulada.

% Consultas (query)
% ?- sumatoria_rango(1,5,R).
% R = 15
% ?- sumatoria_rango(1,5,R).
% R = 1265
% ?- sumatoria_rango(-5,3,R).
% R = -9

%% Secuencia Fibonacci

%%% La secuencia Fibonacci se define como:
%%% fib(n) = fib(n-1) + fib(n-2) donde fib(0)=1 and fib(1)=1

% Primero se debe definir los casos base y expresar el problema en términos lógicos
% La secuencia Fibonacci se puede expresar de la siguiente forma:
% fib(Indice, Resultado) es fib(Indice-1, Resultado1) y fib(Indice-2, Resultado2) 
% donde Resultado = Resultado1 + Resultado2.

% En este punto,
% Resultado = Resultado1 + Resultado2 es lo mismo que decir: 
% fib(n) = fib(n-1) + fib(n-2)

% Clausulas de Horn
% Hechos, axiomas, verdades, base de conocimiento, base de datos
fib(0, 0).
fib(1, 1).

fib(Indice, Resultado):-
	Indice > 1,
	Indice1 is Indice-1, Indice2 is Indice-2,
	fib(Indice1, Resultado1), fib(Indice2, Resultado2),
	Resultado is Resultado1 + Resultado2.

% Consultas (query)
% ?- fib(2,R).
% R = 1
% ?- fib(3,R).
% R = 2
% ?- fib(4,R).
% R = 3
% ?- fib(8,R).
% R = 21

%% Función de Ackermann

ackermann( 0,N,X ) :- 
	X is N+1.
ackermann( M, 0, X ) :-
	M > 0, 
	M1 is M-1,
	ackermann( M1, 1, X ).
ackermann( M, N, X ) :- 
	M > 0, N > 0, 
	M1 is M-1, N1 is N-1, 
	ackermann( M, N1, X1 ), ackermann( M1, X1, X ).

% Factorial

% Factorial recursion por cola

factorialTailRecursion( N, R ) :- 
	factorialTailRecursion( N, 1, R ).
factorialTailRecursion( 0, R, R ) :- !.
factorialTailRecursion( N, Acc, R ) :-
    NewN is N - 1,
    NewAcc is Acc * N,
    factorialTailRecursion(NewN, NewAcc, R).
