#lang racket

;; Lista de compras
;; 1 lista de compras equivale a una lista de articulos

;; 
;; TDA Articulo

;; Constructor Articulo
;; Dom: string X number
;; Rec: articulo
(define articulo
  (lambda (nombre precio)
    (list nombre precio)))

;; Selectores
(define get-nombre
  (lambda (articulo)
    (car articulo)))

(define get-precio
  (lambda (articulo)
    (car (cdr articulo))))

;; Capa modificador
(define set-precio
  (lambda (articulo nuevo-precio)
    (list (get-nombre articulo) nuevo-precio)))

(define set-nombre
  (lambda (articulo nuevo-nombre)
    (list nuevo-nombre (get-precio articulo))))


;; Funcion agregar elemento al principio de la lista

(define add-articulo
  (lambda (lista articulo)
    (cons articulo lista)))

;; Funcion agregar elemento al final de la lista
; Hack: ocupar la funcion reverse
; DECLARATIVA, DIGO EL QUE, PERO NO EL COMO
(define add-articulo-tail
  (lambda (lista articulo)
    (reverse (cons articulo (reverse lista)))))

;; TDA Lista de items
(define (lista-articulos . articulos) articulos)

(define lista-inicial-articulos
  (lista-articulos (articulo "tv" 1000)
                   (articulo "notebook dell" 30000)))

lista-inicial-articulos

;; Listas General

(define list-of-elements
  (list "element-1" "element-2" "element-3" "element-4" "element-5" "element-6" "element-7" "element-8" "element-9" "element-10"))

(define get-first-element
  (car list-of-elements))

(car list-of-elements)

(car (cdr list-of-elements))
(cadr list-of-elements)

(car (cdr (cdr list-of-elements)))
(caddr list-of-elements)

(car (cdr (cdr (cdr list-of-elements))))
(cadddr list-of-elements)

(car (cdr (cdr (cdr (cdr list-of-elements)))))
(cadddr (cdr list-of-elements))

(car (cdr (cdr (cdr (cdr (cdr list-of-elements))))))
(cadddr (cdr (cdr list-of-elements)))

(cadddr (cdr (cdr (cdr list-of-elements))))

(cadddr (cdr (cdr (cdr (cdr list-of-elements)))))

(cadddr (cdr (cdr (cdr (cdr (cdr list-of-elements))))))

(cadddr (cdr (cdr (cdr (cdr (cdr (cdr list-of-elements)))))))