:-consult(grafo).
iniciar():-
    write("Bienvenido a TravelAgencyLog la mejor logica de llegar a su destino"),nl,
    write("Por Favor indiqueme cual es el origen de su vuelo"),nl,
    readln(X,_,_,_,lowercase),
    write(X).




buscarConexion(LUGAR,LUGAR2,TOTAL,CAMINO):-
    arco(_,_,LUGAR,LUGAR2,_,_,COSTO), TOTAL is COSTO, CAMINO=[LUGAR,LUGAR2],write("Su vuelo es de").

buscarConexion(LUGAR,LUGAR2,TOTAL,CAMINO):-
    arco(_,_,LUGAR,LUGAR3,_,_,COSTO), buscarConexion(LUGAR3,LUGAR2,COSTO1,CAMINO1), TOTAL is (COSTO+COSTO1),
    nl, 
    CAMINO=[LUGAR|CAMINO1].
