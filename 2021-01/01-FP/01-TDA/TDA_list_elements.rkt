#lang racket

(define list-of-elements
  (list "element-1" "element-2" "element-3" "element-4" "element-5" "element-6" "element-7" "element-8" "element-9" "element-10"))

(define get-first-element
    (car list-of-elements))

(car list-of-elements)

(car (cdr list-of-elements))
(cadr list-of-elements)

(car (cdr (cdr list-of-elements)))
(caddr list-of-elements)

(car (cdr (cdr (cdr list-of-elements))))
(cadddr list-of-elements)

(car (cdr (cdr (cdr (cdr list-of-elements)))))
(cadddr (cdr list-of-elements))

(car (cdr (cdr (cdr (cdr (cdr list-of-elements))))))
(cadddr (cdr (cdr list-of-elements)))

(cadddr (cdr (cdr (cdr list-of-elements))))

(cadddr (cdr (cdr (cdr (cdr list-of-elements)))))

(cadddr (cdr (cdr (cdr (cdr (cdr list-of-elements))))))

(cadddr (cdr (cdr (cdr (cdr (cdr (cdr list-of-elements)))))))