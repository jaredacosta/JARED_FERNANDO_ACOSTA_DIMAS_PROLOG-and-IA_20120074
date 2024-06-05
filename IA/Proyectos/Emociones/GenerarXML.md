## GenerarXML.ipynb

~~~
#Este es el código para generar el archivo XML con lbph:

import cv2 as cv 
import numpy as np 
import os

dataSet = 'C:\\Users\\jared\\Caras\\Personas2'
faces  = os.listdir(dataSet)
print(faces)

labels = []
facesData = []
label = 0 
for face in faces:
    facePath = dataSet+'\\'+face
    for faceName in os.listdir(facePath):
        labels.append(label)
        facesData.append(cv.imread(facePath+'\\'+faceName,0))
    label = label + 1
#print(np.count_nonzero(np.array(labels)==0)) 
faceRecognizer = cv.face.LBPHFaceRecognizer_create()
faceRecognizer.train(facesData, np.array(labels))
faceRecognizer.write('C:\\Users\\jared\\Caras\\XML2\\LBPHPnuevo.xml')
print('Termine')

~~~

<h3>Este código en Python realiza las siguientes tareas para generar un archivo XML con un modelo de reconocimiento facial utilizando el método LBPH (Local Binary Patterns Histograms):

Importa librerías necesarias: cv2 para procesamiento de imágenes, numpy para operaciones numéricas, y os para interactuar con el sistema de archivos.

Define rutas y variables:

dataSet es la ruta al directorio donde se encuentran las imágenes de las caras organizadas por carpetas.
faces es una lista de subdirectorios en dataSet, cada uno correspondiente a una persona diferente.
Inicializa listas y variables:

labels almacenará las etiquetas de las caras.
facesData almacenará las imágenes de las caras.
label es un contador que asigna etiquetas numéricas a las carpetas.
Lee las imágenes y asigna etiquetas:

Para cada carpeta en faces, se obtiene su ruta y se leen todas las imágenes en esa carpeta.
Se agrega una etiqueta numérica (asignada por label) a cada imagen y se guarda la imagen en facesData.
Entrena el reconocedor facial LBPH:

Se crea un objeto LBPHFaceRecognizer.
Se entrena el reconocedor con los datos de las caras (facesData) y sus correspondientes etiquetas (labels).
Guarda el modelo entrenado en un archivo XML:

El modelo entrenado se guarda en la ruta especificada (C:\\Users\\jared\\Caras\\XML2\\LBPHPnuevo.xml).
Imprime mensajes de estado:

Imprime las carpetas de caras encontradas y un mensaje de finalización al terminar.
En resumen, el código lee imágenes de caras desde subdirectorios, asigna etiquetas a cada imagen, entrena un modelo de reconocimiento facial LBPH con estas imágenes y etiquetas, y guarda el modelo entrenado en un archivo XML.</h3>