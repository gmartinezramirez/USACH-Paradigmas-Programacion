#lang racket

;; Martes 5 Abril

;; Filter y Map esta definido internamente en Scheme. 
;; Pero si les dicen que se debe implementar, deben implementar los siguientes codigos
;; Ejemplo: (mi-filtro es-manzana? (list "manzana" "pera" "platano" "sandia" "manzana"))
;; Ejemplo: (filter es-manzana? (list "manzana" "pera" "platano" "sandia" "manzana"))
(define (mi-filtro pred lista)
  (cond
    [(null? lista) null]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else
     (mi-filtro pred (cdr lista))]))


;; Descripción: Función que aplica una función fn a todos y cada uno de los elementos
;;              de una lista lst
;; Dom: Función a aplicar a una colección de datos <función>,
;;      Lista de datos <lista>
;; Rec: Nueva lista con cada elemento
;; Tipo de recursión: Natural
;; Ejemplo: (mi-map (lambda (x) (- x 50)) (list 100 200 300 400))
;; Ejemplo: (map (lambda (x) (- x 50)) (list 100 200 300 400))
;; Ejemplo: (map aplicar-descuento (list 100 200 300 400))
(define (mi-map funcion lista)
  (cond
    [(null? lista) null]
    [else
     (cons (funcion (car lista))
           (mi-map funcion (cdr lista)))]))

;; Función de filtrado
(define es-manzana?
  (lambda (nombre)
    (cond
      [(eq? nombre "manzana") #t]
      [else #f])))

;; Función de map
(define aplicar-descuento
  (lambda (precio)
    (- precio 50)))