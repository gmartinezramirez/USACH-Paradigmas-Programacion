#lang racket

(require "articulo.rkt")

(provide lista-articulos)
(provide add-articulo-head)

; TDA Lista de compras ;

;; Capa constructor ;;

;; Descripcion: Crea una lista de articulos a partir de un conjunto inicial de articulos.
;;              Agrega un nuevo elemento por cola
;;              ESTO NO INVOLUCRA UN ID AUTOINCREMENTAL
;; Dom: articulo X
;; Rec: list (articulo X)
;; Ejemplo:
;; - Entrada: (lista-articulos (articulo 0 "tv" 1000) (articulo 1 "notebook dell" 30000))
;; - Salida: '((0 "tv" 1000) (1 "notebook dell" 30000))
(define (lista-articulos . articulos) articulos)


;; Capa modificador ;;

;; Descripcion: Agrega un nuevo articulo por cabeza (head) a una lista de articulos
;;              Agrega un nuevo elemento al inicio de la lista
;;              ESTO NO INVOLUCRA UN ID AUTOINCREMENTAL
;; Dom: list X articulo
;; Rec: list X
;; Ejemplo:
;; - Entrada: (add-articulo-head (list (articulo 0 "tv" 1000) (articulo 1 "notebook dell" 30000)) (articulo 2 "celular" 9999))
;; - Salida: '((2 "celular" 9999) (0 "tv" 1000) (1 "notebook dell" 30000))
(define add-articulo-head
  (lambda (lst articulo)
    (cons articulo lst)))


;; Descripcion: Agrega un nuevo articulo por cola (tail) a una lista de articulos
;;              Agrega un nuevo elemento al final de la lista
;;              ESTO NO INVOLUCRA UN ID AUTOINCREMENTAL
;;              ESTO ES UN ENFOQUE DECLARATIVO
;; Dom: list X articulo
;; Rec: list X
;; Ejemplo:
;; - Entrada: (add-articulo-tail (list (articulo 0 "tv" 1000) (articulo 1 "notebook dell" 30000)) (articulo 2 "celular" 9999))
;; - Salida: '((0 "tv" 1000) (1 "notebook dell" 30000) (2 "celular" 9999))
(define add-articulo-tail
  (lambda (lst articulo)
    (reverse (cons articulo (reverse lst)))))


;; Capa otras funciones ;;

;; Descripcion: Retorna la representacion en string de una lista de articulos
;;              ESTO ES UN ENFOQUE DECLARATIVO
;; Dom: list
;; Rec: string
;; Ejemplo:
;; - Entrada: (lst-articulo->string (list (articulo 0 "keyboard" 7000) (articulo 1 "John Petrucci Guitar" 2560)))
;; - Salida: "0 keyboard 7000 | 1 John Petrucci Guitar 2560"
(define lst-articulo->string
  (lambda (lst-articulo)
    (string-join
     (map articulo->string lst-articulo) " | ")))
