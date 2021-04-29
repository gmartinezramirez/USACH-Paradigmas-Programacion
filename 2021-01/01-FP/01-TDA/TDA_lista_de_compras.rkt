#lang racket

; TDA lista de compras
; Lista de compras que se compone de articulos
; articulo se compone de un nombre y un precio

;(define lista-de-compras
;  (list articulo1 articulo2 articulo3)

;; TDA Articulo

;; Constructor
;; Dom: nombre <str>, precio <number>
;; Rec: articulo
(define articulo
  (lambda (nombre precio)
    (list nombre precio)))

(define articulo-1 (articulo "mi articulo 1" 100))
(define articulo-2 (articulo "mi articulo 2" 200))

articulo-1
articulo-2

;; Selectores
(define get-nombre
  (lambda (articulo)
    (car articulo)))

(define get-precio
  (lambda (articulo)
    (car (cdr articulo))))

(cdr articulo-1)
;; cdr articulo = (100 null) = 100

(get-nombre articulo-1)
(get-precio articulo-1)

(define mi-lista (list 1 2 3 4 5 6))

(car mi-lista)
(cdr mi-lista)
(car (cdr mi-lista)) ; (car (list 2 3 4 5 6))
(car (cdr (cdr mi-lista)))
;;;;;;;;;;car (cdr (2 3 4 5 6))
;;;;;;;;;;car (3 4 5 6)
;;;;;;;;;;3

(car (cdr (cdr (cdr mi-lista)))) ;4
(car (cdr (cdr (cdr (cdr mi-lista))))) ;5


(cadr mi-lista) ;2 obtiene segundo elemento
(caddr mi-lista) ;3 obtiene el tercer elemento
(cadddr mi-lista) ;4 obtiene el cuarto elemento

;; Capa modificador
(define set-precio
  (lambda (articulo nuevo-precio)
    (list (get-nombre articulo) nuevo-precio)))

(define set-nombre
  (lambda (articulo nuevo-nombre)
    (list nuevo-nombre (get-precio articulo))))

;(define articulo-1 (articulo "mi articulo 1" 100))
(set-precio articulo-1 999)

(define articulo-1-nuevo-precio (set-precio articulo-1 999))

articulo-1
articulo-1-nuevo-precio

(define articulo-1-nuevo-nombre (set-nombre articulo-1 "este nombre es mejor"))

articulo-1-nuevo-nombre


;; TDA Lista de compras

;; Lista lst = ( 1 2 3 )
;; Lista lst2 = (cons e1 lst)

(define lista-compras-inicial
  (list articulo-1))

(define lista-compras-v2
  (list articulo-1 articulo-1-nuevo-precio))

lista-compras-inicial
lista-compras-v2

;; Funcion agregar elemento al principio de la lista

(define add-item
  (lambda (lista item)
    (cons item lista)))

(add-item lista-compras-inicial articulo-2)

(define lista-v2 (add-item lista-compras-inicial articulo-2))

lista-v2

(define lista-v3 (add-item lista-v2 articulo-1-nuevo-precio))
lista-v3

;; Agregar el item al final de la lista?
; Hack: ocupar la funcion reverse

; DECLARATIVA, DIGO EL QUE, PERO NO EL COMO
(define add-item-tail
  (lambda (lista item)
    (reverse (cons item (reverse lista)))))

(add-item-tail lista-compras-inicial articulo-2)
