#lang racket

;; Función Map

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define (my-map fn lst)
  (cond
    [(null? lst) '()]
    [else (cons (fn (car lst))
                (my-map fn (cdr lst)))]))

;; Ejemplos

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-map
 string?
 (list 1 'en "en" 2 'to "to"))

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-map
 (lambda (x) (* 2 x))
 (list 10 20 30 40))



;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define increment-by
  (lambda (x)
    (lambda (n)
      (+ x n))))

(define add-one-to-all
  (lambda(nums)
    (my-map (increment-by 1) nums)))

(add-one-to-all (list 1 2 3))