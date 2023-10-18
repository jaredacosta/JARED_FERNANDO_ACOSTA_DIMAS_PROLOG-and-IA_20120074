# Hechos: Definición de las nacionalidades
nacionalidad(britanico).
nacionalidad(noruego).
nacionalidad(sueco).
nacionalidad(danes).
nacionalidad(aleman).

# Hechos: Definición de las mascotas
mascota(perro).
mascota(pajaro).
mascota(caballo).
mascota(gato).
mascota(pez).

# Hechos: Definición de las bebidas
bebida(te).
bebida(cafe).
bebida(leche).
bebida(cerveza).
bebida(agua).

# Hechos: Definición de los colores de las casas
color(roja).
color(azul).
color(amarilla).
color(blanca).
color(verde).

# Hechos: Definición de los cigarrillos
cigarro(prince).
cigarro(dunhill).
cigarro(blends).
cigarro(bluemaster).
cigarro(pallMall).

# Hecho: Definición de las alturas de las casas
altura(N) :- between(1, 5, N).

# Predicado principal para encontrar la solución
solucion(Solucion) :-
    posibleVecindario(Solucion),     # Genera un vecindario posible
    validarSolucion(Solucion).       # Valida si es una solución válida

# Genera un vecindario posible
posibleVecindario(Vecindario) :-
    posibleCasa(Casa1),
    posibleCasa(Casa2),
    posibleCasa(Casa3),
    posibleCasa(Casa4),
    posibleCasa(Casa5),
    Vecindario = [Casa1, Casa2, Casa3, Casa4, Casa5],
    validarVecindario(Vecindario).

# Genera una casa posible
posibleCasa(Casa) :-
    altura(Altura),
    color(Color),
    nacionalidad(Nacionalidad),
    bebida(Bebida),
    cigarro(Cigarro),
    mascota(Mascota),
    Casa = casa(Altura, Color, Nacionalidad, Bebida, Cigarro, Mascota),
    validarCasa(Casa).

# Validaciones

# Valida cada casa según las restricciones
validarCasa(Casa) :- forall(restriccionCasa(RestriccionCasa), cumple(RestriccionCasa, Casa)).

# Valida el vecindario completo según las restricciones
validarVecindario(Vecindario) :- forall(restriccionVecindario(RestriccionVecindario), apply(RestriccionVecindario, [Vecindario])).

# Valida la solución completa
validarSolucion(Solucion) :-
    validarAlturas(Solucion),
    validarColores(Solucion),
    validarNacionalidades(Solucion),
    validarBebidas(Solucion),
    validarCigarros(Solucion),
    validarMascotas(Solucion).

