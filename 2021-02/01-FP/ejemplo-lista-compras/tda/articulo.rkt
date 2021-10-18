#lang racket

(require "operaciones-tda.rkt")

(provide articulo)
(provide get-id get-nombre get-precio)
(provide set-id set-nombre set-precio)
(provide articulo->string)

; TDA Articulo ;

;; Capa constructor ;;

;; Descripcion: Constructor Articulo
;; Dom: number X string X number
;; Rec: list (number X string X number)
;; Ejemplo:
;; - Entrada: (articulo 0 "keyboard" 7000)
;; - Salida: '(0 "keyboard" 7000)
(define articulo
  (lambda (id nombre precio)
    (list id nombre precio)))


;; Capa selector ;;

;; Descripcion: Retorna id de un articulo
;; Dom: articulo
;; Rec: number
;; Ejemplo:
;; - Entrada: (get-id (articulo 0 "keyboard" 7000))
;; - Salida: 0
(define get-id
  (lambda (articulo)
    (car articulo)))


;; Descripcion: Retorna nombre de un articulo
;; Dom: articulo
;; Rec: string
;; Ejemplo:
;; - Entrada: (get-nombre (articulo 0 "keyboard" 7000))
;; - Salida: "keyboard"
(define get-nombre
  (lambda (articulo)
    (car (cdr articulo))))


;; Descripcion: Retorna precio de un articulo
;; Dom: articulo
;; Rec: number
;; Ejemplo:
;; - Entrada: (get-precio (articulo 0 "keyboard" 7000))
;; - Salida: 7000
(define get-precio
  (lambda (articulo)
    (car (cdr (cdr articulo)))))


;; Capa modificador ;;

;; Descripcion: Crea un nuevo articulo con un nuevo ID utilizando otro articulo llamado old-articulo como referencia
;; Dom: articulo X number
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (set-id (articulo 0 "keyboard" 7000) 1)
;; - Salida: '(1 "keyboard" 7000)
(define set-id
  (lambda (old-articulo id)
    (articulo id (get-nombre old-articulo) (get-precio old-articulo))))


;; Descripcion: Crea un nuevo articulo con un nuevo NOMBRE utilizando otro articulo llamado old-articulo como referencia
;; Dom: articulo X string
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (set-nombre (articulo 0 "keyboard" 7000) "Razer Keyboard")
;; - Salida: '(0 "Razer Keyboard" 7000)
(define set-nombre
  (lambda (old-articulo nombre)
    (articulo (get-id old-articulo) nombre (get-precio old-articulo))))


;; Descripcion: Crea un nuevo articulo con un nuevo PRECIO utilizando otro articulo llamado old-articulo como referencia
;; Dom: articulo X number
;; Rec: articulo
;; Ejemplo:
;; - Entrada: (set-precio (articulo 0 "keyboard" 7000) 10000)
;; - Salida: '(0 "keyboard" 10000)
(define set-precio
  (lambda (old-articulo precio)
    (articulo (get-id old-articulo) (get-nombre old-articulo) precio)))


;; Capa otras funciones ;;

;; Descripcion: Retorna la representacion en string de un articulo
;;              ESTO ES UN ENFOQUE DECLARATIVO
;; Dom: articulo
;; Rec: string
;; Ejemplo:
;; - Entrada: (articulo->string (articulo 0 "keyboard" 7000))
;; - Salida: "0 keyboard 7000"
(define articulo->string
  (lambda (articulo)
    (string-join
     (map if-element-is-number-then->string articulo) " ")))
