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

stack( LoggedUser, Users, Questions, Answers, 
	[ LoggedUser, Users, Questions, Answers ]).

% Creción de un stack vacío:
% stack( [], [], [], [], S1).
% S1 = [[], [], [], []]

% Creación de un stack con preguntas ya almacenadas
% stack( [], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]],[], S2).
% S2 = [[], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]], []]


% ------------------  TDA User  ------------------

user( Username, Password, Reputation, 
	[ Username, Password, Reputation ]).

% Creación de usuario
%user("MyUsername","MyPassword", 10, User1).
% User1 = ["MyUsername", "MyPassword", 10]


% ------------------  TDA Question (pregunta)  ------------------

question( Id, Author, Date, Text, Votes, Status, Labels,
		[ Id, Author, Date, Text, Votes, Status, Labels ]).

%question(1, "MyUsername1", "2020-12-02", "¿Cómo funciona Prolog?", 10, "abierta", ["prolog", "logic programming"], NewQuestion).
% NewQuestion = [1, "MyUsername1", "2020-12-02", "¿Cómo funciona Prolog?", 10, "abierta", ["prolog", "logic programming"]]


% ------------------  TDA Answer (respuesta)  ------------------

answer( Id, QuestionId, Author, Date, Text, Votes, AcceptStatus, Labels,
	[ Id, QuestionId, Author, Date, Text, Votes, AcceptStatus, Labels ]).

%answer(1,1,"MyUsername1","2021-06-12","Ni idea de Prolog, pero es sabroson",-10,"abierta",["prolog", "logic programming", "sabroson"], NewAnswerToQuestionId1).
% NewAnswerToQuestionId1 = [1, 1, "MyUsername1", "2021-06-12", "Ni idea de Prolog, pero es sabroson", -10, "abierta", ["prolog", "logic programming", "sabroson"]]


% ------------------  Registro de usuarios  ------------------

% addRegisteredUser(UsersIn, Username, Password, UsersOut).
addRegisteredUser( CurrentUsers, Username, _ ,_) :- 
	exists( [Username, _], CurrentUsers ), % Si existe el Username en la lista ActualUsers, significa que el usuario ya existe
	false.

addRegisteredUser( [CurrentUser|NextCurrentUsers], Username, Password, UpdatedUsers):- 
	user( Username, Password, 0, NewUser ), % Se crea un usuario con reputación 0. User = [Username, Password, 0].
	appendList( [NewUser, CurrentUser], NextCurrentUsers, UpdatedUsers ).

registerUserInStack( [_,[],_,_], Username, Password, UpdatedStack) :- 
	stack( [], [[Username,Password,0]] , [], [], UpdatedStack).

registerUserInStack( CurrentStack, Username, Password, UpdatedStack) :-
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

validateLogin(CurrentUsers, Username, Password) :- 
	exists([Username, Password, _], CurrentUsers),
	true.

loginUserInStack(CurrentStack, Username, Password, UpdatedStack) :-
	stack( _, CurrentUsers, _, _, CurrentStack),
	validateLogin(CurrentUsers, Username, Password ),
	stack( _, _, CurrentQuestions, _, CurrentStack ),
	stack( _, _, _, CurrentAnswers, CurrentStack ),
	stack( [Username], CurrentUsers, CurrentQuestions, CurrentAnswers, UpdatedStack ).


% ------------------  Agregar una pregunta al stack  ------------------
/* TDA Question: [Id, Author, Date, Text, Votes, Status, Labels]).
 * 
 * Por defecto: 
 * 	Una nueva pregunta se agrega con el estado "abierta" (estado="abierta")
 * 	Una nueva pregunta se agrega con 0 votos (votos=0)
 * Meta primaria:
 * 	ask(CurrentStack, Fecha, TextoPregunta, ListaEtiquetas, UpdatedStack).
 * Metas secundarias: 
 * 	addQuestion (CurrentQuestions, Author, Date, Text, Labels, UpdatedQuestions).  
 *  validateQuestionId(CurrentQuestions, QuestionId).
 * 
*/

setNewQuestionId(Question, NewId):- 
	question(Id, _ , _, _, _, _, _, Question),
	NewId is Id + 1.

% Si es la primera pregunta agregada, entonces tiene Id=1
addQuestion( [],[Author|_], Date, Text, Labels, [NewQuestion] ) :- 
	question( 1, Author, Date, Text, 0, "abierta", Labels, NewQuestion ).

addQuestion( [CurrentQuestion|NextCurrentQuestions], [Author|_], 
			Date, Text, Labels, UpdatedQuestions ):-
	setNewQuestionId( CurrentQuestion, NewId ),
	question( NewId, Author, Date, Text, 0, "abierta", Labels, NewQuestion ), % Pregunta se agrega con 0 votos
	appendList( [NewQuestion],[CurrentQuestion|NextCurrentQuestions], 
				UpdatedQuestions ). %Agregar la pregunta (lista) a la lista de preguntas. Agregar una lista a una lista.

