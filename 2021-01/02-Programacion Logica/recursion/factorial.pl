% factorial(n, Resultado).
% Con recursión natural
factorial(0, 1).
factorial(1, 1).
factorial(N, Result) :- 
	N_menos_uno is N - 1,
	factorial(N_menos_uno, R2),
	Result is N * R2, !.


% Con recursión de cola
factorial_cola(0, ResultTemp, ResultTemp).
factorial_cola(1, ResultTemp, ResultTemp).
factorial_cola(N, ResultTemp, Result):-
	N_menos_uno is N - 1,
	Nvo_ResultTemp is ResultTemp * N,
	factorial_cola(N_menos_uno, Nvo_ResultTemp, Result), !.

factorial2(X, R) :- factorial_cola(X, 1, R).
