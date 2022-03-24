:-consult(grafo).
:-consult(estructuraGramatica).

/*Función iniciar: esta función da inicio a la secuencia que hará las preguntas al usuario.
Entrada: ninguna.
Salida: va llamando las funciones que corresponden a cada una de las preguntas.
*/
iniciar():-
    write("Bienvenido a TravelAgencyLog la mejor logica de llegar a su destino"),nl,
    write("Por Favor indiqueme cual es el origen de su vuelo"),nl,
    esperarRespuestaS(PAISSALIDA),nl,
    write("Muy bien, ahora indiqueme el destino"),nl,
    esperarRespuestaL(PAISLLEGADA),nl,
    write("Excelente,Tiene alguna preferencia en el tipo de vuelo? Charter,economica o negocios?"),nl,
    buscarConexionTodas(PAISSALIDA,PAISLLEGADA,CAMINO),
    esperarRespuestaT(CAMINO,RES),nl,
    write("Tiene alguna aereolinea preferencia?"),nl,
    esperarRespuestaA(RES,RES2),nl,
    write("Tiene algun presupuesto?"),nl,
    esperarRespuestaP(RES2,RES3),nl,
    write("Sus vuelos serian:"),nl,
    imprimirLista(RES3),!.
    

/*
Funcion imprimirLista: imprime la lista de los vuelos.
Entrada: lista de vuelos.
Salida: imprime con un formato de texto los elementos de la lista
*/
imprimirLista([]).
imprimirLista([X|Y]):-
    nElemento(X,2,Z),imprimirListaA(Z),nl,
    imprimirLista(Y).

imprimirListaA([]).
imprimirListaA([X|Y]):-
    generarRespuestaFormato(X),nl,
    imprimirListaA(Y).

% EsperarRespuestaP: espera una respuesta del usuario cuando se le pide un presupuesto.
% Entrada: el camino que se tiene como resultado
% Salida: en RES se retorna el camino tomando en cuenta el presupuesto
esperarRespuestaP(CAMINO,RES):-
    readln(RESPUESTA,_,_,_,lowercase),
    remplazarNumeros(RESPUESTA,RESPUESTAREMPLAZADA),
    oracion(RESPUESTAREMPLAZADA,[]),
    buscarAerolinea(RESPUESTA,CAMINO,RES).

%En caso de de que la anterior sea falsa, se le pide al usuario que vuelva a ingresar otra vez el dato.
esperarRespuestaP(CAMINO,RES):-
    write("No entiendo, por favor intente de nuevo"),nl,
    esperarRespuestaP(CAMINO,RES).

%BuscarPresupuesto: busca el presupuesto que el usuario ingreso
%Entrada:respuesta en forma de texto
%Salida: en RES se retorna el camino tomando en cuenta el presupuesto.
buscarPRESUPUESTO(RESPUESTA,CAMINO,RES):-
    find(RESPUESTA,NUMERO),
    write("Presupuesto: "),write(NUMERO),nl,RES=CAMINO. %Falta poner esto

%BuscarPresupuesto: en caso de que la respuesta sea negativa, las 3 siguientes hechos lo verifica
%Entrada: respuesta en forma de texto.
%Salida: en RES se retorna el camino igual, dado que se dice que no tiene presupuesto
buscarPRESUPUESTO(RESPUESTA,CAMINO,RES):-
    member(no,RESPUESTA),
    RES = CAMINO.

buscarPRESUPUESTO(RESPUESTA,CAMINO,RES):-
    member(ninguno,RESPUESTA),
    RES = CAMINO.

buscarPRESUPUESTO(RESPUESTA,CAMINO,RES):-
    member(ninguna,RESPUESTA),
    RES = CAMINO.

% BuscarAerolinea: busca la aerolinea que el usuario ingreso.
% Entrada: respuesta en forma de texto.
% Salida: en RES se retorna el camino tomando en cuenta la aerolinea.
esperarRespuestaA(CAMINO,RES2):-
    readln(RESPUESTA,_,_,_,lowercase),
    oracion(RESPUESTA,[]),
    buscarAerolinea(RESPUESTA,CAMINO,RES2).

%En caso de que la anterior sea falsa, se le pide al usuario que vuelva a ingresar otra vez el dato.
esperarRespuestaA(CAMINO,RES):-
    write("No entiendo, por favor intente de nuevo"),nl,
    esperarRespuestaA(CAMINO,RES).

%BuscarAerolinea: busca la aerolinea que el usuario ingreso.
%Entrada: respuesta en forma de texto.
%Salida: en RES se retorna el camino tomando en cuenta la aerolinea.
buscarAerolinea(RESPUESTA,CAMINO,RES):-
    member(AEROLINEA,RESPUESTA),arco(AEROLINEA,_,_,_,_,_,_),
    write("Aerolinea: "),write(AEROLINEA), RES = CAMINO. %Falta poner esto

