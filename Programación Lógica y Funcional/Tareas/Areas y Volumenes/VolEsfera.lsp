(defvar *volumenesfera* (lambda (radio)   (* (/ 4 3) pi (expt radio 3))))

(defun pedirDatos()
   (princ "Dame el Radio de la Esfera:")
   (setq radio (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenesfera* radio))
)

#|
Este código en Lisp calcula el volumen de una esfera utilizando una función anónima (lambda) para aplicar la fórmula 4/3*pi*r^3
 ,donde "r" es el radio ingresado por el usuario. 
 La función pedirDatos solicita al usuario ingresar el radio de la esfera, 
 luego llama a la función para calcular el volumen 
 y muestra el resultado formateado en unidades cúbicas.
|#