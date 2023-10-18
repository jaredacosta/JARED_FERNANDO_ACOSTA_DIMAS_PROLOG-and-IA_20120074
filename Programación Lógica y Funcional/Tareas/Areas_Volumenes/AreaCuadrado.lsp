(defvar *areacuadrado* (lambda (num1 num2) (* num1 num2)))

(defun pedirDatos()
   (princ "Dame el lado del cuadrado:")
   (setq num1 (read))
   (princ "Dame el otro lado del cuadrado:")
   (setq num2 (read))
   (format t "El resultado es ~A unidades cuadradas" (funcall *areacuadrado* num1 num2))
)

#|
El código define una función llamada pedirDatos que solicita al usuario dos lados de un cuadrado, 
utiliza una función lambda llamada *areacuadrado* para calcular y mostrar el área del cuadrado. 
La función lambda toma dos argumentos, num1 y num2, que representan los lados del cuadrado, y devuelve el área del cuadrado multiplicando ambos lados (num1 y num2).
En resumen, este código calcula el área de un cuadrado cuando se le proporcionan dos lados y lo muestra en la consola
 |#
