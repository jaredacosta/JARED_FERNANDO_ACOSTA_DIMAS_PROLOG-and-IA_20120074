(defvar *areaparalelogramo* (lambda (base altura) (* base altura)))

(defun pedirDatos()
   (princ "Dame la base del paralelogramo:")
   (setq base (read))
   (princ "Dame la altura del paralelogramo:")
   (setq altura (read))
   (format t "El resultado es ~A unidades cuadradas" (funcall *areaparalelogramo* base altura))
)
#|
El código define una función llamada pedirDatos en Lisp que calcula y muestra el área de un paralelogramo. 
Utiliza una función lambda llamada *areaparalelogramo* que toma la longitud de la base 
y la altura del paralelogramo como argumentos y calcula el área multiplicando ambos valores. 
Luego, solicita al usuario ingresar la longitud de la base y la altura y muestra el resultado en la consola en formato decimal con la etiqueta "unidades cuadradas".
|#
