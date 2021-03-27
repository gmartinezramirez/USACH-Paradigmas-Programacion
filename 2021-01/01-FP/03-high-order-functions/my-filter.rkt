#lang racket

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define (my-filter pred lst)
  (cond [(null? lst) '()]
        [(pred (car lst))
         (cons (car lst) (my-filter pred (cdr lst)))]
        [else (my-filter pred (cdr lst))]))

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-filter
 even? '(1 2 3 4 5))

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-filter
 (negate even?)
 '(1 2 3 4 5))