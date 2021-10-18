#lang racket

(require "articulo.rkt")
(require "operaciones-tda.rkt")

(provide lista-articulos)
(provide add-articulo-head)
(provide lst-articulo->string)
(provide add-articulo-autoincrement-id)
(provide get-articulos-con-precio-mayor-a)
(provide obtener-suma-de-todos-los-precios)

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


;; Capa selector ;;

;; Descripcion: Retorna primer elemento de una lista
;; Dom: lista
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (get-first-element (list (articulo 0 "keyboard" 7000) (articulo 1 "yogurth" 100)))
;; - Salida: '(0 "keyboard" 7000)
(define get-first-element
  (lambda (lst)
    (car lst)))


;; Descripcion: Retorna ultimo elemento de una lista
;;              ENFOQUE DECLARATIVO
;; Dom: lista
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (get-last-element (list (articulo 0 "keyboard" 7000) (articulo 1 "yogurth" 100)))
;; - Salida: '(1 "yogurth" 100)
(define get-last-element
  (lambda (lst)
    (car (reverse lst))))


;; Descripcion: Retorna todos los elementos filtrados por un precio
;;              ENFOQUE DECLARATIVO
;;              SE UTILIZA HIGH ORDER FUNCTIONS Y CURRIFICACION
;;              USO DE FILTER
;; Dom: lista
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (get-articulos-con-precio-mayor-a (list (articulo 0 "keyboard" 7000) (articulo 1 "yogurth" 5500)) 6000)
;; - Salida: '(1 "yogurth" 100)
(define get-articulos-con-precio-mayor-a
  (lambda (lst precio)
    (filter (es-precio-mayor-a? precio) lst)))


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


;; Descripcion: Agrega un nuevo articulo por cola (tail) a una lista de articulos
;; Dom: list X string X string
;; Rec: list X
;; Ejemplo:
;; - Entrada: (add-articulo-autoincrement-id (list (articulo 0 "tv" 1000) (articulo 1 "notebook dell" 30000)) "celular" 9999)
;; - Salida: '((0 "tv" 1000) (1 "notebook dell" 30000) (2 "celular" 9999))
(define add-articulo-autoincrement-id
  (lambda (lst nombre precio)
    (add-articulo-tail lst
                       (articulo (+ (get-id (get-last-element lst)) 1)
                                 nombre
                                 precio))))


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


;; Funciones reductoras sobre una lista de compras ;;

;; Descripcion: Retorna la representacion en string de una lista de articulos
;;              ESTO ES UN ENFOQUE DECLARATIVO
;; Dom: list
;; Rec: string
;; Ejemplo:
;; - Entrada: (obtener-suma-de-todos-los-precios (list (articulo 0 "keyboard" 7000) (articulo 1 "John Petrucci Guitar" 2560) (articulo 2 "Vinyl" 500)))
;; - Salida: 10060
(define obtener-suma-de-todos-los-precios
  (lambda (lst)
    (reduce operacion-sumar-y-acumular-precios-articulos lst 0)))
