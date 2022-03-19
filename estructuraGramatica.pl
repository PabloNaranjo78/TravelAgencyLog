:-consult(grafo).
%Componentes de oraciones
buscarLugar(LUGAR):- 
    arco(_,_,LUGAR,_,_,_,_),!.
buscarLugar(LUGAR):-
    arco(_,_,_,LUGAR,_,_,_),!.



%Puntuacion
puntuacion-->[,].

%Articulos

articulo-->[].
articulo-->[el].
articulo-->[del].
articulo-->[la].
articulo-->[las].
articulo-->[al].
articulo-->[lo].
articulo-->[los].
articulo-->[un].
articulo-->[una].
articulo-->[unos].
articulo-->[unas].

%Preposiciones

preposiciones-->[].
preposiciones-->[a].
preposiciones-->[ante].
preposiciones-->[bajo].
preposiciones-->[cabe].
preposiciones-->[con].
preposiciones-->[contra].
preposiciones-->[de].
preposiciones-->[desde].
preposiciones-->[durante].
preposiciones-->[en].
preposiciones-->[entre].
preposiciones-->[hacia].
preposiciones-->[hasta].    
preposiciones-->[mediante].
preposiciones-->[para].
preposiciones-->[por].
preposiciones-->[sin].
preposiciones-->[sobre].
preposiciones-->[tras].
preposiciones-->[versus].
preposiciones-->[via].
preposiciones-->[cabe].
preposiciones-->[so].

%Verbos


%sustantivos-->{}