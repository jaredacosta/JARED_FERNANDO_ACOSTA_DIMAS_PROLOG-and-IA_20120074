(defvar *volumenparalelepipedo* (lambda (area-base altura)   (* area-base altura)))

(defun pedirDatos()
   (princ "Dame el Area de la Base del Paralelepidedo:")
   (setq area-base (read))
   (princ "Dame la Altura del Paralelepipedo:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumenparalelepipedo* area-base altura))
)

#|
Este código en Lisp Common define una función pedirDatos que calcula el volumen de un paralelepípedo al solicitar 
y leer el área de la base y la altura del usuario, y luego muestra el resultado en la salida estándar. 
El cálculo del volumen se realiza utilizando una función lambda llamada *volumenparalelepipedo*, 
que multiplica el área de la base por la altura.
|#