#lang racket

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define (my-filter pred lst)
  (cond
    [(empty? lst) '()]
    [(pred (car lst))
     (cons (car lst) (my-filter pred (cdr lst)))]
    [else (my-filter pred (cdr lst))]))

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-filter
 even? ;; pred
 '(1 2 3 4 5)) ;; lst

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(my-filter
 (negate even?) ;; pred
 '(1 2 3 4 5)) ;; lst

(define is-current-number-eq-or-greater-than?
  (lambda (number-to-compare)
    (lambda (current-number)
      (cond [(or (= current-number number-to-compare)
                 (> current-number number-to-compare))
             #t]
            [else #f]))))

(define is-current-number-eq-or-less-than?
  (lambda (number-to-compare)
    (lambda (current-number)
      (cond [(or (= current-number number-to-compare)
                 (< current-number number-to-compare))
             #t]
            [else #f]))))

(define is-current-number-eq-to?
  (lambda (number-to-compare)
    (lambda (current-number)
      (cond [(eq? current-number number-to-compare) #t] ; Se puede utilizar eq? o =
            [else #f]))))

(my-filter (is-current-number-eq-or-greater-than? 20) '(10 20 30 40 50))
(my-filter (is-current-number-eq-or-less-than? 20) '(10 20 30 40 50))
(my-filter (is-current-number-eq-to? 20) '(10 20 30 40 50))