#lang racket

;; Estudiante
;; Representación de estudiante:
;; nombre: str
;; edad: int
;; cantidad de reprobaciones: int
;; cantidad ramos tomados: int

;; Constructor
;; (estudiante nombre edad c_r c_t)
;; -> [nombre edad c_r c_t]
;; Dom: str x int x int x int
;; Rec: lista (str x int x int x int)
;; Ejemplo: (estudiante "gonzalo" 19 0 90)
(define estudiante
  (lambda (nombre edad c_r c_t)
    (list nombre edad c_r c_t)))

;; 2- selector
;; car: retornar el primer elemento de la lista
;; cdr: retornar el RESTO de la lista
;; Ejemplo: (get-nombre (estudiante "gonzalo" 1 1 1))
(define get-nombre
  (lambda (e)
    (car e)))

;; Ejemplo: (get-edad (estudiante "gonzalo" 1 1 1))
(define get-edad
  (lambda (e)
    (car (cdr e))))

;; Ejemplo: (get-cantidad-ramos-reprobados (estudiante "gonzalo" 1 4 10))
(define get-cantidad-ramos-reprobados
  (lambda (e)
    (car (cdr (cdr e)))))

;; Ejemplo: (get-cantidad-ramos-tomados (estudiante "gonzalo" 1 4 10))
(define get-cantidad-ramos-tomados
  (lambda (e)
    (car (cdr (cdr (cdr e))))))


;;; Pares
;; (a . b)
;; Lista: ( 1 2 3 )
;; (1 ( 2 ( 3 ())))


;; Lista: ( 1 2 3 4)
;; (1 (2 (3 (4 () ))))

;; Capa modificadora
;; Voy a tomar una lista 
;; (set-nombre (estudiante "gonzalo" 0 0 0) "Will Smith")

(define set-nombre
  (lambda (lista nuevo-nombre)
    (list nuevo-nombre
          (get-edad lista)
          (get-cantidad-ramos-reprobados lista)
          (get-cantidad-ramos-tomados lista))))


;; (set-edad (estudiante "gonzalo" 0 0 0) 20)
(define set-edad
  (lambda (lista nueva-edad)
    (list (get-nombre lista)
          nueva-edad
          (get-cantidad-ramos-reprobados lista)
          (get-cantidad-ramos-tomados lista))))

;; (set-aumentar-cantidad-ramos-reprobados (estudiante "gonzalo" 0 0 0))
(define set-aumentar-cantidad-ramos-reprobados
  (lambda (lista)
    (list (get-nombre lista)
          (get-edad lista)
          (+ 1 (get-cantidad-ramos-reprobados lista))
          (get-cantidad-ramos-tomados lista))))

;; Simbolos

(define mi-estudiante (estudiante "gonzalo" 1 1 1))

(define mi-estudiante-2 (set-edad mi-estudiante 90))

;; Agregar un elemento a la lista
;; 1. agregar al inicio
;; (a . ( b . ( c . ( d . null))
;; 2. agregar al final
;; (agregar-principio (list 1 2 3) 4)
(define agregar-principio
  (lambda (lista elemento)
    (cons elemento lista)))

;; input: 1 2 3    4
;; output: 1 2 3 4
;; (reverse 1 2 3) = 3 2 1
;; cons elemento (reverse 1 2 3) = 4 3 2 1
;; (reverse (cons elemento (reverse 1 2 3)) = 1 2 3 4
;; (agregar-final (list 1 2 3) 4)
(define agregar-final
  (lambda (lista elemento)
    (reverse (cons elemento (reverse lista)))))

