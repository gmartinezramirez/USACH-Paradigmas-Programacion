#lang racket
; Recursion

; Recursion Natural (Natural Recursion)

;; Ackermann
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
    (cond [ (< n 3) n ]
          [ else (+ (ackermann(- n 1))
                    (* 2(ackermann(- n 2)))
                    (* 3(ackermann(- n 3))))])))


; Recursion de Cola (Tail Recursion)

; Ejemplo: (ackermann-tail-envoltorio 4)
(define ackermann-tail-envoltorio
  (lambda (n)
    (ackermann-tail n 2 1 0)))


(define ackermann-tail
  (lambda (n h2 h1 h0)
    (if (< n 3) h2
        (ackermann-tail (- n 1)
                        (+ h2 (* 2 h1) (* 3 h0)) h2 h1))))

;; (ackermann-tail-envoltorio 4)
;;;  (ackermann-tail 4 2 1 0)        ;; n=4 | 4 2 1 0
;;;;   (ackermann-tail 3 4 2 1)      ;; n=3 | 3 (+ 2 (* 2 1) (* 3 0)) 2 1
;;;;;    (ackermann-tail 2 11 4 2)   ;; n=2 | 2 (+ 4 (* 2 2) (* 3 1)) 4 2
;;;;;;     n=2 => return h2 = 11     ;; STOP| RETURN 11