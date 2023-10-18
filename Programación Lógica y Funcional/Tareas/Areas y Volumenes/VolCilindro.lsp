(defvar *volumencilindro* (lambda (radio altura)  (* pi (* radio radio) altura)))

(defun pedirDatos()
   (princ "Dame el Radio del Cilindro:")
   (setq radio (read))
   (princ "Dame la altura del Cilindro:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindro* radio altura))
)
#|
Este código Lisp define una variable global *volumencilindro* que almacena una función anónima (lambda) para calcular el volumen de un cilindro. 
Luego, define una función llamada pedirDatos que solicita al usuario el radio y la altura del cilindro, 
calcula el volumen utilizando la función almacenada en *volumencilindro* 
y muestra el resultado formateado en unidades cúbicas con dos decimales.
 |#