%Cuando la respuesta es negativa, se retorna el camino igual.
buscarAerolinea(RESPUESTA,CAMINO,RES2):-
    member(no,RESPUESTA),
    RES2 = CAMINO.

buscarAerolinea(RESPUESTA,CAMINO,RES2):-
    member(ninguno,RESPUESTA),
    RES2 = CAMINO.

buscarAerolinea(RESPUESTA,CAMINO,RES2):-
    member(ninguna,RESPUESTA),
    RES2 = CAMINO.

%EsperarRespuestaT: espera una respuesta del usuario cuando se le pide el tipo de vuelo.
%Entrada: el camino que se tiene como resultado
%Salida: en RES se retorna el camino tomando en cuenta el tipo de vuelo.
esperarRespuestaT(CAMINO,RES):-
    readln(RESPUESTA,_,_,_,lowercase),
    oracion(RESPUESTA,[]),
    buscarClase(RESPUESTA,CAMINO,RES).

%En caso de de que la anterior sea falsa, se le pide al usuario que vuelva a ingresar otra vez el dato.
esperarRespuestaT(CAMINO,RES):-
    write("No entiendo, por favor intente de nuevo"),nl,
    esperarRespuestaT(CAMINO,RES).

%BuscarClase: busca la clase que el usuario ingreso.
%Entrada: respuesta en forma de texto.
%Salida: en RES se retorna el camino tomando en cuenta la clase.
buscarClase(RESPUESTA,CAMINO,RES):-
    member(TIPOVUELO,RESPUESTA),arco(_,_,_,_,_,TIPOVUELO,_),
    write("Tipo: "),write(TIPOVUELO),nl,RES = CAMINO. %Falta poner esto

%Cuando la respuesta es negativa, se retorna el camino igual.
buscarClase(RESPUESTA,CAMINO,RES):-
    member(no,RESPUESTA),
    RES = CAMINO.

buscarClase(RESPUESTA,CAMINO,RES):-
    member(ninguno,RESPUESTA),
    RES = CAMINO.

buscarClase(RESPUESTA,CAMINO,RES):-
    member(ninguna,RESPUESTA),
    RES = CAMINO.



%EsperarRespuesta: espera una respuesta del usuario cuando se le pide la salida.
%Entrada: ninguna.
%Salida: en RES se retorna el camino tomando en cuenta la salida.
esperarRespuestaS(PAISSALIDA):-
    readln(RESPUESTA,_,_,_,lowercase),
    oracion(RESPUESTA,[]),
    buscarPaisSalida(RESPUESTA,PAISSALIDA),!.

%En caso de de que la anterior sea falsa, se le pide al usuario que vuelva a ingresar otra vez el dato.
esperarRespuestaS(PAISSALIDA):-
    write("Lo siento, no entiendo lo que quieres decir o no hay vuelos disponibles"),nl,
    esperarRespuestaS(PAISSALIDA).

%BuscarPaisSalida: busca el pais de salida que el usuario ingreso en la base de datos.
buscarPaisSalida(RESPUESTA,PAIS):-
    member(PAIS,RESPUESTA),arco(_,_,PAIS,_,_,_,_),!.

%Espera una respuesta por parte del usuario para leer el destino.
esperarRespuestaL(PAISSALIDA):-
    readln(RESPUESTA,_,_,_,lowercase),
    oracion(RESPUESTA,[]),
    buscarPaisLlegada(RESPUESTA,PAISSALIDA),!.

%En caso de de que la anterior sea falsa, se le pide al usuario que vuelva a ingresar otra vez el dato.
esperarRespuestaL(PAISSALIDA):-
    write("Lo siento, no entiendo lo que quieres decir o no hay vuelos disponibles"),nl,
    esperarRespuestaL(PAISSALIDA).

%BuscarPaisLlegada: busca el pais de llegada que el usuario ingreso en la base de datos.
buscarPaisLlegada(RESPUESTA,PAIS):-
    member(PAIS,RESPUESTA),arco(_,_,_,PAIS,_,_,_),!.


esperarRespuestaCharter(RESPUESTA):-
    readln(RESPUESTA,_,_,_,lowercase),
    oracion(RESPUESTA,[]),
    buscarCharter(RESPUESTA),!.


%BuscarConexion: busca la conexion dentro del grafo entre dos puntos.
%Entrada: lugar de inicio y lugar final.
%Salida: el costo total entre los dos puntos y una lista con el camino resultante de vuelos.
buscarConexion(LUGAR,LUGAR2,TOTAL,CAMINO):-
    arco(AEROLINEA,ASIENTO,LUGAR,LUGAR2,DURACION,CLASE,COSTO), TOTAL is COSTO,
    generarRespuesta(AEROLINEA,ASIENTO,LUGAR,LUGAR2,DURACION,CLASE,COSTO,RESULTADO),
    CAMINO=[RESULTADO].

