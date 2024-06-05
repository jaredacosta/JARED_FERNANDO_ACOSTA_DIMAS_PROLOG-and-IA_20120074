## Si esta o no.ipynb

### Importaciones

~~~
import numpy as np
import cv2 as cv
import os
~~~

### Carga de Imagen

~~~
# Carga la imagen desde una ruta especificada.
image = cv.imread(r'C:\\Users\\jared\\Wally\\1.jpg')

~~~

### Conversión a Escala de Grises

~~~
# Convierte la imagen a escala de grises.
gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)

~~~


### Carga del Clasificador en Cascada

~~~
# Carga el clasificador en cascada desde una ruta especificada.
wally = cv.CascadeClassifier(r'C:\\Users\\jared\\Wally\\cascade.xml')
~~~

### Detección de Objetos

~~~
# Detecta objetos en la imagen usando el clasificador en cascada.
waldo_detections = wally.detectMultiScale(gray,  # Imagen en escala de grises
                                          scaleFactor=1.11,  # Factor de escala para la detección
                                          minNeighbors=10,  # Número de vecinos que debe tener cada rectángulo candidato para retenerlo
                                          minSize=(5,5))  # Tamaño mínimo del objeto a detectar
~~~



### Dibujar Rectángulos y Etiquetas

~~~
# Itera sobre cada detección y dibuja un rectángulo y un texto en la imagen original.
for (x, y, w, h) in waldo_detections:
    cv.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)  # Dibuja un rectángulo verde alrededor del objeto detectado
    cv.putText(image, 'Wally', (x, y-10), cv.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)  # Escribe "Wally" arriba del rectángulo

~~~



### Mostrar la Imagen con Detecciones

~~~
# Muestra la imagen con las detecciones en una ventana.
cv.imshow('¿Donde esta Wally?', image)
cv.waitKey(0)  # Espera una tecla para cerrar la ventana
cv.destroyAllWindows()  # Destruye todas las ventanas creadas por OpenCV

~~~


<h3>Carga y Preprocesamiento de la Imagen:

Importa las bibliotecas necesarias (numpy, cv2, os).
Carga una imagen desde una ruta especificada.
Convierte la imagen cargada a escala de grises.
Carga del Clasificador en Cascada:

Carga un clasificador en cascada previamente entrenado desde un archivo XML especificado.
Detección de "Wally":

Utiliza el clasificador en cascada para detectar objetos en la imagen en escala de grises.
Ajusta parámetros como el factor de escala (scaleFactor), el número mínimo de vecinos (minNeighbors), y el tamaño mínimo del objeto a detectar (minSize).
Marcado de Detecciones en la Imagen:

Itera sobre cada detección encontrada.
Dibuja un rectángulo verde alrededor de cada objeto detectado.
Añade una etiqueta de texto ("Wally") encima de cada rectángulo.
Visualización de Resultados:

Muestra la imagen con las detecciones en una ventana.
Espera una tecla para cerrar la ventana.
Destruye todas las ventanas creadas por OpenCV.
El código carga una imagen, aplica un clasificador en cascada para detectar a "Wally", marca las detecciones con rectángulos y etiquetas, y muestra el resultado.</h3>