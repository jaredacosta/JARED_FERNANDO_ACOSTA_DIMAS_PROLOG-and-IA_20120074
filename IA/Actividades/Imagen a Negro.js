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