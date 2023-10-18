~~~
(defvar *volumencilindrohueco* (lambda (radio-exterior radio-interior altura)   (* pi altura (- (expt radio-exterior 2) (expt radio-interior 2)))))

(defun pedirDatos()
   (princ "Dame el Radio Exterior:")
   (setq radio-exterior (read))
   (princ "Dame el Radio Interior:")
   (setq radio-interior (read))
   (princ "Dame la altura del cilindro hueco:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencilindrohueco* radio-exterior radio-interior altura))
)
~~~


<h3>Este código en Lisp Common define una función llamada pedirDatos que solicita al usuario el radio exterior, 
el radio interior y la altura de un cilindro hueco, y luego calcula 
y muestra el volumen del cilindro utilizando la fórmula adecuada. 
La fórmula se implementa en la función lambda *volumencilindrohueco*, 
que toma los tres valores ingresados por el usuario y realiza el cálculo. 
El resultado se formatea y muestra en la salida estándar.</h3>
