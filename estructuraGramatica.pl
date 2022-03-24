:-consult(grafo).
%Componentes de oraciones
buscarLugar(LUGAR):- 
    arco(_,_,LUGAR,_,_,_,_).
buscarLugar(LUGAR):-
    arco(_,_,_,LUGAR,_,_,_).

buscarAerolinea(AEROLINEA):-
    arco(AEROLINEA,_,_,_,_,_,_).

/* Sintaxis de articulo-->[el] es equivalente a articulo([el|S],S)
*/
%Puntuacion
puntuacion-->[,];[].

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

verbo--> [].
verbo-->[haber];[habemos];[habian];[habia];[habiamos].
verbo-->[viajo];[viajemos];[viajan];[viajaba];[viajabamos];[viajar];[viaja].
verbo-->[quiero];[queremos];[quiere];[quieren];[quiere];[queria];[quisiera];[quisiese].
verbo-->[deseo];[deseamos];[deseabamos].
verbo-->[encuentro];[encuentros];[encuentra];[encuentran].
verbo-->[ubicado];[ubicamos];[ubican];[ubicaba];[ubicar];[ubica].
verbo-->[gusta];[gustamos];[gustan];[gustaba];[gustabamos];[gustar];[gustaria].
verbo-->[tengo];[tenemos];[tiene];[tienen];[tenia];[tendria].
verbo-->[mover];[movimos];[mueve];[mueven];[movia];[movia].
verbo-->[vuelo];[volariamos];[volaria].
verbo-->[voy];[vamos].
verbo-->[estoy];[estamos];[estan];[estaba];[estabamos];[estaba].
verbo-->[ser];[somos];[es];[eran];[era];[eramos];[era].
verbo-->[ir];[vamos];[van];[iba];[ibamos].
verbo-->[puedo];[podemos];[puede];[pueden];[podria];[pudieron].
verbo-->[puedes];[podemos];[pueden];[pudieron];[pudieran];[pudieran].


%sustantivos
sustantivo-->[].
sustantivo-->[pais];[ciudad];[aeropuerto];[lugar];[clase];[avion];[aerolinea];[vuelo].
sustantivo-->[negocios];[economica];[economica];[dolares];[charter];[caro];[$];[numero].
sustantivo--> {buscarLugar(LUGAR)},[LUGAR],!.
sustantivo-->{buscarAerolinea(AEROLINEA)},[AEROLINEA],!.
sustantivo-->[esposa];[esposo];[pareja];[hijos]:[hijas];[familia].
sustantivo-->[hola];[gracias];[buenas];[claro];[barato];[mas];[favor].

%Pronombres
pronombre-->[].
pronombre-->[yo].
pronombre-->[tu].
pronombre-->[el].
pronombre-->[ella].
pronombre-->[nosotros].
pronombre-->[nosotras].
pronombre-->[vosotros].
pronombre-->[vosotras].
pronombre-->[ellos].
pronombre-->[ellas].
pronombre-->[usted].
pronombre-->[ustedes].
pronombre-->[su].
pronombre-->[me].
pronombre-->[nos].
pronombre-->[se].
pronombre-->[mi].
pronombre-->[nuestro].

%adverbios
adverbios-->[].
adverbios-->[si];[no];[ninguna];[ninguno].
adverbios-->[necesario];[necesaria];[necesariamente].
adverbios-->[barato];[barata].
adverbios-->[mas].


nucleo-->sustantivo,pronombre,adverbios.

%Sintagmas noninales y sus posibles estructuras
sintagma_nominal-->[].
sintagma_nominal-->pronombre.
sintagma_nominal-->adverbios,nucleo.
sintagma_nominal-->preposiciones,articulo,preposiciones,nucleo.
sintagma_nominal-->preposiciones,articulo,nucleo,preposiciones,nucleo.
sintagma_nominal-->nucleo.
sintagma_nominal-->adverbios,pronombre,sustantivo,nucleo.
sintagma_nominal-->adverbios,adverbios.
sintagma_nominal-->articulo,sustantivo,nucleo,nucleo.

%Sintagmas verbales y sus posibles estructuras
sintagma_verbal-->[].
sintagma_verbal-->adverbios,pronombre,nucleo,verbo,articulo,preposiciones,verbo,preposiciones,sintagma_nominal.

%Una oracion puede ser un advervio y un sustantivo o una oracion compuesta.
oracion-->adverbios,sustantivo.
oracion-->sintagma_nominal,sintagma_verbal.

