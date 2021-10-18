#lang racket

(provide if-element-is-number-then->string)
(provide reduce)
(provide mi-filtro)
(provide mi-map)

; TDA Operaciones TDA ;

; Capa otras funciones

;; Descripcion: Funcion que verifica si un elemento es un numero, si lo es lo transforma a string
;; Dom: number | string
;; Rec: string
;; Ejemplo:
;; - Entrada: (if-element-is-number-then->string 815)
;; - Salida: "815"
;; - Entrada: (if-element-is-number-then->string "hola como estas")
;; - Salida: "hola como estas"
(define if-element-is-number-then->string
  (lambda (element)
    (cond
      [(number? element) (number->string element)]
      [(string? element) element])))


;; Descripcion: Funcion que aplica una funcion operacion que reduce sobre una lista
;; Dom: function X list X number
;; Rec: number
;; Ejemplo:
;; - Entrada: (reduce operacion-sumar-y-acumular-precios-articulos lst 0)
(define reduce
  (lambda (operacion lst acc)
    (cond
      [(null? lst) acc]
      [(operacion (car lst)
                  (reduce operacion (cdr lst) acc))])))


;; Filter y Map esta definido internamente en Scheme. 
;; Pero si les dicen que se debe implementar, deben implementar los siguientes codigos
(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
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
(define (mi-map funcion lista)
  (cond
    [(null? lista) null]
    [else
     (cons (funcion (car lista))
           (mi-map funcion (cdr lista)))]))
