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

stack(LoggedUser, Users, Questions, Answers, 
      [LoggedUser, Users, Questions, Answers]).

% Creción de un stack vacío:
% stack( [], [], [], [], S1).
% S1 = [[], [], [], []]

% Creación de un stack con preguntas ya almacenadas
% stack( [], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]],[], S2).
% S2 = [[], [], [["Que fue primero, la gallina o el huevo?", "yo creo que la gallina", 0]], []]


% ------------------  TDA User  ------------------

user( Username, Password, Reputation, 
      [Username, Password, Reputation]).

% Creación de usuario
%user("MyUsername","MyPassword", 10, User1).
% User1 = ["MyUsername", "MyPassword", 10]


% ------------------  TDA Question (pregunta)  ------------------

question(Id, Author, Date, Text, Votes, Status, Labels,
         [Id, Author, Date, Text, Votes, Status, Labels]).

%question(1, "MyUsername1", "2020-12-02", "¿Cómo funciona Prolog?", 10, "abierta", ["prolog", "logic programming"], NewQuestion).
% NewQuestion = [1, "MyUsername1", "2020-12-02", "¿Cómo funciona Prolog?", 10, "abierta", ["prolog", "logic programming"]]


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
 * 	Una pregunta se agrega con el estado "abierta" (estado="abierta")
 * 	Una pregunta se agrega con 0 votos (votos=0)
 * Meta primaria:
 * 	ask(CurrentStack, Fecha, TextoPregunta, ListaEtiquetas, UpdatedStack).
 * Metas secundarias: 
 * 	addQuestion (CurrentQuestions, Author, Date, Text, Labels, UpdatedQuestions).  
 *  validateQuestionId(CurrentQuestions, QuestionId).
 * 
*/

setNewQuestionId(Question, NewId) :- 
    question(Id, _ , _, _, _, _, _, Question),
    NewId is Id + 1.

% Si es la primera pregunta agregada, entonces tiene Id=1
addQuestion([],[Author|_], Date, Text, Labels, [Q]) :- 
    question(1, Author, Date, Text, 0, "abierta", Labels,Q).

addQuestion([H|T],[Author|_],Date,Text,Labels,Q) :-
  setNewQuestionId(H,NewId),
  question( NewId, Author, Date, Text, 0, "abierta", Labels, Question), % Pregunta se agrega con 0 votos
  appendList([Question],[H|T],Q). %Agregar la pregunta (lista) a la lista de preguntas. Agregar una lista a una lista.

ask(CurrentStack, Fecha, TextoPregunta, ListaEtiquetas, UpdatedStack) :-
  stack( _, CurrentUsers, _ ,_ , CurrentStack ),
  stack( CurrentLoggedUser, _, _, _, CurrentStack ),
  lengthList( CurrentLoggedUser, Length ), Length = 1,  % Solo puedo hacer la pregunta si estoy logueado
  stack( _, _, CurrentQuestions, _, CurrentStack ),
  stack( _ , _, _, CurrentAnswers, CurrentStack ),
  addQuestion( CurrentQuestions, CurrentLoggedUser, 
               Fecha, TextoPregunta, ListaEtiquetas, UpdatedQuestions ),
  stack( [], CurrentUsers, UpdatedQuestions, CurrentAnswers, UpdatedStack ).

/*
* Login exitoso de usuario previamente registrado en el sistema
stack([],[["MyUsername1","MyPassword1",0],["MyUsername2","MyPassword2",0]],[],[], S1),
loginUserInStack(S1,"MyUsername1","MyPassword1",S2),
ask(S2, "2021-06-05","¿Cuáles son los lenguajes más populares el 2021?", ["programming languages", "computer science"], S3).

S1 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S2 = [["MyUsername1"], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [], []]
S3 = [[], [["MyUsername1", "MyPassword1", 0], ["MyUsername2", "MyPassword2", 0]], [[1, "MyUsername1", "2021-06-05", "¿Cuáles son los lenguajes más populares el 2021?", 0, "abierta", ["programming languages", "computer science"]]], []]
*/
