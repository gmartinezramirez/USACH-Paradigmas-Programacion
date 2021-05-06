#lang racket


;; Referencia: funcion vista en clase
(define (my-filter pred lst)
  (cond
    [(empty? lst) '()] ;null? null
    [(pred (car lst))  ;; si predicado es verdero, ejecuto la siguiente linea, caso contrario, ejecuto else
     (cons (car lst) (my-filter pred (cdr lst)))]
    [else (my-filter pred (cdr lst))]))

; (10 my-filter pred resto de la lista)  ; resto de la lista: 10 20 30 40 10 50 60 10
; (10 10 my-filter pred resto d ela lista) ; resto de la lista: 20 30 40 10 50 60 10
; (10 10 my-filter pred cdr lst) ; resto de la lista: 30 40  10 50 60 10
; (10 10 my-filter pred cdr lst) ; resto de la lista: 40  10 50 60 10
; (10 10 10 my-filter pred cdr lst) ; resto de la lista: 50 60 10

;(my-filter (is-current-number-eq-to? 10) '(10 10 20 30 40 10 50 60 10))

(my-filter
 even? ;; pred
 '(1 2 3 4 5)) ;; lst

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

;; Funcion predicado
(define is-current-number-eq-to?
  (lambda (number-to-compare)
    (lambda (current-number)
      (cond [(eq? current-number number-to-compare) #t] ; Se puede utilizar eq? o =
            [else #f]))))

;; El objetivo es filtrar de la lista, los elementos que sean mayores o iguales a N
(my-filter (is-current-number-eq-or-greater-than? 30) '(10 20 30 40 50))



;(my-filter (is-current-number-eq-or-less-than? 20) '(10 20 30 40 50))

;; El objetivo es filtrar de la lista, los elementos que sean iguales a N
;(my-filter (is-current-number-eq-to? 10) '(10 10 20 30 40 10 50 60 10))


;; Insertar un elemento en una lista sin duplicados

;(define is-the-element-in-current-list?

;(define insertar
;  (lambda (elemento lista)
;    (cons elemento (my-filter
;                    (lambda (e)
;                      (not (eqv? elemento e)))
;                    lista))))

;(insertar 1 '(10 20 30 40 50 1 2))