#lang racket

;; Función Map

;; Map es una función que te permite transformar los elementos de una lista y
;; que devuelve una nueva lista con los elementos transformados.

;; Los elementos resultantes no tienen por qué ser del mismo tipo que los originales.

;; Map finalmente retorna una nueva lista

;; Descripción: Función que aplica una función fn a todos y cada uno de los elementos
;;              de una lista lst
;; Dom: Función a aplicar a una colección de datos <función>,
;;      Lista de datos <lista>
;; Rec: Nueva lista con cada elemento
;; Tipo de recursión: Natural
(define (my-map fn lst)
  (cond
    [(empty? lst) '()] ; Si la lista es empty, retornar lista vacia
    [else (cons (fn (car lst)) ; Se forma un par. Primer elemento consiste en la función fn aplicada al primer elemento de la lista lst
                (my-map fn (cdr lst)))])) ; El segundo elemento es la llamada recursiva de la función my-map

;; fn(car lst) -> (cdr lst) -> '()
;; fn(car lst) -> fn(car (cdr lst)) -> (cdr lst) -> '()
;; fn(car lst) -> fn(car (cdr lst)) -> fn(car (cdr (cdr lst))) -> (cdr lst) -> '()
;; fn(car lst) -> fn(car (cdr lst)) -> fn(car (cdr (cdr lst))) -> fn(car (cdr (cdr (cdr lst))))  -> (cdr lst) -> '()

;; Ejemplos

;; Descripción: Función que verifica si todos y cada uno de los elementos de una lista lst
;;              es un tipo de dato string 
;; Dom: NA
;; Rec: lista de valores booleanos <list boolean>
;; Tipo de recursión: NA
;'(#f #f #t #f #f #t)
(my-map
 string? ;; Función fn
 (list 1 'en "en" 2 #t "to")) ;; Lista lst

;; Descripción: Función que calcula el doble de cada uno de los valores de una lista lst
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
;'(20 40 60 80)
(my-map
 (lambda (x) (* 2 x)) ;; Función fn
 (list 10 20 30 40))  ;; Lista lst

;; Descripción: Función currificada que suma dos valores, x y n
;; Dom: valor x <number>, valor n <number>
;; Rec: suma de valores <number>
;; Tipo de recursión: NA
(define increment-by
  (lambda (x)
    (lambda (n)
      (+ x n))))

;; Descripción: Función que incrementa en 1 todos los valores de una lista de números
;; Dom: lista de números <list numbers> 
;; Rec: lista de números <list numbers>
;; Tipo de recursión: NA
(define add-one-to-all
  (lambda (nums)
    (my-map (increment-by 1) nums)))

;'(2 3 4)
(add-one-to-all (list 1 2 3))