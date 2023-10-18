<h3>3. Escriba un programa que pida una letra minúscula, el programa deberá
   imprimir si la letra es una vocal (a,e,i,o,u), semivocal (y) o una
   consonante.</h3>
 
### Solicitar una letra al usuario

~~~
(format t "Ingrese una letra minúscula: ")
(setq letra (read))
~~~

### Determinar si la letra es vocal, semivocal o consonante

~~~
(case letra
  ((#\a #\e #\i #\o #\u) (format t "La letra ~c es una vocal.~%" letra))
  (#\y (format t "La letra ~c es una semivocal.~%" letra))
  (t (format t "La letra ~c es una consonante.~%" letra)))
~~~

<h3>Se utiliza case para comparar una variable con múltiples valores posibles.</h3>