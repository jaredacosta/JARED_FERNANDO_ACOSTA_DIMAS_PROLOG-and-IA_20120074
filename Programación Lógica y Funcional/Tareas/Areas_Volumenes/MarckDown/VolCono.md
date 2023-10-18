~~~
(defvar *volumencono* (lambda (radio altura)   (* (/ 1 3) pi (* (expt radio 2) altura))))

(defun pedirDatos()
   (princ "Dame el radio del Cono:")
   (setq radio (read))
   (princ "Dame la altura del Cono:")
   (setq altura (read))
   (format t "El resultado es ~,2F unidades cubicas" (funcall *volumencono*  radio altura))
)
~~~

<h3>Este código en Lisp calcula el volumen de un cono a partir del radio 
y la altura ingresados por el usuario utilizando una función anónima (lambda) y funcall para ejecutarla, 
luego muestra el resultado formateado.</h3>
