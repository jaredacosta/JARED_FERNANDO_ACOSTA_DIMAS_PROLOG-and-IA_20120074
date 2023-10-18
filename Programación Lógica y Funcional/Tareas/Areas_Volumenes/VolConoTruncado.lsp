(defvar *volumenconotruncado* (lambda (radio-base-grande radio-base-pequena altura)   (* (/ pi 3) altura (+ (expt radio-base-grande 2) (* radio-base-grande radio-base-pequena) (expt radio-base-pequena 2)))))


(defun pedirDatos()
   (princ "Dame la altura del Cono Truncado:")
   (setq altura (read))
   (princ "Dame el Radio de la base grande del Cono Truncado:")
   (setq radio-base-grande (read))
   (princ "Dame el Radio de la base pequena del Cono Truncado:")
   (setq radio-base-pequena (read))
   
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenconotruncado* radio-base-grande radio-base-pequena altura))
)

#|
Este código define una función llamada pedirDatos que solicita al usuario la altura, 
el radio de la base grande y el radio de la base pequeña de un cono truncado, 
y luego calcula y muestra el volumen del cono truncado utilizando la fórmula correspondiente. 
La fórmula se implementa en la función lambda *volumenconotruncado*, que toma los tres valores ingresados por el usuario 
y realiza el cálculo. El resultado se formatea y muestra en la salida estándar.
|#