buscarConexion(LUGAR,LUGAR2,TOTAL,CAMINO):-
    arco(AEROLINEA,ASIENTO,LUGAR,LUGAR3,DURACION,CLASE,COSTO), 
    buscarConexion(LUGAR3,LUGAR2,COSTO1,CAMINO1),
    TOTAL is (COSTO+COSTO1),
    generarRespuesta(AEROLINEA,ASIENTO,LUGAR,LUGAR3,DURACION,CLASE,COSTO,RESULTADO),
    CAMINO=[RESULTADO|CAMINO1].

%Busca todas las conexiones encontradas entre los dos puntos y retorna el camino.
buscarConexionTodas(LUGAR,LUGAR2,CAMINOS):-
    findall([TOTAL,CAMINO],buscarConexion(LUGAR,LUGAR2,TOTAL,CAMINO),CAMINOS).

%Genera una lista con los elementos de un vuelo.
generarRespuesta(AEROLINEA_,ASIENTO_,LUGAR_,LUGAR2_,DURACION_,CLASE_,COSTO,RESULTADO):-
    RESULTADO=[AEROLINEA_,ASIENTO_,LUGAR_,LUGAR2_,DURACION_,CLASE_,COSTO].
    

%GenerarRespuestaFormato: Crea un formato de texto a partir de una lista.
%Entrada: lista con los elementos de un vuelo.
%Salida: el vuelo en formato de texto.
generarRespuestaFormato(LISTA):-
    nElemento(LISTA,1,AEROLINEA_),
    nElemento(LISTA,2,ASIENTO_),
    nElemento(LISTA,3,LUGAR_),
    nElemento(LISTA,4,LUGAR2_),
    nElemento(LISTA,5,DURACION),
    nElemento(LISTA,6,CLASE_),
    nElemento(LISTA,7,COSTO),
    upcase_atom(AEROLINEA_,AEROLINEA),
    upcase_atom(ASIENTO_,ASIENTO),
    upcase_atom(LUGAR_,LUGAR),
    upcase_atom(LUGAR2_,LUGAR2),
    upcase_atom(CLASE_,CLASE),
    string_concat("El ",ASIENTO, PART1),
    string_concat(" ruta ",LUGAR, PART2),
    string_concat(" - ", LUGAR2, PART3),
    string_concat(" con la aerolinea ",AEROLINEA, PART4),
    string_concat(" en la clase ",CLASE, PART5),
    string_concat(" con una duracion de ",DURACION, PART6),
    string_concat(" horas y un costo en dolares es de ",COSTO, PART7),
    string_concat(PART1,PART2,RES1),
    string_concat(RES1,PART3,RES2),
    string_concat(RES2,PART4,RES3),
    string_concat(RES3,PART5,RES4),
    string_concat(RES4,PART6,RES5), 
    string_concat(RES5,PART7,RESULTADO),
    write(RESULTADO),nl.

%nElemento: retorna el elemento de una lista en una posicion especifica.
%Entrada: lista, posicion.
%Salida: elemento de la lista en la posicion especifica.
nElemento([Y|_], 1, Y).

nElemento([_|Xs], N, Y):-
          N2 is N - 1,
          nElemento(Xs, N2, Y).


%Rep: remplaza un elemento de la lista por otro.
%Entrada: lista, elemento a remplazar.
%Salida: lista con el elemento remplazado.
rep([], _, []).
rep([X|Xs], Vars, [Y|Ys]) :- 
  (member(X=Y, Vars), ! ; X=Y), 
  rep(Xs, Vars, Ys).

%Find: busca un elemento en una lista que sea un numero.
%Entrada: lista.
%Salida: el elemento numerico encontrado.

find([],[]).
find([H|T], [H|NewT]) :-
    number(H),
    find(T, NewT).
find([H|T], NewT) :-
    \+ number(H),
    find(T, NewT).

%Remplaza un elemento de la lista por otro.
%Entrada: lista, elemento a remplazar.
%Salida: lista con el elemento remplazado.
replaceP(_, _, [], []).
replaceP(O, R, [O|T], [R|T2]) :- replaceP(O, R, T, T2).
replaceP(O, R, [H|T], [H|T2]) :- dif(H,O), replaceP(O, R, T, T2).

%Remplaza un elemento numerico de una lista por la palabra numero.
remplazarNumeros(ENTRADA,SALIDA):-
    find(ENTRADA,X),
    nElemento(X,1,Y),replaceP(Y,numero,ENTRADA,SALIDA).

remplazarNumeros(ENTRADA,SALIDA):-
    SALIDA = ENTRADA.