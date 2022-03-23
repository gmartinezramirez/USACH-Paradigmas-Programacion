#lang racket

; Scheme funciones

;; Ejemplo: (calculadora suma 2 3)
(define calculadora
  (lambda (operacion a b)
    (operacion a b)))

;; Ejemplo: (((calculadora-curry suma) 2) 3)
(define calculadora-curry
  (lambda (operacion)
    (lambda (a)
      (lambda (b)
      (operacion a b)))))


;; Ejemplo: (suma 2 3)
(define suma
  (lambda (a b)
    (+ a b)))

;; Ejemplo: (resta 2 3)
(define resta
  (lambda (a b)
    (- a b)))

;; Ejemplo: ((curry2) f) arg1) arg2)
(define curry2
  (lambda (f)
    (lambda (arg1)
      (lambda (arg2)
        (f arg1 arg2)))))

;; Ejemplo: (((curry3) f) arg1) arg2) arg3)
(define curry3
  (lambda (f)
    (lambda (arg1)
      (lambda (arg2)
        (lambda (arg3)
          (f arg1 arg2 arg3))))))

(define mult (curry2 *))
(define double (mult 2))

(define add (curry2 +))
(define increment (add 1))
(define decrement (add -1))


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