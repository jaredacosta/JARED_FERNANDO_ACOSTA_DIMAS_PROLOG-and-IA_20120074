~~~
(defvar *areatriangulo* (lambda (base altura) (/ (* base altura) 2)))

(defun pedirDatos()
   (princ "Dame la base del triangulo:")
   (setq base (read))
   (princ "Dame la altura del triangulo:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *areatriangulo* base altura))
)
~~~


<h3>El código define una función llamada pedirDatos que solicita al usuario la base y la altura de un triángulo,
 y luego utiliza una función lambda llamada *areatriangulo* para calcular y mostrar el área del triángulo. 
 La función lambda toma la base y la altura como argumentos y devuelve el área usando la fórmula estándar del área de un triángulo: (base * altura) / 2.</h3>

