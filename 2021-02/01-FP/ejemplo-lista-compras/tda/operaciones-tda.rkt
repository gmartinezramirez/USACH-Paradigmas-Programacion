#lang racket

(provide if-element-is-number-then->string)

(define if-element-is-number-then->string
  (lambda (element)
    (cond
      [(number? element) (number->string element)]
      [(string? element) element])))