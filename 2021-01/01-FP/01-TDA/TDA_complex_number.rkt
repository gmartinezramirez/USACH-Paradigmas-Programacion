#lang racket

;; TDA Número complejo
;; Un complejo está formado por 2 números: parte real y parte imaginaria
;; Ej: 4+2i es quivalente a '(4 . 2)

;; Capa de constructor

(define complex-number
  (lambda (real imaginary)
    (if (and (number? real)
             (number? imaginary))
        (cons real imaginary)
        null)))

(define only-real-complex-number
  (lambda (real)
    (complex-number real 0)))

;; Capa de pertenencia

(define complex-number?
  (lambda (c)
    (if (pair? c)
        (if (and (number? (car c)) (number? (cdr c)))
            #t
            #f)
        #f)))

;; Capa de selector

(define complex-number-get-real
  (lambda (c)
    (if (complex-number? c)
        (car c)
        null)))

(define complex-number-get-imaginary
  (lambda (c)
    (if (complex-number? c)
        (cdr c)
        null)))

;; Capa de modificador

(define complex-number-set-real
  (lambda (c real)
    (if (complex-number? c)
        (complex-number real (complex-number-get-imaginary c))
        null)))

(define complex-number-set-imaginary
  (lambda (c imaginary)
    (if (complex-number? c)
        (complex-number (complex-number-get-real c) imaginary)
        null)))