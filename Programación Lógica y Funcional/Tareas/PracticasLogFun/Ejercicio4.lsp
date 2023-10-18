#|4. Para determinar si un año es bisiesto o no debe de cumplir las
   siguiente regla: Ser divisible entre 4 y no divisible entre 100 o
   bien divisible entre 400.  Escriba un programa que pida como entrada
   el año e imprima si el año es bisiesto o no.
 |#
; Solicitar un año al usuario
(format t "Ingrese un año: ")
(setq año (read))

; Comprobar si el año es bisiesto o no
(if (or (and (divisible-p año 4) (not (divisible-p año 100))) (divisible-p año 400))
    (format t "El año ~a es bisiesto.~%" año)
    (format t "El año ~a no es bisiesto.~%" año))

; Función para verificar si un número es divisible por otro
(defun divisible-p (num divisor)
  (= (mod num divisor) 0))

#|Se utiliza if para evaluar si se cumple una de las condiciones que determinan si un año es bisiesto. |# 