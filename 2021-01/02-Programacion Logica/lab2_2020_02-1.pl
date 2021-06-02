%Sistem Q&A
%Usuarios preguntan
%Usuarios responden
%preguntas
%respuestas
%
%Q&A: [ Usuarios, Preguntas, Res.puetas ]
%Usuario: [ID, UserName, Pass]  - Entero X String X String
%Pregunta: [ID, UserName, Pregunta] -  Entero X String X String
% Respuesta: [ID, IDPregunta, Username, Respuesta] - Entero X Entero X
% String X String
%
%
%qa(stackoverflow,[ [[1, "user1", "pass1"],[2, "user2", "pass2"]],
%                   [[1, "user1", "mi primera pregunta"],
%                    [2, "user1", "mi segunda pregunta"],
%                    [3, "user1", "mi tercera pregunta"]],
%                   [[1, 1, "user2", "mi respuesta a primera pregunta"],
%                    [2, 3, "user2", "mi respuesta a tercera
%                    pregunta"]]]).

mes(1,31).
mes(2,28).
mes(3,31).
mes(4,30).
mes(5,31).


fecha(Dia,Mes,Agno,[Dia,Mes,Agno]):-integer(Agno),Agno>2000,mes(Mes,Dias),integer(Dia),Dia>0,Dia=<Dias.
qa(Nombre,Fecha,[Nombre,Fecha,-1, [0],[0],[0]]):-fecha(_,_,_,Fecha),string(Nombre).

userInList(User,Pass,[[Uid,User,Pass]|_],Uid).
userInList(User,Pass,[_|Us],Uid):-userInList(User,Pass,Us,Uid).

stackRegister([N, F, -1 , [0], Ps,Rs], User, Pass, [N, F , -1, [1, [1, User,Pass]],Ps,Rs]).
stackRegister([N, F, -1 , [LID,[LID,User1,Pass1]|Us],Ps,Rs], User, Pass, [N, F, -1 ,[NLID,[NLID,User,Pass],[LID,User1,Pass1]|Us],Ps,Rs]):-NLID is LID + 1,
                                                                                                                                          User \= User1,
                                                                                                                                          not(userInList(User,_,Us,_)).

login([N, F, -1, Us, Ps, Rs], User, Pass, [N, F, Uid, Us, Ps, Rs]):-userInList(User,Pass,Us,Uid).

logout([N, F, UId, Us, Ps, Rs],[N, F, -1, Us, Ps, Rs]):-UId > -1.