# Validaciones para atributos específicos
validarAlturas(Solucion) :- forall(altura(Altura), member(casa(Altura, _, _, _, _, _), Solucion)).
validarColores(Solucion) :- forall(color(Color), member(casa(_, Color, _, _, _, _), Solucion)).
validarNacionalidades(Solucion) :- forall(nacionalidad(Nacionalidad), member(casa(_, _, Nacionalidad, _, _, _), Solucion)).
validarBebidas(Solucion) :- forall(bebida(Bebida), member(casa(_, _, _, Bebida, _, _), Solucion)).
validarCigarros(Solucion) :- forall(cigarro(Cigarro), member(casa(_, _, _, _, Cigarro, _), Solucion)).
validarMascotas(Solucion) :- forall(mascota(Mascota), member(casa(_, _, _, _, _, Mascota), Solucion).

# Restricciones para las casas
restriccionCasa([nacionalidadCasa(britanico), colorCasa(roja)]). # 1. El británico vive en la casa roja
restriccionCasa([nacionalidadCasa(sueco), mascotaCasa(perro)]). # 2. El sueco tiene un perro como mascota
restriccionCasa([nacionalidadCasa(danes), bebidaCasa(te)]). # 3. El danés toma té
restriccionCasa([nacionalidadCasa(noruego), alturaCasa(1)]). # 4. El noruego vive en la primera casa
restriccionCasa([nacionalidadCasa(aleman), cigarroCasa(prince)]). # 5. El alemán fuma Prince
restriccionCasa([colorCasa(verde), bebidaCasa(cafe)]). # 7. El dueño de la casa verde bebe café
restriccionCasa([cigarroCasa(pallMall), mascotaCasa(pajaro)]). # 8. El propietario que fuma Pall Mall cría pájaros
restriccionCasa([colorCasa(amarilla), cigarroCasa(dunhill)]). # 9. El dueño de la casa amarilla fuma Dunhill
restriccionCasa([alturaCasa(3), bebidaCasa(leche)]). # 10. El hombre que vive en la casa del centro bebe leche
restriccionCasa([cigarroCasa(bluemaster), bebidaCasa(cerveza)]). # 13. El propietario que fuma Bluemaster toma cerveza

# Restricciones para el vecindario
restriccionVecindario(cumpleVecindario(colorCasa(verde), colorCasa(blanca), estaALaIzq)). # 6. La casa verde está inmediatamente a la izquierda de la blanca
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), mascotaCasa(gato), sonVecinos)). # 11. El vecino que fuma Blends vive al lado del que tiene un gato
restriccionVecindario(cumpleVecindario(mascotaCasa(caballo), cigarroCasa(dunhill), sonVecinos)). # 12. El hombre que tiene un caballo vive al lado del que fuma Dunhill
restriccionVecindario(cumpleVecindario(cigarroCasa(blends), bebidaCasa(agua), sonVecinos)). # 14. El vecino que fuma Blends vive al lado del que toma agua
restriccionVecindario(cumpleVecindario(nacionalidadCasa(noruego), colorCasa(azul), sonVecinos)). # 15. El noruego vive al lado de la casa azul

# Predicado para verificar si una restricción afecta a una casa
afecta(RestriccionCasa, Casa) :-
        member(Condicion, RestriccionCasa),
        apply(Condicion, [Casa]).

# Verifica si se cumple una restricción en una casa
cumple(RestriccionCasa, Casa) :- not(afecta(RestriccionCasa, Casa)).
cumple(RestriccionCasa, Casa) :-
    afecta(RestriccionCasa, Casa),
    forall(member(Condicion, RestriccionCasa), apply(Condicion, [Casa])).

# Definición de las relaciones entre las casas en el vecindario
cumpleVecindario(Cond1, Cond2, Relacion, Solucion) :-
    member(Casa1, Solucion),
    apply(Cond1, [Casa1]),
    member(Casa2, Solucion),
    apply(Cond2, [Casa2]),
    apply(Relacion, [Casa1, Casa2]).

# Predicados para acceder a atributos específicos de una casa
alturaCasa(Altura, casa(Altura, _, _, _, _, _)).
colorCasa(Color, casa(_, Color, _, _, _, _)).
nacionalidadCasa(Nacionalidad, casa(_, _, Nacionalidad, _, _, _)).
bebidaCasa(Bebida, casa(_, _, _, Bebida, _, _)).
cigarroCasa(Cigarro, casa(_, _, _, _, Cigarro, _)).
mascotaCasa(Mascota, casa(_, _, _, _, _, Mascota)).

# Definición de las relaciones de vecindad
sonVecinos(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    alturasVecinas(N, M).
    
estaALaIzq(Casa1, Casa2) :-
    alturaCasa(N, Casa1),
    alturaCasa(M, Casa2),
    izquierda(N, M).

# Verifica si dos alturas son vecinas
alturasVecinas(Altura1, Altura2) :- izquierda(Altura1, Altura2).
alturasVecinas(Altura1, Altura2) :- izquierda(Altura2, Altura1).

# Verifica si la segunda altura está a la izquierda de la primera
izquierda(Altura1, Altura2) :- Altura1 is Altura2 - 1.
