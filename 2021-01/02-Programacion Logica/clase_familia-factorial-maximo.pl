hombre(albert). 
hombre(bob). 
hombre(edward).

mujer(alice). 
mujer(victoria).

padre(albert,edward).
padre(victoria,edward).
padre(albert,alice).
padre(victoria,alice).
padre(albert,bob).
padre(victoria,bob).

hijo(Persona):-
    padre(Adulto,Persona),
    hombre(Persona).

sumatoria_rango(NumeroInicial, NumeroInicial, NumeroInicial).

sumatoria_rango(NumeroInicial, NumeroFinal, Resultado):-
	SiguienteNumero is NumeroInicial + 1,
	sumatoria_rango(SiguienteNumero, NumeroFinal, SumaAcumulada),
	Resultado is NumeroInicial + SumaAcumulada.

%sumatoria_rango(1,3,R).

maximo(A, B ,B) :- 
    A < B.

maximo(A, B, A).

%find_just_one_solution(X) :- 
%  candidate_solution(X), test_solution(X), !

maximoConCorte(A,B,B) :- 
    A < B, !.

maximoConCorte(A,B,A).

% Factorial

factorial(0,1) :- !. 

factorial(N,Resultado) :-  
   N>0, 
   NAnterior is N-1, 
   factorial(NAnterior,ResultadoAcumulado), 
   Resultado is N * ResultadoAcumulado.

%factorial(4, R).

%maximo(1,3,R).

% Factorial con recursion de cola
factorialTail(0,F,F). 

factorialTail(N,A,F) :-  
    N > 0, 
    A1 is N*A, 
    N1 is N -1, 
    factorialTail(N1,A1,F). 

% factorialTail(4, 1, R)
% factorialTail(5, 1, R)