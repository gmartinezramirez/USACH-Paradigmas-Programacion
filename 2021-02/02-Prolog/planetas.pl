%% Dominio
% Cuerpo,P,S:symbol

%% Predicados
% orbita(Cuerpo,Cuerpo)  ; aridad = 2 , relación binaria
% planeta(P)
% satelite(S)

%% Metas
   %Principales:  planeta(P), satelite(S)
   %Secundarias:  orbita(Cuerpo,Cuerpo)

%% Clausulas
  
% Hechos

orbita(tierra,sol).
orbita(marte,sol).
orbita(jupiter,sol).
orbita(urano,sol).
orbita(neptuno,sol).
orbita(venus,sol).
orbita(saturno,sol).
orbita(mercurio,sol).
orbita(deimos,marte).
orbita(phobos,marte).
orbita(luna,tierra).
orbita(europa,jupiter).
orbita(calisto,jupiter).

% Reglas
planeta(P) :- 
  orbita(P,sol).
satelite(S) :-
  orbita(S,P),
  planeta(P).

% usar con cuidado la negación: Supuesto del mundo cerrado
cometa(C) :- 
  not(planeta(C)),
  not(satelite(C)),
  not(C=sol).
