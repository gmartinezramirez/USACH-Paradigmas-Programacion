#lang racket

; H(n) = H(n - 1) + 2H(n - 2) + 3H(n - 3) si n>=3.
; DOM: numero natural n <number>
; REC: numero natural n <number>
(define H
  (lambda (n)
    (if (< n 3) n
        (+ (H(- n 1))
           (* 2(H(- n 2)))
           (* 3(H(- n 3)))))))

;(define (funcion arg)
;(define funcion (lambda (arg)
; Recursion de cola (TAIL RECURSION)

;; Natural: mantener estados pendientes de evaluacion
;; Sumatoria

;define sumatoria (n):
;  if (n==1)
;      return n
;   else:
;       return n + sumatoria (n-1)

;n=5   5+ sumatoria(4)
;n=4   5+ (4+sumatoria(3))
;n=3   5+ (4+ (3 + sumatoria(2)))

;define tail-sumatoria (n, accum=0):
;  if (n==0)
;      return accum
;   else:
;       return tail-sumatoria(n-1, accum+n)

;; tail-sumatoria(5,0) ;sin estados pendientes
;; tail-sumatoria(4,5)
;; tail-sumatoria(3,9)
;; tail-sumatoria(2,12)
;; tail-sumatoria(1,14)
;; tail-sumatoria(0,15) ;; TERMINO EJECUCION Y RETORNO 15

;; RECURSION POR COLA - ACKERMANN

;; H(0) = 0
;; H(1) = 1
;; H(2) = 2
;; H(n) = n si n<3 
;; H(n) = H(n - 1) + 2H(n - 2) + 3H(n - 3) si n>=3.
;; (H-tail n 2 1 0)
;; (H-tail 4 2 1 0)
;; (H-tail 5 2 1 0)

(define H-tail-envoltorio
  (lambda (n)
    (H-tail n 2 1 0)))


(define H-tail
  (lambda (n base2 base1 base0)
    (if (< n 3) base2
        (H-tail (- n 1)
                (+ base2 (* 2 base1) (* 3 base0)) base2 base1))))

;; ENVOLTORIO
;; (ackerman2 4)
;; H(0) = 0
;; H(1) = 1
;; H(2) = 2
(define (ackerman2 n)
  (if (< n 3)
      n
      (ackermanCola n 2 1 0 2)))


;; (ackermanCola 4 2 1 0 2)
; k es el valor maximo de los minimos valores conocidos, acumulador
(define (ackermanCola n act ant antt k)
  (if (= k n)
      act
      (ackermanCola n (+ act (* 2 ant) (* 3 antt)) act ant (+ k 1))))


(ackerman2 4)