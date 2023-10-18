(defvar *arearectangulo* (lambda (base altura) (* base altura)))

(defun pedirDatos()
   (princ "Dame la base del rectangulo:")
   (setq base (read))
   (princ "Dame la altura del rectangulo:")
   (setq altura (read))
   (format t "El resultado es ~A unidades cuadradas" (funcall *arearectangulo* base altura))
)
#| 
El código define una función pedirDatos que solicita al usuario la base y la altura de un rectángulo 
y utiliza una función lambda *arearectangulo* para calcular y mostrar el área del rectángulo. 
La función lambda toma la base y la altura como argumentos y devuelve el área del rectángulo multiplicando ambos valores. 
El resultado se muestra en la consola utilizando la función format.
|#