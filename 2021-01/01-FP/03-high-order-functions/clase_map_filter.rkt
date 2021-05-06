#lang racket

;; PREGUNTA 1
;;(retornar-elemento-por-indice 2 '(10 20 30 40 50)) ;; retorno: 30

;; car = elemento 1 cdr = resto de la lista
;; car (cdr)
;; DOM: number, lista
;; REC: number
;; Recursion: recursion por cola
(define retornar-elemento-por-indice
  (lambda (posicion lista)
    (if (= posicion 0) (car lista)
        (retornar-elemento-por-indice (- posicion 1) (cdr lista)))))

;; PREGUNTA 2
;; (agregar-sin-duplicados 10 '(10 20 30 40 50)) ;; retorno: '(10 20 30 40 50)

;; 2 funciones
;; filtro
;; agregar-sin-repetidos

;; Filtro
;; pred: funcion booleana
;; lista: lista que se aplica la funcion de filtro
;; Referencia: funcion vista en clase del profesor Gonzalo Martinez

(define mi-filtro
  (lambda (pred lista)
    (cond
      [(null? lista) null]
      [(pred(car lista))
       (cons (car lista) (mi-filtro pred (cdr lista)))]
      [else (mi-filtro pred (cdr lista))])))

(define es-mismo-elemento?
  (lambda (elemento-actual)
    (lambda (elemento-a-comparar)
    ((not (eq? elemento-actual elemento-a-comparar))))))

;(define agregar-sin-duplicados
;  (lambda (elemento lista)
;    (cons elemento (mi-filtro (es-mismo-elemento? elemento) lista))))

(define agregar-sin-duplicados
  (lambda (elemento lista)
    (cons elemento (mi-filtro
                    (lambda (e)
                      (not (eq? elemento e))) lista))))

;; n = 1
;; (1 2 3 4)
;; ()
;; (2)
;; (2 3)
;; (2 3 4)  ;; mi-filtro, esta es listra filtrada)
;; (cons elemento lista-filtrada)
;; (cons 1 (2 3 4))
;; (1 2 3 4)

;; lista, quiero agregar un elemento
;; (cons elemento lista) = (list elemento lista)

;; lista (list 1) = (cons 1 null)
;; (list 2 3) = (cons 2 (cons 3 null))
;; (list 2 3 4) = (cons 2 (cons 3 (cons 4 null)))

;; n = 10    (10 20 30 40 50)  (20 30 40 50)   cons 10 (20 30 40 50)

;; PREGUNTA 3
;; Referencia: funcion vista en clase del profesor Gonzalo Martinez
(define mi-map
  (lambda (funcion lista)
    (cond
      [(null? lista) null]
      [else (cons (funcion(car lista)) (mi-map funcion(cdr lista)))]
      )))

(define restar-un-uno
  (lambda (numero)
    ( - numero 1)))

(mi-map restar-un-uno '(10 20 30 40 50))


