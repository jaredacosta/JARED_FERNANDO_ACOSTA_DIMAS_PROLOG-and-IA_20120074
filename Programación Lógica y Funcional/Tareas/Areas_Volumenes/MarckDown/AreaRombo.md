~~~
(defvar *arearombo* (lambda (diagonal-mayor diagonal-menor)  (/ (* diagonal-mayor diagonal-menor) 2)))

(defun pedirDatos()
   (princ "Dame la Diagonal Mayor:")
   (setq diagonal-mayor (read))
   (princ "Dame la Diagonal Menor:")
   (setq diagonal-menor (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *arearombo* diagonal-mayor diagonal-menor))
)
~~~


<h3>El código que proporcionaste define una función pedirDatos que solicita al usuario la longitud de la diagonal mayor 
y la longitud de la diagonal menor de un rombo, 
y luego utiliza una función lambda *arearombo* para calcular y mostrar el área del rombo. 
La función lambda toma la longitud de la diagonal mayor y 
la longitud de la diagonal menor como argumentos y devuelve el área del rombo utilizando la fórmula estándar:</h3>
