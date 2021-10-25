#lang racket

; (member? (list 1 2 3) 3) return: #t
; (member? (list 1 2 3) 5) return: #f
; Recursion natural
(define member?
  (lambda (lst x)
    (cond
      [(null? lst) #f]
      [(eq? (car lst) x) #t]
      [else
       (member? (cdr lst) x)])))


; Sin recursion
; (insert-tail-sin-duplicado (list 1 2 3) 3)
; (insert-tail-sin-duplicado (list 1 2 3) 4)
(define insert-tail-sin-duplicado
  (lambda (lst x)
    (cond
      [(member? lst x) lst]
      [else
       (reverse (cons x (reverse lst)))
       ])))


; Recursion natural
;  No especifica QUE debe ser con recursion natural
; (insert-tail-rec (list 1 2 3) 3)
; (insert-tail-rec (list 1 2 3) 4)
(define insert-tail-rec
  (lambda (lst x)
    (cond
      [(member? lst x) lst]
      [else
       (insert-item lst x)
       ])))


; Tipo de recursion: recursion natural
; Ejemplo: (insert-item (list 1 2 3 4) 50)
; '(1 2 3 4 50)
(define insert-item
  (lambda (lst item)
    (cond
      [(null? lst) (cons item null)]
      [else
       (cons (car lst)
             (insert-item (cdr lst) item))])))


;(my-inverse-tail-rec (list 1 2 3 4) null) = '(4 3 2 1)
(define my-inverse-tail-rec
  (lambda (lst lst-so-far)
    (cond
      [(null? lst) lst-so-far]
      [else
       (my-inverse-tail-rec (cdr lst)
                            (cons (car lst) lst-so-far))])))

