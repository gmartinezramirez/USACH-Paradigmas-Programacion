#lang racket

(provide if-element-is-number-then->string)

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