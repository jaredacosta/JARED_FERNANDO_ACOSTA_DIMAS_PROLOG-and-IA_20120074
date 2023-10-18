#padres y nombre
padre(juan). #predicados unarios
padre(antonio).
padre(luiso).   
padre(eduardo).
#madre con su nombre
madre(luisa).
#padre de, (nombre del padre o madre X y el nombre de su hijo Y)
padrede(pedro,juan).
padrede(juan,julio). #predicados binarios
padrede(juan, jose).
madrede(luisa,maria).
#abuelo
abuelo(X,Y):-padrede(X,W),padrede(W,Y).  #, es un AND ; es un OR
#trace