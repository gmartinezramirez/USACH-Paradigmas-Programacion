% Sistema de preguntas y respuestas (Question and Answers, Q&A)
% 	Usuarios preguntan
% 	Usuarios responden
% 	Preguntas
% 	Respuestas
%
% Q&A: [Nombre, FechaCreacion, Usuarios, Preguntas, Respuestas]
% Usuario:   [ID: int,  UserName: string,  Password: string]
% Pregunta:  [ID: int,  UserName: string,  Pregunta:string]
% Respuesta: [ID: int,  IDPregunta: int,   Username: string, Respuesta: string]


% Metas secundarias
% Se encuentran implementadas de forma nativa en prolog, pueden usarlas en su laboratorio

exists(Elem,[Elem|_]):-!.
exists(Elem,[_|T]):- exists(Elem,T).

find([],_,_):-!,false.
find([Elem|_],Elem,Elem):-!.
find([_|T],Elem,F):- find(T,Elem,F).

appendList([],L2,L2).
appendList([H|T],L2,[H|T2]):- appendList(T,L2,T2).

lengthList([],0).
lengthList([_|T],Length):- lengthList(T,TL), Length is TL + 1.

replace(_,_,[],[]).
replace(O,R,[O|T],[R|T2]):- replace(O,R,T,T2).
replace(O,R,[H|T],[H|T2]):- H \= O, replace(O,R,T,T2).

% ------------------  TDA Fecha (date)  ------------------

date(Day, Month, Year, [Day,Month,Year]).


% ------------------  TDA Stack  ------------------

stack(LoggedUser, Users, Questions, Answers, [LoggedUser, Users, Questions, Answers]).

% Creción de un stack vacío:
% stack( [], [], [], [], S1).
% S1 = [[], [], [], []]

% Creación de un stack con preguntas ya almacenadas
% stack( [], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]],[], S2).
% S2 = [[], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]], []]


% ------------------  TDA User  ------------------


user( Username, Password, Reputation, [Username, Password, Reputation]).

% Creación de usuario
%user("MyUsername","MyPassword", 10, User1).
% User1 = ["MyUsername", "MyPassword", 10]


% ------------------  Registro de usuarios  ------------------

% addRegisteredUser(UsersIn, Username, Password, UsersOut).
addRegisteredUser( CurrentUsers, Username, _ ,_) :- 
	exists( [Username, _], CurrentUsers ), % Si existe el Username en la lista ActualUsers, significa que el usuario ya existe
	false.

addRegisteredUser( [CurrentUser|CurrentUsers], Username, Password, UpdatedUsers):- 
	user( Username, Password, 0, NewUser ), % Se crea un usuario con reputación 0. User = [Username, Password, 0].
	appendList( [NewUser, CurrentUser], CurrentUsers, UpdatedUsers ).

registerUserInStack( [_,[],_,_], Username, Password, UpdatedStack) :- 
	stack( [], [[Username,Password,0]] , [], [], UpdatedStack).

registerUserInStack( CurrentStack, Username, Password, UpdatedStack):-
	stack( _, CurrentUsers, _, _, CurrentStack ),
	addRegisteredUser( CurrentUsers, Username, Password, UpdatedUsers ),
	stack( _, _, CurrentQuestions, _, CurrentStack ),
	stack( _, _, _, CurrentAnswers, CurrentStack ),
	stack( [], UpdatedUsers, CurrentQuestions, CurrentAnswers, UpdatedStack ).

/*
* Registro exitoso de un nuevo usuario
* Primero creo un stack vacio
 	stack([],[],[],[], S1),
* Luego agrego un nuevo usuario al stack
 stackRegister(S1,"MyUsername1","MyPassword1",S2).
* Finalmente, la consulta para registrar exitosamente un nuevo usuario es:
stack([],[],[],[], S1),
registerUserInStack(S1,"MyUsername1","MyPassword1",S2).
* Por unificación queda S1 (stack 1) como:
S1 = [[], [], [], []]
* Por unificación queda S2 (stack 2) como:
S2 = [[], [["MyUsername1", "MyPassword1", 0]], [], []]
*/

% ------------------  Login de usuario  ------------------

validateLogin(CurrentUsers, Username, Password):- 
    exists([Username, Password, _], CurrentUsers),
    true.

loginUserInStack(CurrentStack, Username, Password, UpdatedStack):-
	stack( _, CurrentUsers, _, _, CurrentStack),
	validateLogin(CurrentUsers, Username, Password ),
	stack( _, _, CurrentQuestions, _, CurrentStack ),
	stack( _, _, _, CurrentAnswers, CurrentStack ),
	stack( [Username], CurrentUsers, CurrentQuestions, CurrentAnswers, UpdatedStack ).

/*
* Login exitoso de usuario previamente registrado en el sistema
stack([],[["MyUsername1","MyPassword1",0],["MyUsername2","MyPassword2"]],[],[], SL1),
loginUserInStack(SL1,"MyUsername1","MyPassword1",SL2).

SL1 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2"]], [], []]
SL2 = [["MyUsername1"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2"]], [], []]
*/