ask(CurrentStack, Fecha, TextoPregunta, ListaEtiquetas, UpdatedStack) :-
	stack(_, CurrentUsers, _ ,_ , CurrentStack),
	stack(CurrentLoggedUser, _, _, _, CurrentStack),
	lengthList(CurrentLoggedUser, Length), Length = 1,  % Solo puedo hacer la pregunta si estoy logueado
	stack(_, _, CurrentQuestions, _, CurrentStack),
	stack(_ , _, _, CurrentAnswers, CurrentStack),
	addQuestion(CurrentQuestions, CurrentLoggedUser, 
				Fecha, TextoPregunta, ListaEtiquetas, UpdatedQuestions),
	stack([], CurrentUsers, UpdatedQuestions, CurrentAnswers, UpdatedStack).

/*
* Consulta exitosa para hacer una pregunta: copiar y pegar en interprete

stack([],[["MyUsername1","MyPassword1",0],["MyUsername2","MyPassword2",0]],[],[], S1),
loginUserInStack(S1,"MyUsername1","MyPassword1",S2),
ask(S2, "2021-06-05","¿Cuáles son los lenguajes más populares el 2021?", ["programming languages", "computer science"], S3).

% Resultado
S1 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S2 = [["MyUsername1"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S3 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername1", "2021-06-05", "¿Cuáles son los lenguajes más populares el 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
*/

% ------------------  Agregar una respuesta a una pregunta del stack  ------------------
/* TDA Answer: [Id, QuestionId, Author, Date, Text, Votes, AcceptStatus, Labels]).
 * 
 * Por defecto: 
 * 	Una nueva respuesta a una pregunta, se agrega 0 votes
 * 	Una nueva respuesta a una pregunta, se agrega con el AcceptStatus "no" indicando que todavia no ha sido aceptada
 * Meta primaria:
 * 	answer(CurrentStack, Fecha, IdPregunta, TextoRespuesta, ListaEtiquetas, UpdatedStack).
 * Metas secundarias: 
 *  validateQuestionId(CurrentQuestions, QuestionId).
 *  addAnswer(CurrentAnswers, QuestionId, Author, Date, Text, Labels, UpdatedAnswers)
 *  setNewAnswerId(Answer, NewId)
*/

setNewAnswerId(Answer, NewId):- 
	answer(Id,_,_,_,_,_,_,_,Answer),
	NewId is Id + 1.

addAnswer( [], QuestionId, [Author|_], Date, Text, Labels, [NewAnswer] ) :- 
	answer( 1, QuestionId, Author, Date, Text, 0, "no", Labels, NewAnswer ).

addAnswer( [CurrentAnswer|CurrentNextAnswers], QuestionId, [Author|_], 
			Date, Text, Labels, UpdatedAnswers ) :-
	setNewAnswerId(CurrentAnswer, NewId),
	answer(NewId, QuestionId, Author, Date, Text, 0, "no", Labels, NewAnswer),
	appendList( [NewAnswer], [CurrentAnswer|CurrentNextAnswers], UpdatedAnswers ).

validateQuestionId(Questions,QuestionId) :- 
	exists( [QuestionId,_,_,_,_,_,_], Questions ),true.

answer(CurrentStack, Fecha, IdPregunta, TextoRespuesta, ListaEtiquetas, UpdatedStack) :-
	stack( _, CurrentUsers, _, _, CurrentStack ),
	stack( CurrentLoggedUser, _, _, _, CurrentStack ),
	lengthList(CurrentLoggedUser, Length), Length = 1,
	stack( _, _, CurrentQuestions, _, CurrentStack),
	validateQuestionId( CurrentQuestions, IdPregunta),
	stack( _, _, _, CurrentAnswers, CurrentStack),
	addAnswer( CurrentAnswers, IdPregunta, CurrentLoggedUser, 
               Fecha, TextoRespuesta, ListaEtiquetas, UpdatedAnswers ),
	stack( [], CurrentUsers, CurrentQuestions, UpdatedAnswers, UpdatedStack ).

/*
* Consulta exitosa para crear una respuesta de una pregunta: copiar y pegar en interprete

stack([],[["MyUsername1","MyPassword1",0],["MyUsername2","MyPassword2",0]],[],[], S1),
loginUserInStack(S1,"MyUsername2","MyPassword2",S2),
ask(S2, "2020-01-01","¿Cuáles son los lenguajes más cool del 2021?", ["programming languages", "computer science"], S3),
loginUserInStack(S3,"MyUsername1","MyPassword1",S4),
answer(S4,"2021-03-11",1,"Probablemente Prolog no",["programming languages", "computer science"],S5).

% Resultado
S1 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S2 = [["MyUsername2"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S3 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
S4 = [["MyUsername1"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
S5 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], [[1, 1, "MyUsername1", "2021-03-11", "Probablemente Prolog no", 0, "no", ["programming languages", "computer science"]]]]
*/


