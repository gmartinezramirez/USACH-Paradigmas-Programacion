% Sumar elementos de una lista
% sum([1,2,3], T).
% T = 6
sum(List, Total) :- 
    % Acumulador = 0
    sum(List, 0, Total).
% Caso base
sum([], Final, Final). 
sum([Number|Rest], Acc, Final) :-
	PartialSum is Acc + Number, 
    sum(Rest, PartialSum, Final).

% Reverse a list
% rev([1,2,3], L).
% L = [3, 2, 1] 
rev(List, Final) :- 
    rev(List, [], Final).
% Caso base
rev([], Final, Final). 
rev([First|Rest], Reversed, Final) :-
	rev(Rest, [First|Reversed], Final).