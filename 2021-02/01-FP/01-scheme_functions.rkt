#lang racket

; Hello world as a symbol
; Ejemplo: hello-as-value
(define hello-as-value "Hello world")

; Hello world as a explicit procedure
; Ejemplo: (hello-as-function)
(define hello-as-function
  (lambda ()
    "Hello world"))


; Descripcion: funcion que recibe un string y realiza un append a un
;              str predefinido
; DOM: str
; REC: str
; Ejemplo: (say-hello "gonzalo")
(define say-hello
  (lambda (name)
    (string-append "Hello " name "!")))

; Ejemplo: (say-hello "gonzalo")
(define say-hello-long-message
  (lambda (nombre)
    (string-append "Hola " nombre " como estas?" " Bien y tu")))


; Descripcion: funcion que recibe tres numeros y los suma
; DOM: number X number X number
; REC: number
; Ejemplo: (sum-three-numbers 4 8 15)
; Ejemplo: (sum-three-numbers 4 5.1 99.9)
(define sum-three-numbers
  (lambda (a b c)
    (+ a b c)))


; Descripcion: funcion que obtiene el valor absoluto
; DOM: number
; REC: number
; Ejemplo: (abs 9)
; Ejemplo: (abs -9)
; Ejemplo: (abs 0)
(define (abs x)
  (cond [ (< x 0) (- x) ]
        [ (= x 0) 0 ]
        [ (> x 0) x ]))

;; COND: es la mejor forma de hacer if else
;; referencia: el profe

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


