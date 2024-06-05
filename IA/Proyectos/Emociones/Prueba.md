## Prueba.ipynb

~~~
import cv2 as cv
import os 
faceRecognizer = cv.face.LBPHFaceRecognizer_create()
faceRecognizer.read('C:\\Users\\jared\Caras\\XML2\\LBPHPnuevo.xml')
dataSet = 'C:\\Users\\jared\\Caras\\Personas2'
faces  = os.listdir(dataSet)
cap = cv.VideoCapture(0)
rostro = cv.CascadeClassifier('haarcascade_frontalface_alt.xml')
while True:
    ret, frame = cap.read()
    if ret == False: break
    gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    cpGray = gray.copy()
    rostros = rostro.detectMultiScale(gray, 1.3, 5)
    for(x, y, w, h) in rostros:
        frame2 = cpGray[y:y+h, x:x+w]
        frame2 = cv.resize(frame2,  (100,100), interpolation=cv.INTER_CUBIC)
        result = faceRecognizer.predict(frame2)
        cv.putText(frame, '{}'.format(result), (x,y-20), 1,3.3, (255,255,0), 1, cv.LINE_AA)
        if result[1] < 100:
            cv.putText(frame,'{}'.format(faces[result[0]]),(x,y-25),2,1.1,(0,255,0),1,cv.LINE_AA)
            cv.rectangle(frame, (x,y),(x+w,y+h),(0,255,0),2)
        else:
            cv.putText(frame,'Desconocido',(x,y-20),2,0.8,(0,0,255),1,cv.LINE_AA)
            cv.rectangle(frame, (x,y),(x+w,y+h),(0,0,255),2) 
    cv.imshow('frame', frame)
    k = cv.waitKey(1)
    if k == 27:
        break
cap.release()
cv.destroyAllWindows()
~~~

<h3>Este código en Python realiza el reconocimiento facial en tiempo real utilizando un modelo LBPH previamente entrenado. A continuación, se explica paso a paso lo que hace:

Importa las bibliotecas necesarias:

cv2 para el procesamiento de imágenes.
os para interactuar con el sistema de archivos.
Carga el modelo LBPH entrenado:

Se crea un objeto LBPHFaceRecognizer.
Se lee el modelo entrenado desde el archivo XML especificado.
Define rutas y variables:

dataSet es la ruta del directorio donde se encuentran las imágenes de las caras.
faces es una lista de subdirectorios en dataSet, cada uno correspondiente a una persona diferente.
Inicializa la captura de video y el clasificador de rostros:

cap se utiliza para capturar video desde la cámara web (índice 0).
rostro es un clasificador de rostros basado en el algoritmo Haar Cascade.
Bucle principal para el reconocimiento facial en tiempo real:

Captura cada fotograma de la cámara web.
Convierte el fotograma a escala de grises.
Detecta los rostros en el fotograma utilizando el clasificador Haar Cascade.
Para cada rostro detectado:
Extrae la región del rostro.
Redimensiona la imagen del rostro a 100x100 píxeles.
Utiliza el modelo LBPH para predecir la identidad del rostro.
Muestra la etiqueta predicha y un rectángulo alrededor del rostro en el fotograma si la predicción es confiable (umbral < 100).
Si la predicción no es confiable, etiqueta el rostro como "Desconocido" y dibuja un rectángulo rojo.
Muestra el fotograma con las anotaciones en una ventana:

La ventana se actualiza en cada iteración del bucle.
El bucle se rompe si se presiona la tecla ESC (código 27).
Libera recursos y cierra ventanas:

Se libera la captura de video.
Se destruyen todas las ventanas de OpenCV.
En resumen, este código captura video en tiempo real desde la cámara web, detecta rostros en cada fotograma, utiliza un modelo LBPH para reconocer las caras, y muestra los resultados en una ventana con anotaciones.</h3>