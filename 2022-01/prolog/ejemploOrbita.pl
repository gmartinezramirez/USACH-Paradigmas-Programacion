%Dominios
%Cuerpo:atom

%Predicados
%orbita(Cuerpo,Cuerpo).
%Planeta(Cuerpo)
%satelite(Cuerpo).
%cometa(Cuerpo)

%Metas
%Principal: planeta, satelite, cometa  (Para este ejemplo se plantean como primarias estos tres predicados)
%Secundarias: orbita

%Clausulas de Horn
%Hechos o Axiomas
orbita(tierra,sol).
orbita(marte,sol).
orbita(jupiter,sol).
orbita(venus,sol).
orbita(luna,tierra).
orbita(deimos,marte).
orbita(phobos,saturno).

%Reglas
planeta(P):-orbita(P,sol).
satelite(S):-orbita(S,P),planeta(P).
%CUIDADO!!!! Supuesto del Mundo cerrado
cometa(C):-not(planeta(C)),not(satelite(C)).