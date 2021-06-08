% Sistem Q&A
% Usuarios preguntan
% Usuarios responden
% preguntas
% respuestas
%
% Q&A: [Usuarios, Preguntas, Respuetas]
% Usuario: [ID: int, UserName: string, Pass: string]
% Pregunta: [ID: int, UserName: string, Pregunta:string]
% Respuesta: [ID: int, IDPregunta: int, Username: string, Respuesta: string]
mes(1, 31).
mes(2, 28).
mes(3, 31).
mes(4, 30).
mes(5, 31).
mes(6, 30).
mes(7, 31).
mes(8, 31).
mes(9, 30).
mes(10, 31).
mes(11, 30).
mes(12, 31).

fecha(Dia,Mes,Agno,[Dia,Mes,Agno]):-
    integer(Agno), Agno > 2000, mes(Mes,Dias), integer(Dia), Dia > 0, Dia =< Dias.

% Constructor
qa(Nombre,Fecha,[Nombre,Fecha,-1, [0],[0],[0]]):-fecha(_,_,_,Fecha),string(Nombre).

% Existe el usuario en la lista
userInList(User,Pass,[[Uid,User,Pass]|_],Uid):-!.
userInList(User,Pass,[_|Us],Uid):-userInList(User,Pass,Us,Uid).

% Registrar usuario
stackRegister([N, F, -1 , [0], Ps,Rs],
    User, Pass,
    [N, F , -1, [1, [1, User,Pass]],Ps,Rs]).
stackRegister([N, F, -1 , [LID,[LID,User1,Pass1]|Us],Ps,Rs],
    User, Pass,
    [N, F, -1 , [NLID, [NLID,User,Pass], [LID,User1,Pass1] | Us],Ps,Rs]):-
        NLID is LID + 1,
        User \= User1,
        not(userInList(User,_,Us,_)).

% Login y Logout
login([N, F, -1, Us, Ps, Rs],
    User, Pass,
    [N, F, Uid, Us, Ps, Rs]):-
        userInList(User,Pass,Us,Uid).
logout([N, F, UId, Us, Ps, Rs],
    [N, F, -1, Us, Ps, Rs]):-
        UId > -1.

% Ask
ask([N, F, UId, Us, [0], Rs],
    Question,
    [N, F, -1, Us, [1, [1, User, Question]], Rs]):-
        userInList(User,_,Us, UId).
ask([N, F, UId, Us, [LId, [LId, LUser, LQuestion] | Tail], Rs],
    Question,
    [N,F,-1,Us,[NewLId,[NewLId,User,Question],[LId,LUser,LQuestion]|Tail],Rs]):-
        userInList(User,_,Us, UId),
        NewLId is LId + 1.

% Answer
questionInList(PId, [[PId,_, _]|_]).
questionInList(PId, [_|Ps]):-questionInList(PId, Ps).

answer([N, F, UId, Us, [Quantity | Ps], [0]],
    PId, Answer,
    [N, F, -1, Us, [Quantity | Ps], [1 , [1, PId, User, Answer]]]):-
        userInList(User, _, Us, UId),
        questionInList(PId, Ps).

answer([N, F, UId, Us, [Quantity | Ps], [LId, [LId, LPId, LUser, LAnswer] | Tail]],
    PId, Answer,
    [N, F, -1, Us, [Quantity | Ps], [NLId, [NLId, PId, User, Answer], [LId, LPId, LUser, LAnswer] | Tail]]):-
        NLId is LId + 1,
        userInList(User, _, Us, UId),
        questionInList(PId, Ps).

/*
%Example qa
a("Stack", [15, 1, 2001], QA).

% Example register
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    stackRegister(QA2, "Alan3", "nala3", [_, _, _, U, _, _]).

% Example login
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan2", "nala2", [_, _, ID, _, _, _]).

% Example ask
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan", "nala", QA3),
    ask(QA3, "Como estan todos ustedes?", QA4),
    login(QA4, "Alan2", "nala2", QA5),
    ask(QA5, "Como estan todas ustedes?", QA6),
    login(QA6, "Alan", "nala", QA7),
    ask(QA7, "Hello?", [_, _, _, _, Q, _]).

% Respuesta: [ID, IDPregunta, Username, Respuesta] - Entero X Entero X
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan", "nala", QA3),
    ask(QA3, "Como estan todos ustedes?", QA4),
    login(QA4, "Alan2", "nala2", QA5),
    ask(QA5, "Como estan todas ustedes?", QA6),
    login(QA6, "Alan", "nala", QA7),
    ask(QA7, "Hello?", QA8),
    login(QA8 , "Alan2", "nala2", QA9),
    answer(QA9, 3, "Bien y usted", QA10),
    login(QA10, "Alan", "nala", QA11),
    answer(QA11, 1, "Bien bien gracias", QFINAL).
*/