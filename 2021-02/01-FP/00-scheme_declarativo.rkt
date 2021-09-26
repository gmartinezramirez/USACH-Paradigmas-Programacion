#lang racket

; Una funcion en Scheme se define con la palabra reservada:
; define

; Su anatomia queda de la forma
; (define
;  (NOMBRE-FUNCION arg1 arg2 .. argn)
;    (LOGICA)
; ) 

(define (plus-five n)
  (+ n 5))

; Al momento de ejecutar este archivo, la funcion plus-five queda guardada en memoria
; Para ejecutarla, en el interprete debe ingresar:

; (plus-five 3)
; Lo que dara como resultado: 8

;Scheme como lenguaje declarativo
;; No es necesario idear algoritmos ni pasos imperativos
;; Simplemente es decirle al lenguaje lo que necesitamos.
;; Explicitamos el QUE, pero no el COMO

; Ejemplo: Dada una lista de numeros, obtener una lista que contenga
;          la raiz cuadrada de cada uno de ellos

; En lenguajes imperativos como C, lo resolveriamos de forma algoritmica
; planteando pasos tales como:
; ; Recibir lista de numeros
; ; Crear lista vacia
; ; Iterar la lista de numeros de entrada y a cada elemento aplicar raiz cuadrada
; ; Almacenar cada elemento en la lista nueva

;; En lenguajes como Scheme, esto se puede resolver de forma funcional y declarativa
;; No pensamos en como llegar a la meta, simplemente pensamos en la meta

(map sqrt (list 1 4 9 16 25 36 49))

; Que tal si ahora queremos ejecutar dos funciones
; 1. Obtener la raiz cuadrada de cada elemento
; 2. Preguntar si este resultado es par o no.
; Guardar en una lista los valores booleanos correspondientes
; de cada valor

;; Podemos hacer composicion de funciones, de forma declarativa
;; Primero ejecuta sqrt en cada elemento y luego pregunta si es par o no
;; even? es una funcion interna de scheme que pregunta si el elemento es par o no

(map (compose even? sqrt) (list 1 4 9 16 25 36 49))
