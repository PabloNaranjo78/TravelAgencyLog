:-consult(grafo).
%Componentes de oraciones
buscarLugar(LUGAR):- 
    arco(_,_,LUGAR,_,_,_,_).
buscarLugar(LUGAR):-
    arco(_,_,_,LUGAR,_,_,_).

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
verbo-->[quiero];[queremos];[quiere];[quieren];[quiere];[queria].
verbo-->[deseo];[deseamos];[deseabamos].
verbo-->[tengo];[tenemos];[tiene];[tienen];[tenia];[tendria].
verbo-->[mover];[movimos];[mueve];[mueven];[movia];[movia].
verbo-->[vuelo];[volariamos];[volaria].
verbo-->[estoy];[estamos];[estan];[estaba];[estabamos];[estaba].
verbo-->[ser];[somos];[es];[eran];[era];[eramos];[era].

%sustantivos
sustantivo-->[].
sustantivo-->[pais];[ciudad];[aeropuerto];[lugar];[clase];[avion];[aerolinea].
sustantivo-->[negocios];[economica];[dolares];[charter].
sustantivo--> {buscarLugar(LUGAR)},[LUGAR],!.
sustantivo-->[esposa];[esposo];[pareja];[hijos]:[hijas];[familia].
sustantivo-->[hola];[gracias];[buenas];[claro].

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

%Advervios
advervio-->[].
advervio-->[si];[no];[ninguna];[ninguno].

saludo-->sustantivo,verbo,preposiciones.
prueba-->pronombre,articulo,sustantivo,sustantivo,articulo,verbo,verbo.



