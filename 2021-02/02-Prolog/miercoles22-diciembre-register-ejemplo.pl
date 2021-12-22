
% Foro
% StackOverflow
%   Usuarios   : Usuarios (id, username, password)
%   Preguntas  : Documentos  : Publicaciones. Documento (id, titulo, contenido)
%   Plataforma : GDrive : RedSocial. Plataforma(version, usuarios, documentos)
 
% Tenemos una plataforma que tiene usuarios y cada usuario tiene asociado ciertas preguntas.

% TDA

%usuario(1, gmartinez, pass1, User)
usuario(Id, Username, Password, [Id, Username, Password]).

%documento(1, 1, miTesis, contenidoDeTesis, Documento).
documento(Id, Version, Titulo, Contenido, [Id, Version, Titulo, Contenido]).

%
% plataforma(1, [[1,gmartinez,pass1], [2,hherrera,passh], [3,maravena,passaravena]], [], PlataformaOut).
%
plataforma(Version, UsuariosRegistrados, UsuariosLogeados, [Version, UsuariosRegistrados, UsuariosLogeados]).


registrarUsuario(PlataformaIn, Username, Password, PlataformaOut) :-
    plataforma(Version, UsuariosRegistrados, UsuariosLogeados, PlataformaIn),
    plataforma(Version+1, [[Username, Password] | UsuariosRegistrados], UsuariosLogeados, PlataformaOut).
                    
                    

% plataforma(1, [[1,gmartinez,pass1], [2,hherrera,passh], [3,maravena,passaravena]], [], PlataformaOut),
% login(PlataformaOut, gmartinez, pass1).

% plataforma(1, [[1,gmartinez,pass1], [2,hherrera,passh], [3,maravena,passaravena]], [], PlataformaOut),
% login(PlataformaOut, gmartinez, pass1),
% subirArchivo(algo).


% regla(AlgoAntiguo, Valor1, Valor2, AlgoNuevo).
% regla(TdaAntiguo, Valor1, Valor2, TdaNuevo).

% agregarComentario(PlataformaIn, Publicacion, PlataformaOut)