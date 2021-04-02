#lang racket

;; TDA
;; Estructura de un sistema de archivos (filesystem)
;; Cada carpeta (folder) tiene subcarpetas (folder1.1) y archivos (file)
;; /folder1
;;  ../folder1.1
;;  ../../file4
;;  ../file3
;;  ../folder1.2
;; /folder2
;;  ../file1
;;  ../file2
;; /folder3


;; Capa constructor

;; Para representar este TDA, se utiliza un lista de listas
;; Lista ("NombreDirectorio" .... ("NombreDirectorios" "Archivos")....)

;; '("root" '("folder1"  '("folder1.1" "file4") "file3") '("folder2" "file1" "file2")   '("folder3"))


;: Descripción: Retorna un sistema de archivos, basado en carpetas, subcarpetas y archivos
;; Dom: NA
;; Rec: sistema de archivos (filesystem) <lista de listas>
;; Tipo de recursión: NA
(define filesytem
  (list
   (list "folder1"
         (list "subfolder1.1" "file4") "file3")
   (list "folder2" "file1" "file2")
   (list "folder3")))

;; Capa selector

;: Descripción: retorna un directorio a partir de su nombre
;; Dom: nombre del directorio
;; Rec: nombre del directorio <string>
;; Tipo de recursión: NA
(define get-folder-name
  (lambda (folder)
    (car folder)))

;: Descripción: retorna el contenido de un directorio a partir de su nombre
;; Dom: Nombre directorio <string>, sistema de archivos (filesystem) <lista de listas>
;; Rec: Contenido del directorio <lista>
;; Tipo de recursión: Recursión de cola (tail recursion)
(define retrieve-folder-content
  (lambda (folder-name filesystem)
    (if (null? filesystem)
        null
        (if (equal? folder-name (get-folder-name (car filesystem)))
            (car filesystem)
            (retrieve-folder-content folder-name (cdr filesystem))))))


;; Main function

;; Obtiene el contenido del directorio llamado "folder1"
(retrieve-folder-content "folder1" filesytem)

;; Obtiene el contenido del directorio llamado "folder2"
(retrieve-folder-content "folder2" filesytem)

;; Obtiene el contenido del directorio llamado "folder3"
(retrieve-folder-content "folder3" filesytem)