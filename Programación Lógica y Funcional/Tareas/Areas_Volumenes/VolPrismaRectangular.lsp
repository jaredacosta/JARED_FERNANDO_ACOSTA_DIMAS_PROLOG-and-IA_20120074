(defvar *volumenprismarectangular* (lambda (area-base altura) (* area-base altura)))

(defun pedirDatos()
   (princ "Dame el area de la base del prisma cuadrangular:")
   (setq area-base (read))
   (princ "Dame la altura del prisma cuadrangular:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenprismarectangular* area-base altura))
)

#|
Este código en Lisp calcula el volumen de un prisma rectangular utilizando una función anónima (lambda) que multiplica el área de la base por la altura. 
La función pedirDatos solicita al usuario ingresar el área de la base 
y la altura del prisma rectangular, 
luego calcula y muestra el resultado formateado en unidades cúbicas.
|#