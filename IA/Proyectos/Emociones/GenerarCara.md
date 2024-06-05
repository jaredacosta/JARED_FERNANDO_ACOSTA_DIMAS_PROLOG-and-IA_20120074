## GenerarCara.ipynb
~~~
import numpy as np
import cv2 as cv
import math

# Cargar el clasificador de rostros
rostro = cv.CascadeClassifier('C:\\Users\\jared\\Caras\\haarcascade_frontalface_alt.xml')

cap = cv.VideoCapture(0)  # Iniciar la captura de video desde la cámara web
i = 0  # Inicializar un contador

while True:
    ret, frame = cap.read()  # Capturar un frame de la cámara
    gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)  # Convertir el frame a escala de grises
    rostros = rostro.detectMultiScale(gray, 1.3, 5)  # Detectar rostros en la imagen en escala de grises
    
    for(x, y, w, h) in rostros:
        # Extraer la región del rostro detectado
        frame2 = frame[y:y+h, x:x+w]
        # Redimensionar la región del rostro a 100x100 píxeles
        frame2 = cv.resize(frame2, (100, 100), interpolation=cv.INTER_AREA)
        # Mostrar la imagen del rostro detectado
        cv.imshow('rostros encontrados', frame2)
        # Guardar la imagen del rostro en una carpeta específica
        cv.imwrite('C:\\Users\\jared\\Caras\\Personas2\\Triste\\'+str(i)+'.png', frame2)
    
    i = i + 1  # Incrementar el contador
    k = cv.waitKey(1)  # Esperar 1 ms a una tecla
    if k == 27:  # Presionar 'ESC' para salir
        break

cap.release()  # Liberar la captura de video
cv.destroyAllWindows()  # Cerrar todas las ventanas de OpenCV

~~~

<h3> Importación de librerías: Se importan las librerías numpy, cv2, y math.
Carga del clasificador de rostros: Se carga el archivo XML que contiene el clasificador de rostros de Haar.
Captura de video: Se inicia la captura de video desde la cámara web.
Bucle principal: Se entra en un bucle que se ejecuta continuamente.
Lectura del frame: Se captura un frame de la cámara.
Conversión a escala de grises: Se convierte el frame a una imagen en escala de grises para facilitar la detección de rostros.
Detección de rostros: Se detectan rostros en la imagen en escala de grises.
Procesamiento de cada rostro detectado:Se extrae la región del rostro detectado del frame original.
Se redimensiona esta región a un tamaño de 100x100 píxeles.
Se muestra la imagen del rostro detectado.
Se guarda la imagen del rostro en una carpeta específica.
Incremento del contador: Se incrementa un contador para nombrar los archivos de imagen de manera única.
Salir del bucle: Si se presiona la tecla 'ESC', se sale del bucle.
Liberar recursos: Se libera la captura de video y se cierran todas las ventanas de OpenCV. </h3>

<h3>El código captura frames de video desde una cámara web, detecta rostros en cada frame, extrae y redimensiona cada rostro detectado, muestra los rostros encontrados en una ventana y guarda las imágenes de los rostros en una carpeta específica </h3>