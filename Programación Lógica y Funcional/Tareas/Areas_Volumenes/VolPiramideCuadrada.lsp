(defvar *volumenpiramidecuadrada* (lambda (lado-base altura)   (/ (* (expt lado-base 2) altura) 3)))

(defun pedirDatos()
   (princ "Dame el lado de la base de la Piramide Cuadrada:")
   (setq lado-base (read))
   (princ "Dame la altura de la Piramide Cuadrada:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenpiramidecuadrada* lado-base altura))
)
#|
Este código define una variable especial llamada *volumenpiramidecuadrada* que almacena una función anónima que calcula el volumen de una pirámide cuadrada. 
Luego, define una función llamada pedirDatos que solicita al usuario el lado de la base 
y la altura de la pirámide cuadrada, 
y muestra el resultado del cálculo del volumen en unidades cúbicas utilizando la función almacenada en la variable *volumenpiramidecuadrada*.
|#