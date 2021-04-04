#lang racket

;; Funciones

;; En este archivo se muestra ejemplos de funciones matemáticas implementadas

;; Uso de cond
;; ----------------------------------------------------

;; (cond (p ...)                     if p then ... 
;;      (q ...)     equivale a       else if q then ... 
;;      (r ...)                      else if r then ... 
;;      ...                          ... 
;;      (t ...))                     else ...


;; Para imprimir por pantalla se puede utilizar la función (print "mensaje a imprimir")
;; Asimismo, se puede utilizar la función (write "mensaje a imprimir")

;; Todas las funciones que se implementen deben tener validaciones
;; Esto le da resiliencia a sus programas
;; Sus funciones y programas deben estar preparado para todos los casos bordes

;;; Función valor absoluto

;; El valor absoluto de un número X es:
;;   SI el número X es menor que 0 ENTONCES el valor absoluto es -X
;;   CASO CONTRARIO el valor absoluto es X

;; (define (abs x)
;;   (if ( < x 0)
;;      (- x)
;;       x))

;; En la siguiente implementación se hará uso de cond y se agrega validaciones
;; La validación es que el valor x ingresado sea un número

;; Descripción: Función que obtiene el absoluto de un valor
;; Dom: número x <number>
;; Rec: valor absoluto del número x <number>
;; Tipo de recursión: NA
(define abs
  (lambda (x)
    (cond
      [(and (number? x) (< x 0)) (- x)]
      [(not (number? x)) (write "Favor ingresar un número")]
      [x])))

;; Ejecución
(write "Ejecución: Función absoluta")
(newline)
;;; abs(0) = 0
(abs 0)
;;; abs(-0) = 0
(abs -0)
;;; abs(2) = 2
(abs 2)
;;; abs(-2) = 2
(abs -2)
;;; abs(3.1415) = 3.1415
(abs 3.1415)
;;; abs(-3.1415) = 3.1415
(abs -3.1415)
;;; abs("hola mundo") = no es válido, abs solo recibe números
;;; en este caso, para controlar errores simplemente vamos a imprimir un mensaje
;;; en pantalla indicando que debe ingresar un número
(abs "hola mundo")

(newline)

;;; TODO
;;; Función encriptar u ofuscar

;; Descripción: Función que obtiene el absoluto de un valor
;; Dom: número x <number>
;; Rec: valor absoluto del número x <number>
;; Tipo de recursión: NA

(define add-letter-to-head-list
  (lambda (message)
    (list "u" message)))

(define encrypt-add-letter
  (lambda (message)
    (cond
      [(string? message) (add-letter-to-head-list message)]
      [(write "Favor ingresar un mensaje string")])))

(define decrypt-add-letter
  (lambda (encripted-message)
    (cond
      [(list? encripted-message) (cdr encripted-message)]
      [(write "Favor ingresar mensaje codificado")])))

;; Ejecución
(write "Ejecución: Encriptar o ofuscar strings")
(newline)

(write "Mensaje 1")
(newline)

(encrypt-add-letter "Hello World!")