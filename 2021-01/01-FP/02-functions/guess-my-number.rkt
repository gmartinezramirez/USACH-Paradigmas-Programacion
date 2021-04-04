#lang racket

(define (inquire-user number)
  (display "Insert a number: ")
  (define guess (string->number (read-line)))
  (cond [(> number guess) (displayln "Too low") (inquire-user number)]
        [(< number guess) (displayln "Too high") (inquire-user number)]
        [else (displayln "Correct!")]))

(displayln "Guess a number between 1 and 100")
(inquire-user (random 1 101))