## Imagen a Negro

~~~
impor cv2 as cv
img = cv.imread('D:\Escuela Betin\9no Sem\3. Inteligencia Artificial\Material de clase\f1.jpg'', 0)
print(img.shape)
w, h = img.shape
cv.imshow('Ejemplo', img)
for i in range(w):
    for j in range(h):
        #img[i,j] = 255-img[i,j]
        if(img[i,j]>150):
            img[i,j]=255
        else:
            img[i,j]=0
cv.imshow('Ejemplo2', img)            
cv.waitKey(0)
cv.destroyAllWindows()
~~~


<h3>Carga de Imagen:

Utiliza OpenCV para cargar una imagen en escala de grises desde una ruta especificada (ruta_imagen).
Visualización de Imagen Original:

Muestra la imagen original en una ventana de visualización con el título "Ejemplo".
Umbralización de Imagen:

Recorre cada píxel de la imagen.
Si el valor del píxel es mayor que 150, se establece en 255 (blanco).
Si el valor del píxel es menor o igual a 150, se establece en 0 (negro).
Visualización de Imagen Procesada:

Muestra la imagen umbralizada en una segunda ventana de visualización con el título "Ejemplo2".
Manejo de Ventanas:

Espera a que se presione una tecla para cerrar las ventanas de visualización y terminar el programa.
Detalles Específicos del Código
Importación de la biblioteca: import cv2 as cv

Importa la biblioteca OpenCV como cv para el procesamiento de imágenes.
</h3>