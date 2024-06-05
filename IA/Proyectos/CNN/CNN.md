## CNN.ipynb

~~~
import numpy as np
import os
import re
import matplotlib.pyplot as plt
%matplotlib inline
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report
import tensorflow as tf
from tensorflow.keras.utils import to_categorical
from keras.models import Sequential, Model
from tensorflow.keras.layers import Input, BatchNormalization, SeparableConv2D, MaxPooling2D, Activation, Flatten, Dropout, Dense, Conv2D
from keras.layers import LeakyReLU

# Cargar y preprocesar imágenes
dirname = os.path.join(os.getcwd(), r'C:\\Users\\jared\\CNN\\Imagenes')
imgpath = dirname + os.sep 
images, directories, dircount = [], [], []
prevRoot = ''
cant = 0

print("Leyendo imágenes de", imgpath)

for root, dirnames, filenames in os.walk(imgpath):
    for filename in filenames:
        if re.search("\\.(jpg|jpeg|png|bmp|tiff)$", filename):
            cant += 1
            filepath = os.path.join(root, filename)
            image = plt.imread(filepath)
            if len(image.shape) == 3:
                images.append(image)
            if prevRoot != root:
                print(root, cant)
                prevRoot = root
                directories.append(root)
                dircount.append(cant)
                cant = 0
dircount.append(cant)
dircount = dircount[1:]
dircount[0] += 1
print('Directorios leídos:', len(directories))
print("Imágenes en cada directorio", dircount)
print('Suma total de imágenes en subdirs:', sum(dircount))

# Crear etiquetas
labels = []
indice = 0
for cantidad in dircount:
    for i in range(cantidad):
        labels.append(indice)
    indice += 1
print("Cantidad de etiquetas creadas:", len(labels))

# Asignar categorías
risk = []
indice = 0
for directorio in directories:
    name = directorio.split(os.sep)
    print(indice, name[-1])
    risk.append(name[-1])
    indice += 1
categorias = risk

# Preparar datos para el modelo
X = np.array(images, dtype=np.uint8)
Y = np.array(labels, dtype=np.uint8)
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25, random_state=42)

Y_train = to_categorical(Y_train)
Y_test = to_categorical(Y_test)

# Definir y entrenar el modelo
model = Sequential()
inputShape = (X_train.shape[1], X_train.shape[2], X_train.shape[3])
chanDim = -1

model.add(Conv2D(32, (3, 3), padding="same", input_shape=inputShape))
model.add(Activation("relu"))
model.add(BatchNormalization(axis=chanDim))
model.add(MaxPooling2D(pool_size=(3, 3)))
model.add(Dropout(0.25))

model.add(Conv2D(64, (3, 3), padding="same"))
model.add(Activation("relu"))
model.add(BatchNormalization(axis=chanDim))
model.add(Conv2D(64, (3, 3), padding="same"))
model.add(Activation("relu"))
model.add(BatchNormalization(axis=chanDim))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Dropout(0.25))

model.add(Flatten())
model.add(Dense(512))
model.add(Activation("relu"))
model.add(BatchNormalization())
model.add(Dropout(0.5))

model.add(Dense(len(directories)))
model.add(Activation("softmax"))

model.compile(loss="categorical_crossentropy", optimizer="adam", metrics=["accuracy"])

H = model.fit(X_train, Y_train, validation_data=(X_test, Y_test), epochs=50, batch_size=32)

# Evaluar el modelo
predictions = model.predict(X_test, batch_size=32)
print(classification_report(Y_test.argmax(axis=1), predictions.argmax(axis=1), target_names=categorias))

# Cargar modelo y predecir nuevas imágenes
from tensorflow.keras.models import load_model
risk_model = load_model('C:\\\\Users\\\\jared\\CNN\\modelo\\\\risk_model.keras')

risk = ['tornados', 'Asaltos', 'inundaciones', 'incendio', 'robo']
categoria = ['incendio', 'inundacion', 'inundacion', 'asalto', 'inundacion', 'incendio']
filenames = [r'C:\\Users\\jared\\CNN\\prueba\\sistema.jpg', r'C:\\Users\\jared\\CNN\\prueba\\inunda.jpg', r'C:\\Users\\jared\\CNN\\prueba\\R.jpg', r'C:\\Users\\jared\\CNN\\prueba\\asalto.jpg', r'C:\\Users\\jared\\CNN\\prueba\\2.jpg', r'C:\\Users\\jared\\CNN\\prueba\\3.jpg']

images = []
for filepath in filenames:
    image = plt.imread(filepath)
    image_resized = resize(image, (28, 28), anti_aliasing=True, clip=False, preserve_range=True)
    images.append(image_resized)

X = np.array(images, dtype=np.uint8)
test_X = X.astype('float32')
test_X = test_X / 255.

predicted_classes = risk_model.predict(test_X)
for i, img_tagged in enumerate(predicted_classes):
    print(filenames[i], risk[img_tagged.tolist().index(max(img_tagged))])
    img = plt.imread(filenames[i])
    plt.figure(figsize=(6, 6))
    plt.imshow(img)
    plt.title(f"Real: {categoria[i]}  Predicción: {risk[img_tagged.tolist().index(max(img_tagged))]}")
    plt.show()

~~~


<h3>Importaciones y Configuración Inicial:

Importa las bibliotecas necesarias (numpy, os, re, matplotlib, sklearn, tensorflow, keras).
Configura el entorno para mostrar gráficos en línea en el notebook.
Carga y Preprocesamiento de Imágenes:

Define la ruta del directorio que contiene las imágenes.
Recorre el directorio y sus subdirectorios para leer las imágenes y almacenarlas en una lista.
Imprime la estructura del directorio y la cantidad de imágenes leídas en cada subdirectorio.
Etiquetado de Imágenes:

Crea etiquetas (labels) para cada imagen basada en el subdirectorio donde se encuentra.
Asocia nombres de categorías de riesgo a los índices de los subdirectorios.
Preparación de Datos para el Modelo:

Divide las imágenes y sus etiquetas en conjuntos de entrenamiento y prueba.
Convierte las etiquetas a formato categórico adecuado para la red neuronal.
Definición y Entrenamiento del Modelo:

Define la arquitectura de la CNN usando capas de Conv2D, MaxPooling2D, Dropout, y Dense.
Compila el modelo especificando la función de pérdida, el optimizador y las métricas.
Entrena el modelo con los datos de entrenamiento, validándolo con los datos de prueba.
Evaluación del Modelo:

Evalúa el modelo con los datos de prueba y genera un informe de clasificación.
Predicción de Nuevas Imágenes:

Carga un modelo preentrenado.
Define las categorías de riesgo y las etiquetas esperadas para nuevas imágenes.
Preprocesa las nuevas imágenes, las normaliza y las redimensiona.
Realiza predicciones con el modelo y muestra los resultados junto con las imágenes originales y las etiquetas predichas.
El Código define y entrena una CNN para clasificar imágenes en categorías de riesgo y luego utiliza el modelo entrenado para predecir nuevas imágenes, mostrando las predicciones junto con las imágenes originales.</h3>