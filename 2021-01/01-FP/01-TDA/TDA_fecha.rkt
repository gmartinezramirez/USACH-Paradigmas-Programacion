#lang racket

; Paradigma funcional son estados inmutables
; La base del paradigma funcional son las funciones
; Spoiler: LIsp: LIst Processor, La unidad fundamental son las listas.

; Estados inmutables, y la unidad fundamental son las listas.
; Las listas son inmutables y cada cambio sobre ellas origina una nueva lista (estados)

;lista1: (element 1, e2, e3)
;add element to lista1
;lista2: (e1, e2, e3, e4)
;lista3: (e1, e2, e3)

; LISP = LOST IN A SEA OF PARENTHESIS
;(define nombre_funcion body_funcion)

;; Capa constructor del TDA
;; Fecha:   dia
;;          mes
;;          año

;; Dom: dia <number>, mes <number>, año <number>
;;  Rec: TDA Fecha

; Constructor sin validaciones
;(define fecha
;  (lambda (dia mes año)
;    (list dia mes año)))

(define fecha
  (lambda (dia mes año)
    (cond
      [(fecha? dia mes año) (list dia mes año)]
      [else '()])))


;; Decripción: Validación del TDA fecha
;; Dom: dia <number>, mes <number>, año <number>
;; Rec: boolean, true si los datos corresponden al TDA fecha
(define fecha?
  (lambda (dia mes año)
    (cond
      [(and (number? dia)
            (number? mes)
            (number? año))
       #t]
      [else #f])))


(define miercoles (fecha 21 4 2021))
(define jueves (fecha 22 4 2021))
(define miercoles_2 (fecha 28 4 2021))


;; if / cond
;; (cond) (lo que se ejecuta si cond es true)

;; Funciones con currificación

(define curry-fecha
  (lambda (dia)
    (lambda (mes)
      (lambda (año)
        (list dia mes año)))))

; dia 21  , mes 4, año 2021
(curry-fecha 21) ;RETORNA FUNCION

; dia 21  , mes 4, año 2021
((curry-fecha 21) 4)
;(funcion_1(4))
;(funcion_2()) ;RETORNA FUNCION

(((curry-fecha 21) 4) 2021)
;((funcion_1 4) 2021)
;(funcion_2 2021)
;'(21 4 2021)
