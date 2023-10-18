~~~
(defvar *volumentetraedro* (lambda (lado)   (/ (* (expt lado 3) (sqrt 2)) 12)))

(defun pedirDatos()
   (princ "Dame el Lado del Tetraedro:")
   (setq lado (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumentetraedro* lado))
)
~~~

<h3>Este código define una función llamada pedirDatos que solicita al usuario la longitud del lado de un tetraedro 
y luego calcula y muestra el volumen del tetraedro regular utilizando la fórmula correspondiente. 
La fórmula se implementa en la función lambda *volumentetraedro*, 
que toma la longitud del lado ingresada por el usuario y realiza el cálculo. 
El resultado se formatea y muestra en la salida estándar.</h3>
