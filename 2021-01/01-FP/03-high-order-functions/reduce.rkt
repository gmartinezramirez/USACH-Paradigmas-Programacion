#lang racket

;; which reduces a list of values to a single value byrepeatedly applying a binaryfunction to the list values.This function takes a binaryfunction, a list of data values, andan identity value for the binaryfunction:

;; Descripción: Natural
;; Dom: Natural
;; Rec: Natural
;; Recursión: Tail recursion, recursion de cola 
;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define reducir
  (lambda (funcion-reduccion lista acc)
    (cond
      [(null? lista) acc]
      [(funcion-reduccion (car lista)
                          (reducir funcion-reduccion (cdr lista) acc))])))

(reducir + '(1 2 3 4 5) 0)
(reducir - '(1 2 3 4 5) 0)
(reducir * '(1 2 4 6 8 10) 1)
(reducir / '(10 20 30 40 50) 1)

;; Ejemplo
;; Dada una lista de articulos donde cada articulo cuenta con un id, nombre, tipo de articulo y precio
;; Calcular la suma total de todos los precios de todos los articulos de esta lista

(define articulo
  (lambda (id nombre tipo precio)
    (list id nombre tipo precio)))

(define (get-precio articulo) (cadddr articulo))

(define (lista-articulos . articulos) articulos)

(define lista-inicial-articulos
  (lista-articulos (articulo 0 "tv" "tecnologia" 100)
                   (articulo 1 "notebook dell" "tecnologia" 30000)
                   (articulo 2 "manzana" "fruta" 50)))

lista-inicial-articulos

;; Obtener la suma de todos los precios de los articulos

;; Descripción: Natural
;; Dom: Natural
;; Rec: Natural
;; Ejemplo: (reducir sumar-precios-lista lista-inicial-articulos 0))
(define sumar-precios-lista
  (lambda (articulo acum)
    (+ (get-precio articulo) acum)))

; Sin asociarlo a una función
(reducir sumar-precios-lista lista-inicial-articulos 0)

; Asociado a una función
(define suma-de-todos-los-precios-de-articulos-de-lista
  (reducir sumar-precios-lista lista-inicial-articulos 0))

suma-de-todos-los-precios-de-articulos-de-lista
