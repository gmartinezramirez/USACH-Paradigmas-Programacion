;; Copiar y pegar el siguiente código en DrRacket

;; StackOverflow es un sistema preguntas y respuestas (Q&A) que consta con los siguientes TDA
;; que contienen entidades en particular
;; TDA StackOverflow: id <numero, autoincremental>, usuarios <lista de usuarios>, preguntas <lista de preguntas>
;; TDA Usuario: id <numero, autoincremental>, username <string>, password <string>
;; TDA Preguntas: id <numero, autoincremental>, id usuario que hizo pregunta <numero>, contenido <string>
;;                cantidad de likes <numero> 

;; 1. Definir funcion de login y register. Luego, ejecutarlas.
;; 2. Definir funcion que simule la acción de que un usuario realice una pregunta Luego, ejecutarlas.
;; 3. Definir funcion que:
;;    3.1. Reciba como argumento, un numero que represente el minimo de likes y otro que represente el máximo de likes
;;    3.2. Retorne todas las preguntas cuyo número de likes entre el minimo y máximo entregaado
;; Considerar que un usuario solo puede realizar una pregunta si esta registrado y logueado
;; La pregunta debe ser agregada al listado de preguntas de StackOverflow y retornar un nuevo estado del mismo

;; TDA de referencia
;; Puede utilizar cualquier otro TDA, esto es solo de referencia

#lang racket

(define stackoverflow
  (lambda (id usuarios preguntas)
    (list id usuarios preguntas)))

(define usuario
  (lambda (id username password)
    (list id usuario password)))

; Pueden crear una pregunta con una cantidad de likes en particular
; o pueden crear una función para hacer likes, funcionaria como id autoincremental
(define pregunta
  (lambda (id usuario-id contenido cantidad-likes)
    (list id usuario-id contenido cantidad-likes)))

(define get-stack-id
  (lambda (stackoverflow)
    (car stackoverflow)))

(define get-usuario-id
  (lambda (usuario)
    (car usuario)))

(define get-pregunta-id
  (lambda (pregunta)
    (car pregunta)))

;; AGREGAR ACA FUNCIONES FALTANTES DEL TDA PARA LA RESOLUCIÓN DEL PROBLEMA

;; Ejecución
;; AGREGAR ACA LAS FUNCIONES QUE EJECUTEN SU PROGRAMA

(define mi-usuario-1
  (usuario 0 "mi-username-1" "mi-password-1"))

(define mi-usuario-2
  (usuario 1 "mi-username-2" "mi-password-2"))

(get-usuario-id mi-usuario-1)
(get-usuario-id mi-usuario-2)