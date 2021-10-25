#lang racket

; define simbolo algo
(define hola-mundo "hola mundo")

; Hello world as a explicit procedure
; Ejemplo: (hello-as-function)
(define hola-mundo-procedimiento
  (lambda ()
    "Hello world"))


;(define (cuadrado x) (* x x))

;(define otro-cuadrado (lambda (x) (* x x)))

; Descripcion: este procedimiento toma un numero x y retorna su cuadrado
; Dom: number
; Rec: number
(define cuadrado
  (lambda (x)
    (* x x)))

(define say-hello
  (lambda (nombre)
    (string-append "Hola " nombre " como estas?" " Bien y tu")))



;;
;(* A A)
;(* (* 5 5) (* 5 5))
; CONSTANTE = 9
; CONSTANTE = 6 * 7
; C: i o  printf  libreria IO
; int a, int b, int c: int 4 bytes
; factorial;   99
; 99 * 98 * 97 * 96
; 99 * ..... 1

; 98 * ..... 1
; 97 ....1
; (* 99 98 97 96)

;;  (cuadrado (cuadrado (cuadrado 9)))
;;  (cuadrado (cuadrado (9*9)))
;;  (cuadrado ((9*9) (9*9)))
;; ((9*9)*(9*9)*(9*9)*(9*9))

;; COND: es la mejor forma de hacer if else
;; referencia: el profe
(define (abs x)
  (cond ( (< x 0) (- x) )
        ( (= x 0) 0)
        ( (> x 0) x)))
