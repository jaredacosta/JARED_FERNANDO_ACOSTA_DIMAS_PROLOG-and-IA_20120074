~~~
(defvar *areapentagono* (lambda (perimetro apotema)  (/ (* perimetro apotema) 2)))

(defun pedirDatos()
   (princ "Dame el Perimetro:")
   (setq perimetro (read))
   (princ "Dame la Apotema:")
   (setq apotema (read))
   (format t "El resultado es ~,2F unidades cuadradas" (funcall *areapentagono* perimetro apotema))
)
~~~

<h3>El código define una función pedirDatos que calcula y muestra el área de un pentágono regular. 
Utiliza una función lambda llamada *areapentagono* que toma la longitud del perímetro 
y la longitud de la apotema como argumentos para calcular el área del pentágono utilizando la fórmula estándar. 
Luego, muestra el resultado en la consola después de solicitar al usuario la información necesaria.</h3>
