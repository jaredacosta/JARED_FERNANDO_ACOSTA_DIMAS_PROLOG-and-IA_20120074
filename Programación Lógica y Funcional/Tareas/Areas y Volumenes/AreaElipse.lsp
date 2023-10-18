(defvar *areaelipse* (lambda (radio-mayor radio-menor)   (* pi radio-mayor radio-menor)))

(defun pedirDatos()
   (princ "Dame el Radio Mayor:")
   (setq radio-mayor (read))
   (princ "Dame el Radio Menor:")
   (setq radio-menor (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *areaelipse* radio-mayor radio-menor))
)

#|
Este código Lisp define una variable global llamada *areaelipse* que almacena una función lambda para calcular el área de una elipse. 
Luego, define una función pedirDatos que interactúa con el usuario para obtener los valores de los radios mayor y menor de la elipse, 
realiza el cálculo y muestra el resultado en unidades cuadradas utilizando la función format.
 |#