% Fecha
% date(Year, Month, Day).

% Constructor de fecha

makeDate( Y, M , D, fecha( Y, M ,D) ).

% Capa de selectores

getYear( date(Y,_,_), Y ).
getMonth( date(_,M,_), M ).
getDay( date(_,_,D),D) .

% Capa modificadora

setYear( Y, date(_,M,D), date(Y,M,D) ).
setMonth( M, date(Y,_,D), date(Y,M,D) ).
setDay( D, date(Y,M,_), date(Y,M,D) ).

% Otros

next_year( Today,NextYear ):-
	get_year( Today,Y ), 
	NY is Y+1, 
	set_year( NY, Today, NextYear ).

prev_year(Today,PrevYear):-
	get_year(Today, Y), 
	PY is Y-1, 
	set_year(PY, Today, PrevYear).

