
<h3>2. Escriba un programa para determinar si un solicitante puede lograr un
   préstamo. Deberá pedir los siguientes datos para cada solicitante:
   Nombre, historia crediticia(‘b’buena o ‘m’ mala), cantidad pedida,
   salario anual, y valor de otras propiedades.  El banco solo
   considerará a los solicitantes con un estado de crédito bueno.  De
   aquellos, solo aceptara los que tengan mas de 6 puntos.  Los puntos
   se obtienen como sigue: 5 puntos si el salario es 50% del préstamo o
   más.  3 puntos si el salario es por lo menos 25% pero menos de 50%
   del préstamo.  1 punto si el salario es por lo menos 10% pero menos
   de 25% del préstamo.  5 puntos si se tiene otra propiedad del doble
   del préstamo o mas.  3 puntos si se tiene otra propiedad igual al
   préstamo pero menor del doble.</h3>

### Solicitar información del solicitante

~~~
(format t "Ingrese el nombre del solicitante: ")
(setq nombre (read))
(format t "Ingrese la historia crediticia ('b' buena o 'm' mala): ")
(setq historia-crediticia (read))
(format t "Ingrese la cantidad pedida: ")
(setq cantidad-pedida (read))
(format t "Ingrese el salario anual: ")
(setq salario-anual (read))
(format t "Ingrese el valor de otras propiedades: ")
(setq valor-propiedades (read))
~~~

### Evaluar si el solicitante es elegible para el préstamo

~~~
(cond
  ((and (equal historia-crediticia 'b) (> (calcular-puntos salario-anual cantidad-pedida valor-propiedades) 6))
   (format t "El solicitante ~a es elegible para el préstamo.~%" nombre))
  (t (format t "El solicitante ~a no es elegible para el préstamo.~%" nombre)))
~~~

### Función para calcular los puntos del solicitante

~~~
(defun calcular-puntos (salario cantidad-propiedades valor-propiedades)
  (+
   (cond
     ((>= salario (* 0.5 cantidad-propiedades)) 5)
     ((and (>= salario (* 0.25 cantidad-propiedades)) (< salario (* 0.5 cantidad-propiedades))) 3)
     ((and (>= salario (* 0.1 cantidad-propiedades)) (< salario (* 0.25 cantidad-propiedades))) 1)
     (t 0))
   (cond
     ((>= valor-propiedades (* 2 cantidad-propiedades)) 5)
     ((and (= valor-propiedades (* 2 cantidad-propiedades)) (< valor-propiedades (* 2 cantidad-propiedades))) 3)
     (t 0))))
~~~

<h3>Se emplea cond para evaluar las condiciones de elegibilidad del solicitante.
Se usa if para comprobar si la historia crediticia es buena y si los puntos calculados son mayores a 6. </h3>