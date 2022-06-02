#lang racket

;; Ejercicio:
;; Netflix es una plataforma que alberga peliculas
;; Peliculas: id año nombre tipo precio

;; 1. TDA

;; TDA Netflix
;; Dom: list peliculas

(define netflix
  (lambda (peliculas)
    (list peliculas)))

;; TDA Pelicula
(define pelicula
  (lambda (id año nombre precio tipo)
    (list id año nombre precio tipo)))

;; 2. Filtrar todas las peliculas de un cierto tipo
;;  platforma: netflix
;; Dado una lista de peliculas
;;  (list  (pelicula 0 1991 "Pulp Fiction" 7000 "accion")
;;          (pelicula 1 1999 "Star Wars Ep 1" 9000 "scifi"))
;;         (pelicula 2 2019 "Star Wars Ep 9 EL PEOR EPISODIO" 9000 "accion"))

(define solo-accion
  (lambda (netflix)
    (filter es-accion? netflix)))


(define es-accion?
  (lambda (pelicula)
    (cond
      [(eq? (get-tipo pelicula) "accion") #t]
      [else #f])))

;; "accion"
;; "comedia"
(define get-tipo
  (lambda (pelicula)
    (car (reverse pelicula))))
         
;; 3. Aplicar un descuento a todas las peliculas de un cierto tipo
;; Problema 1: Obtener todas las peliculas de un cierto tipo

;; Predicado
(define es-del-tipo?
  (lambda (pelicula tipo)
    (cond
      [(eq? (get-tipo pelicula) tipo) #t]
      [else #f])))

;;
;; (solo-peliculas-cierto-tipo mi-netflix "accion")
;; (solo-peliculas-cierto-tipo mi-netflix "drama")
;; (solo-peliculas-cierto-tipo mi-netflix "comedia")
(define solo-peliculas-cierto-tipo
  (lambda (netflix tipo)
    (filter (es-del-tipo? tipo) netflix)))

;; aplicar un descuento de 10 a todas las peliculas de accion
;; f(x) = x - 10
;; Netflix:
;;  (list  (pelicula 0 1991 "Pulp Fiction" 7000 "accion")
;;          (pelicula 1 1999 "Star Wars Ep 1" 9000 "scifi"))
;;         (pelicula 2 2019 "Star Wars Ep 9 EL PEOR EPISODIO" 9000 "accion"))
;; solo-peliculas-cierto-tipo
;;  (list  (pelicula 0 1991 "Pulp Fiction" 7000 "accion")
;;         (pelicula 2 2019 "Star Wars Ep 9 EL PEOR EPISODIO" 9000 "accion"))
;; aplicar-descuento-10-accion
;;  (list  (pelicula 0 1991 "Pulp Fiction" 6990 "accion")
;;         (pelicula 2 2019 "Star Wars Ep 9 EL PEOR EPISODIO" 8990 "accion"))

;; con funcion anonima
;(define aplicar-descuento-10-accion
;  (lambda (netflix)
;    (map (lambda (x) (- x 10))
;         (solo-peliculas-cierto-tipo netflix "accion"))))

(define aplicar-descuento-10-accion
  (lambda (netflix)
    (map aplicar-descuento-10
         (solo-peliculas-cierto-tipo netflix "accion"))))

(define aplicar-descuento-10
  (lambda (pelicula)
    (set-new-precio pelicula 10)))

;; input: (pelicula 0 "a" "accion" 1000)
;; output: (pelicula 0 "a" "accion" nuevo-precio

(define set-new-precio
  (lambda (elemento valor-descuento)
    (pelicula (get-id elemento)
              (get-nombre elemento)
              (- (get-precio elemento) valor-descuento)
              (get-tipo elemento))))
  

;; 4. Retornar la suma de los precios de las peliculas de accion
;; Se revisara en la clase del martes 12 de abril
;; Reduce