% ------------------  Convertir el stack a string (stack->string)  ------------------
/*
 * Convertir usuario a string
 * 
*/

singleUserToString([Username, Password, Reputation], UserStringRepresentation) :-
	string_concat("Username: ", Username, UsernameStr),
	string_concat("Password: ", Password, PasswordStr),
	string_concat("Reputación: ", Reputation, ReputationStr),
	atomics_to_string( [UsernameStr,PasswordStr,ReputationStr], 
						'\n', UserStringRepresentation ).

usersListToString(_, [], []) :- !.

usersListToString( CurrentStrRepresentation, [CurrentUser|NextCurrentUsers], 
				[ StrCurrentUser|StrNextCurrentUsers] ) :-
	singleUserToString(CurrentUser, SingleUserStringRepresentation),
	string_concat(SingleUserStringRepresentation, "\n", StrCurrentUser),
	usersListToString(CurrentStrRepresentation, NextCurrentUsers, StrNextCurrentUsers).

/*
 * Convertir pregunta (question) a string
 * 
*/


singleQuestionToString([Id,Author,Date,Text,Votes,Status,Labels], QuestionStringRepresentation) :-
	string_concat("ID:", Id, IdStr),
	string_concat("Autor:", Author, AuthorStr),
	string_concat("Fecha:", Date, DateStr),
	string_concat("Texto pregunta:", Text, QuestionTextStr),
	string_concat("Votos:", Votes, VotesStr),
	string_concat("Estado:", Status, StatusStr),
	atomics_to_string(Labels, LabelsStr),
	string_concat("Labels:", LabelsStr, LabelsListStr),
	atomic_list_concat(
		[IdStr,AuthorStr,DateStr,QuestionTextStr,VotesStr,StatusStr,LabelsListStr],
		'\n', QuestionsAtom),
	atom_string(QuestionsAtom, QuestionStringRepresentation).

questionsListToString(_,[],[]) :- !.

questionsListToString( CurrentStrRepresentation, [CurrentQuestion|NextCurrentQuestions], 
				[ StrCurrentQuestion|StrNextCurrentQuestions] ) :-
	singleQuestionToString(CurrentQuestion, SingleQuestionStringRepresentation),
	string_concat(SingleQuestionStringRepresentation, "\n", StrCurrentQuestion),
	questionsListToString(CurrentStrRepresentation, NextCurrentQuestions, StrNextCurrentQuestions).

/*
 * Convertir Stack a String
 * 
*/

stackToString(CurrentStack, StackStringRepresentation) :-
	stack( _, CurrentUsers, _, _, CurrentStack ),
	usersListToString(_, CurrentUsers, UsersListStr),
	atomic_list_concat(UsersListStr, '', UsersAtom),
	atom_string(UsersAtom, UsersStr),
    stack(_, _ , CurrentQuestions, _, CurrentStack),
	questionsListToString(_, CurrentQuestions, QuestionsList),
	atomic_list_concat(QuestionsList,'',QuestionsAtom),
	atom_string(QuestionsAtom,QuestionsStr),
	atomics_to_string([UsersStr, QuestionsStr],'', StackStringRepresentation).

/*
* Consulta exitosa para crear el string del stack: copiar y pegar en interprete

stack([],[["MyUsername1","MyPassword1",0],["MyUsername2","MyPassword2",0]],[],[], S1),
loginUserInStack(S1,"MyUsername2","MyPassword2",S2),
ask(S2, "2020-01-01","¿Cuáles son los lenguajes más cool del 2021?", ["programming languages", "computer science"], S3),
loginUserInStack(S3,"MyUsername1","MyPassword1",S4),
answer(S4,"2021-03-11",1,"Probablemente Prolog no",["programming languages", "computer science"],S5),
stackToString(S5, CurrentStackInString), write(CurrentStackInString).

% Resultado
S1 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S2 = [["MyUsername2"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S3 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
S4 = [["MyUsername1"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
S5 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername2", "2020-01-01", "¿Cuáles son los lenguajes más cool del 2021?", 0, "abierta", ["programming languages", "computer science"]]], [[1, 1, "MyUsername1", "2021-03-11", "Probablemente Prolog no", 0, "no", ["programming languages", "computer science"]]]]
CurrentStackInString =
"Username: MyUsername1\nPassword: MyPassword1\nReputación: 0\nUsername: MyUsername2\nPassword: MyPassword2\nReputación: 0\nID:1\nAutor:MyUsername2\nFecha:2020-01-01\nTexto pregunta:¿Cuáles son los lenguajes más cool del 2021?\nVotos:0\nEstado:abierta\nLabels:programming languagescomputer science\n"
*/
