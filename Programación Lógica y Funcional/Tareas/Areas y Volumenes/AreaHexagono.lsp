(defvar *areahexagono* (lambda (perimetro apotema)  (/ (* perimetro apotema) 2)))

(defun pedirDatos()
   (princ "Dame el Perimetro:")
   (setq perimetro (read))
   (princ "Dame la Apotema:")
   (setq apotema (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *areahexagono* perimetro apotema))
)

#|
El código define una función pedirDatos en Lisp para calcular y mostrar el área de un hexágono regular. 
Utiliza una función lambda llamada *areahexagono* que toma el perímetro 
y la apotema como argumentos para calcular el área del hexágono. 
Luego, muestra el resultado en la consola después de solicitar al usuario la información necesaria.
 |#