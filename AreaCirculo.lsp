(defvar *areacirculo* (lambda (radio)  (* pi (* radio radio))))

(defun pedirDatos()
   (princ "Dame el radio del Circulo:")
   (setq radio (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *areacirculo* radio))
)

#|
Este código define una función llamada pedirDatos que solicita al usuario el radio de un círculo, 
utiliza una función lambda llamada *areacirculo* para calcular y muestra el área del círculo. 
El área del círculo se calcula utilizando la fórmula π * radio^2, 
y el resultado se muestra en la consola con dos decimales.
 |#