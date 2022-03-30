#lang racket
; Recursion
; Clase miercoles 30 marzo

;; Resumen hasta el momento
;; Definicion de funciones en Scheme
;; Uso de Cond
;;; (define (func x)
;;;  (cond (end-test-1 end-value-1)
;;;        (end-test-2 end-value-2)
;;;        (else (func reduced-x))))

;; Scheme tiene estructuras de control IF-ELSE, pero ademas tiene COND

;; (cond (p ...)                     if p then ... 
;;      (q ...)     equivale a       else if q then ... 
;;      (r ...)                      else if r then ... 
;;      ...                          ... 
;;      (t ...))                     else ...


; Recursion Natural (Natural Recursion)

;; Natural: mantener estados pendientes de evaluacion
;; Ejemplo de Sumatoria (conceptualmente)

;define sumatoria (n):
;  if (n==1)
;      return n
;   else:
;       return n + sumatoria (n-1)

;n=5   5+ sumatoria(4)
;n=4   5+ (4+sumatoria(3))
;n=3   5+ (4+ (3 + sumatoria(2)))

;; Forma general de una recursion en Scheme
;; general form:

;(define (func x)
;  (cond (end-test-1 end-value-1)
;        (end-test-2 end-value-2)
;        (else (func reduced-x))))

;; Implementando Ackermann con recursion natural
;; H(n) = n si n < 3
;; H(n) = H(n - 1) + 2H(n - 2) + 3H(n - 3) si n >= 3


; Descripcion: implementacion de la funcion de Ackermann
; Dom: number
; Rec: number
; Recursion: natural
; Ejemplo: (ackermann-h 2)
; Ejemplo: (ackermann-h 3)
; Ejemplo: (ackermann-h 4)
(define ackermann-h
  (lambda (n)
    (if (< n 3) n
        (+ (ackermann-h(- n 1))  ; Esto corresponde a un else
           (* 2(ackermann-h(- n 2)))
           (* 3(ackermann-h(- n 3)))))))


; Descripcion: implementacion de la funcion de Ackermann
; Dom: number
; Rec: number
; Recursion: natural
; Ejemplo: (ackermann 2) Resultado: 2
; Ejemplo: (ackermann 3) Resultado: 4
; Ejemplo: (ackermann 4) Resultado: 11
(define ackermann
  (lambda (n)
    (cond
      [ (< n 3) n ]
      [ else (+ (ackermann(- n 1))
                (* 2(ackermann(- n 2)))
                (* 3(ackermann(- n 3))))])))


; Recursion de Cola (Tail Recursion)

;; Cola (Tail Recursion): NO mantener estados pendientes de evaluacion

;define tail-sumatoria (n, accum=0):
;  if (n==0)
;      return accum
;   else:
;       return tail-sumatoria(n-1, accum+n)

;; tail-sumatoria(5,0) ;sin estados pendientes, uso el segundo argumento como un acumulador
;; tail-sumatoria(4,5)
;; tail-sumatoria(3,9)
;; tail-sumatoria(2,12)
;; tail-sumatoria(1,14)
;; tail-sumatoria(0,15) ;; TERMINO EJECUCION Y RETORNO 15

; Descripcion: implementacion de la funcion de Ackermann
; Dom: number
; Rec: number
; Ejemplo: (ackermann-tail-envoltorio 2) Resultado: 2
; Ejemplo: (ackermann-tail-envoltorio 3) Resultado: 4
; Ejemplo: (ackermann-tail-envoltorio 4) Resultado: 11
(define ackermann-tail-envoltorio
  (lambda (n)
    (ackermann-tail n 2 1 0)))


;; Usando cond
; Descripcion: implementacion de la funcion de Ackermann
; Dom: number X number X number X number
; Rec: number
; Recursion: cola
; Ejemplo: (ackermann-tail 4 2 1 0) Resultado: 11
(define ackermann-tail
  (lambda (n h2 h1 h0)
    (cond
      [ (< n 3) h2 ]
      [ else (ackermann-tail (- n 1)
                             (+ h2 (* 2 h1) (* 3 h0))
                             h2
                             h1)])))

;; Usando if else
;(define ackermann-tail
;  (lambda (n h2 h1 h0)
;    (if (< n 3) h2
;        (ackermann-tail (- n 1)
;                        (+ h2 (* 2 h1) (* 3 h0)) h2 h1))))

;; (ackermann-tail-envoltorio 4)
;;;  (ackermann-tail 4 2 1 0)        ;; n=4 | 4 2 1 0
;;;;   (ackermann-tail 3 4 2 1)      ;; n=3 | 3 (+ 2 (* 2 1) (* 3 0)) 2 1
;;;;;    (ackermann-tail 2 11 4 2)   ;; n=2 | 2 (+ 4 (* 2 2) (* 3 1)) 4 2
;;;;;;     n=2 => return h2 = 11     ;; STOP| RETURN 11

; Sumatoria

; Recursion natural

; Ejemplo: (sumatoria 10)
(define sumatoria
  (lambda (x)
    (cond
      [(zero? x) 0]
      [else (+ x (sumatoria (- x 1)))])))


; Tail Recursion

; Ejemplo: (sumatoria-tail 10 0)
(define sumatoria-tail
  (lambda (x acc)
    (cond
      [(zero? x) acc]
      [(sumatoria-tail (- x 1) (+ x acc))])))

; Ejemplo: (sumatoria-tail-envoltorio 10)
(define sumatoria-tail-envoltorio
  (lambda (x)
    (sumatoria-tail x 0)))

; Factorial

; Recursion natural
; Ejemplo: (factorial 10)
(define factorial
  (lambda (n)
    (cond
      [(equal? n 0) 1]
      [else (* n (factorial (- n 1)))])))

; Recursion de cola (Tail Recursion)
; Ejemplo: (factorial-tail-envoltorio 10)
(define factorial-tail-envoltorio
  (lambda (n)
    (factorial-tail n 1)))


;; auxiliary function that takes an additional parameter (the accumulator,
;; i.e. the result computed so far)
(define factorial-tail
  (lambda (n lo-que-llevo)
    (cond
      [(zero? n) lo-que-llevo]
      [else (factorial-tail (- n 1) (* lo-que-llevo n))])))