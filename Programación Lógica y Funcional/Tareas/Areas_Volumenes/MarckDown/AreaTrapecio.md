~~~
(defvar *calcular-area-trapecio*
  (lambda (base-mayor base-menor altura)
    (* (/ (+ base-mayor base-menor) 2) altura)))

(defvar *pedir-datos-y-calcular-area*
  (lambda ()
    (princ "Dame la longitud de la base mayor: ")
    (setq base-mayor (read))
    (princ "Dame la longitud de la base menor: ")
    (setq base-menor (read))
    (princ "Dame la altura: ")
    (setq altura (read))
    (let ((area (funcall *calcular-area-trapecio* base-mayor base-menor altura)))
      (format t "El Area del trapecio es ~,2F unidades cuadradas" area))))


(funcall *pedir-datos-y-calcular-area*) 
~~~   

<h3>Este código en Lisp utiliza lambdas para calcular y mostrar el área de un trapecio a partir de las longitudes de la base mayor, 
la base menor y la altura proporcionadas por el usuario. 
Las lambdas se almacenan en las variables *calcular-area-trapecio* y *pedir-datos-y-calcular-area*, 
y se utiliza funcall para ejecutar el programa.</h3>
