<h3>5. Escriba un programa que pida el numero de mes (del 1 al 12 ) e
   imprima el numero de dias que tiene el mes, donde:

   • El mes 2 tiene 28 dias
   • Los meses 4,6,9 y 11 tienen 30 dias
   • Los meses 1,3,5,7,8,10 y 12 tienen 31 dias

   Si da un mes diferente a los anteriores debera imprimir el mensaje
   “MES ERRONEO”.
 </h3>
 
### Solicitar el número de mes al usuario

~~~
(format t "Ingrese el número de mes (del 1 al 12): ")
(setq mes (read))
~~~

### Determinar el número de días en el mes

~~~
(cond
  ((= mes 2) (format t "El mes 2 tiene 28 días.~%"))
  ((member mes '(4 6 9 11)) (format t "El mes ~a tiene 30 días.~%" mes))
  ((member mes '(1 3 5 7 8 10 12)) (format t "El mes ~a tiene 31 días.~%" mes))
  (t (format t "MES ERRONEO~%"))
~~~

<h3>Se emplea cond para evaluar en qué mes nos encontramos y luego se utiliza if en las ramas de cond para informar el número de días en ese mes.</h3>