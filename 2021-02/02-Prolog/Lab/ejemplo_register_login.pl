%TDAs
%   Usuario
%       ListaUsuarios
%   Pregunta
%       ListaPreguntas
%   Respuesta
%       ListaRespuestas
%   Stack


%Implementación de un TDA
%Representación
%Usuario: [IdU, Username, Pass]    => Integer X String X String
%
%Pregunta: [IdP, IdU, Pregunta]    => Integer X Integer X String
%
%Respuesta: [IdR, IdP, IdU, Respuesta] => Integer X Integer X Integer X String
%
%Respuestas: [] ; Respuesta X Respuestas.
%Usuarios: [] ; Usuario X Usuarios.
%Preguntas: [] ; Pregunta X Preguntas.
%
%ListaPreguntas: [LastIdP | Preguntas]
%ListaUsuarios: [LastIdU | Usuarios]
%ListaRespuestas: [LastIdR | Respuestas]
%
%      => String X Integer X ListaUsuarios X ListaPreguntas X ListaRespuestas X
%Stack: [Nombre, LoggedUser, ListaUsuarios, ListaPreguntas, ListaRespuestas]


% ------------------  TDA STACK  ------------------
% 

% Dominios
% Id: Integer
% Username: String
% Pass: String
% U:List
%
%predicates
%usuario(Id,Username,Pass,U).




%clausulas
% las validaciones de tipos que figuran en antecedente (lado derecho de
% la clasula), no son del todo necesarios. Para esto sirve la
% documentación anterior.
% usuario(Id,Username,Pass,[Id,Username,Pass]):-integer(Id),Id>0,string(Username),string(Pass).
%
% pregunta(IdP,IdU,Pregunta,[IdP,IdU,Pregunta]):-integer(IdP),IdP>0,integer(IdU),IdU>0,string(Pregunta).
%
% respuesta(IdR,IdP,IdU,Respuesta,[IdR,IdP,IdU,Respuesta]):-integer(IdR),IdR>0,integer(IdP),IdP>0,integer(IdU),IdU>0,string(Respuesta).
%

stack(Nombre, [Nombre,-1,[0], [0], [0]]).

register([N, LogU, [Lid|Us],Ps,Rs], U, P, [N,LogU,[NewLid,[NewLid,U,P]|Us],Ps,Rs]):-
    not(member([_,U,_],Us)),
    NewLid is Lid + 1.


login([N,-1,Us,Ps,Rs],U,P,[N,IdU,Us,Ps,Rs]):-
    member([IdU,U,P],Us).

logout([N,Lu,Us,Ps,Rs],[N,-1,Us,Ps,Rs]):- 
    Lu \= -1.


