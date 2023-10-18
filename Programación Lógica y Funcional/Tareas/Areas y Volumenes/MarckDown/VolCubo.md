~~~
(defvar *volumencubo* (lambda (lado) (* lado lado lado)))

(defun pedirDatos()
   (princ "Dame el lado del cuadrado:")
   (setq lado (read))
   (format t "El resultado es ~A unidades cubicas" (funcall *volumencubo* lado))
)
~~~

<h3>Este código Lisp define una variable global *volumencubo* que almacena una función anónima (lambda) para calcular el volumen de un cubo. 
Luego, define una función llamada pedirDatos que solicita al usuario la longitud del lado del cubo, 
calcula el volumen utilizando la función almacenada en *volumencubo* 
y muestra el resultado en unidades cúbicas.</h3>
